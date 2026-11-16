/**
 * Port of innoweb/silverstripe-cookie-consent's inline popup script.
 *
 * Expects the popup element to carry data-cookie, data-expiry and,
 * optionally, data-additional-host-links; each button carries
 * data-cookie-groups and links to the module's accept endpoint.
 */
export default () => ({
  visible: true,

  init() {
    const name = this.$el.dataset.cookie;
    if (document.cookie.match(new RegExp(`(^| )${name}=([^;]+)`))) {
      this.visible = false;
    }
  },

  accept(event) {
    const button = event.currentTarget;
    const { cookie: name, expiry, additionalHostLinks } = this.$el.dataset;
    const groups = button.dataset.cookieGroups;

    // Let the server record the choice too (same request the module makes)
    fetch(button.href, {
      headers: { 'X-Requested-With': 'XMLHttpRequest' },
      credentials: 'same-origin',
    });

    const expires = new Date(Date.now() + 864e5 * Number(expiry));
    document.cookie = `${name}=${groups};path=/;expires=${expires.toUTCString()}`;

    (additionalHostLinks || '')
      .split(',')
      .map((url) => url.trim())
      .filter(Boolean)
      .forEach((url) => {
        const img = new Image(1, 1);
        img.alt = '';
        img.className = 'hidden';
        img.src = url + groups;
        document.body.append(img);
      });

    document.dispatchEvent(
      new CustomEvent('updateCookieConsent', { detail: { groups: groups.split(',') } }),
    );

    this.visible = false;
  },
});
