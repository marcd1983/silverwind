# Silverwind

A Silverstripe CMS 6 theme built on Tailwind CSS 4, daisyUI 5, Alpine.js and
Alpine AJAX. Pairs with:

- [antlion/silverwind-settings](../../../antlion-modules/silverwind-settings): colours, fonts and layout from the CMS
- [antlion/silverwind-blocks](../../../antlion-modules/silverwind-blocks): Elemental content blocks

## Build

```sh
npm install
npm run build      # or: npm run dev (watch)
```

Vite writes `dist/silverwind.css`, `dist/silverwind.js` and `dist/editor.css`
(the TinyMCE content stylesheet). `dist/` is committed so composer installs
don't need Node.

## How it fits together

- **This theme builds all the CSS.** Tailwind's automatic source detection is
  off. Only the paths listed with `@source` in `src/css/silverwind.css` are
  scanned: this theme's templates, the project's `app/templates`, and
  silverwind-blocks. A module that ships Tailwind templates needs its own
  `@source` line, then a rebuild.
- **Design tokens** (colours, fonts, container width, spacing, radii) are in
  `src/css/theme.css` as daisyUI theme and Tailwind `@theme` variables.
  silverwind-settings overrides the same variables at runtime, so always use
  the token classes (`bg-primary`, `font-heading`, `max-w-site`, `max-w-narrow`, `py-section`,
  `rounded-box`) rather than raw values.
- **Page width is per block, not per page.** Layouts render the block area
  full width; each top-level block chooses Site width / Narrow / Full width
  (silverwind-blocks). The theme's `layout.css` handles the spacing rhythm
  between blocks (`sw-auto-top`, `sw-auto-bottom`, `sw-band`, in the
  utilities layer so they can override a block's margin utility).
- **Alpine** is exposed as `window.Alpine` and started on `DOMContentLoaded`,
  after module scripts have registered their components in `alpine:init`.
- **Forms:** Silverstripe's default form markup (core forms, userforms) is
  styled in `src/css/forms.css`, so form templates don't need overriding.

## Templates

| Template | Purpose |
|---|---|
| `Page.ss` | Document shell: skip link, header, `$PageSlider`, `$Layout`, `$BeforeFooter` (optional project hook, e.g. a site-wide CTA band), footer, cookie consent |
| `Includes/Header.ss` + `Includes/Nav/*` | Desktop dropdown and mega menus (per page: Dropdown, List, Gallery, Tabs), search, account menu, mobile menu |
| `Includes/Footer.ss` | Footer menu sets, store locations, bottom links, social links |
| `Layout/Page.ss`, `BlockPage.ss`, `HomePage.ss`, `Page_results.ss` | Page layouts and search results |
| `DNADesign/Elemental/...` | Element holder (spacing from silverwind-blocks) and area wrapper |
| `Includes/LinkButton.ss` | A linkfield Link as a button |
| `Innoweb/CookieConsent/...`, `Includes/CookieConsent.ss` | Cookie policy page and consent banner |
# silverwind
