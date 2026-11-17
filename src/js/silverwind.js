import '../css/silverwind.css';

import Alpine from 'alpinejs';
import ajax from '@imacrayon/alpine-ajax';
import collapse from '@alpinejs/collapse';
import focus from '@alpinejs/focus';

import siteHeader from './components/site-header.js';
import cookieConsent from './components/cookie-consent.js';
import consentGate from './components/consent-gate.js';

Alpine.plugin(ajax);
Alpine.plugin(collapse);
Alpine.plugin(focus);

Alpine.data('siteHeader', siteHeader);
Alpine.data('cookieConsent', cookieConsent);

// Scripts and embeds waiting for cookie consent (Settings > Scripts, maps)
consentGate();

// Module scripts (e.g. silverwind-blocks) load after this one and register
// their components in an `alpine:init` listener, so start Alpine only once
// every module script has run: DOMContentLoaded fires after all of them.
window.Alpine = Alpine;

if (document.readyState === 'complete') {
  Alpine.start();
} else {
  document.addEventListener('DOMContentLoaded', () => Alpine.start(), { once: true });
}
