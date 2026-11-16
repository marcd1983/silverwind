/**
 * Header navigation: desktop dropdown / mega panels and the mobile menu.
 *
 * Only one desktop panel is open at a time, tracked by `open` (a menu id
 * such as a page ID, "search" or "account"). On devices with a real hover,
 * panels also open on pointer hover with a short close delay so moving the
 * mouse from the trigger into the panel doesn't close it.
 */
const HOVER_CLOSE_DELAY = 200;

export default () => ({
  open: null,
  mobileOpen: false,
  closeTimer: null,
  canHover: window.matchMedia('(hover: hover) and (pointer: fine)').matches,

  init() {
    // Settings > Theme > Header: "Drop-down menus open on click only"
    if (this.$el.dataset.hover === 'false') {
      this.canHover = false;
    }
  },

  isOpen(id) {
    return this.open === String(id);
  },

  toggle(id) {
    this.cancelClose();
    this.open = this.isOpen(id) ? null : String(id);
  },

  enter(id) {
    if (!this.canHover) return;
    this.cancelClose();
    this.open = String(id);
  },

  leave() {
    if (!this.canHover) return;
    this.cancelClose();
    this.closeTimer = setTimeout(() => {
      this.open = null;
    }, HOVER_CLOSE_DELAY);
  },

  cancelClose() {
    clearTimeout(this.closeTimer);
  },

  close(returnFocus = false) {
    const id = this.open;
    this.open = null;
    if (returnFocus && id) {
      this.$root.querySelector(`[data-menu-toggle="${id}"]`)?.focus();
    }
  },

  // Close when focus moves out of the open item (e.g. tabbing past it)
  focusOut(event) {
    if (!this.open) return;
    const item = this.$root.querySelector(`[data-menu-item="${this.open}"]`);
    if (item && !item.contains(event.relatedTarget)) {
      this.open = null;
    }
  },

  openMobile() {
    this.close();
    this.mobileOpen = true;
  },

  closeMobile() {
    this.mobileOpen = false;
    this.$nextTick(() => this.$refs.mobileToggle?.focus());
  },
});
