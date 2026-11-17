/**
 * Switches on content that waits for cookie consent.
 *
 * The server prints anything that needs a consent group the visitor hasn't
 * accepted in an inert form, tagged with data-cookie-consent="Group":
 *
 *   <script type="text/plain" data-cookie-consent="Analytics" [data-src] [data-type]>
 *   <iframe|img data-cookie-consent="External" data-src="…">
 *   <link data-cookie-consent="Marketing" data-href="…">
 *
 * This activates them for groups in the consent cookie on page load (e.g.
 * when the HTML came from a cache) and as soon as the visitor accepts in the
 * banner (the cookie-consent component's updateCookieConsent event), so no
 * reload is needed. Scripts run in document order, like they would have.
 */

const activated = new WeakSet();

function consentedGroups() {
  const name = document.body?.dataset.consentCookie || 'CookieConsent';
  const match = document.cookie.match(new RegExp(`(?:^|; )${name}=([^;]*)`));

  return match ? decodeURIComponent(match[1]).split(',').filter(Boolean) : [];
}

// A copy of an inert <script> that the browser will run
function runnableScript(inert) {
  const script = document.createElement('script');
  for (const { name, value } of inert.attributes) {
    if (name === 'type' || name === 'data-cookie-consent') continue;
    if (name === 'data-type') {
      script.type = value;
    } else if (name === 'data-src') {
      script.src = value;
    } else {
      script.setAttribute(name, value);
    }
  }
  // Dynamically inserted scripts are async by default; keep document order
  if (script.src && !inert.hasAttribute('async')) script.async = false;
  script.text = inert.text;

  return script;
}

export function activate(groups) {
  if (!groups.length) return;

  const selector = groups
    .map((group) => `[data-cookie-consent="${CSS.escape(group)}"]`)
    .join(',');

  for (const el of document.querySelectorAll(selector)) {
    if (activated.has(el)) continue;
    activated.add(el);

    if (el.tagName === 'SCRIPT') {
      el.replaceWith(runnableScript(el));
    } else if (el.dataset.src) {
      el.src = el.dataset.src;
    } else if (el.dataset.href) {
      el.href = el.dataset.href;
    }
    el.dispatchEvent?.(new CustomEvent('consent-activated', { bubbles: true }));
  }
}

export default function consentGate() {
  activate(consentedGroups());
  document.addEventListener('updateCookieConsent', (event) => {
    activate(event.detail?.groups ?? consentedGroups());
  });
}
