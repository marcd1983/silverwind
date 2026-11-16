<% cached 'sw-header', $Locale, $CurrentPage.ID, $CurrentMember.ID, $SiteConfig.LastEdited, $List('SilverStripe\CMS\Model\SiteTree').max('LastEdited'), $List('SilverStripe\CMS\Model\SiteTree').count(), $List('SilverStripe\LinkField\Models\Link').max('LastEdited'), $List('SilverStripe\LinkField\Models\Link').count() %>
<%-- Style, scrolling, width, logo, search and menu behaviour: Settings > Theme > Header --%>
<header x-data="siteHeader" @keydown.escape.window="mobileOpen ? closeMobile() : close(true)"
        data-header-style="<% if $SiteConfig.ThemeHeaderStyle %>$SiteConfig.ThemeHeaderStyle<% else %>light<% end_if %>"<% if $SiteConfig.ThemeMenuOpen == 'click' %> data-hover="false"<% end_if %>
        class="<% if $SiteConfig.ThemeHeaderBehaviour == 'static' %>relative<% else %>sticky top-0<% end_if %> z-40 <% if $SiteConfig.ThemeHeaderStyle == 'dark' %>bg-neutral text-neutral-content<% else_if $SiteConfig.ThemeHeaderStyle == 'primary' %>bg-primary text-primary-content<% else %>border-b border-base-300 bg-base-100/95 backdrop-blur<% end_if %>">
    <nav class="<% if $SiteConfig.ThemeHeaderWidth == 'full' %>w-full px-gutter<% else %>sw-container<% end_if %> flex h-16 items-center gap-6 lg:h-20" aria-label="<%t Silverwind.MainNavigation 'Main' %>">
        <div class="flex-none">
            <% include SiteBrand OnDark=$SiteConfig.ThemeHeaderIsDark %>
        </div>

        <%-- Desktop --%>
        <ul class="hidden flex-1 items-center gap-1 lg:flex">
            <% loop $Menu(1) %>
                <li class="<% if $MegaMenuLayout == 'Dropdown' || not $MegaMenuLayout %>relative<% end_if %>" data-menu-item="$ID" @mouseenter="enter('$ID')" @mouseleave="leave()" @focusout="focusOut(\$event)" @click.outside="isOpen('$ID') && close()">
                    <%-- Link and arrow read as one item: no button backgrounds, one shared hover/open colour --%>
                    <%-- sw-nav-item / sw-nav-active: dark and brand headers restyle these (layout.css), as primary-coloured text wouldn't show --%>
                    <div class="sw-nav-item group flex items-center transition-colors hover:text-primary<% if $LinkingMode != 'link' %> sw-nav-active text-primary<% end_if %>" :class="isOpen('$ID') && 'text-primary'">
                        <a href="$Link" class="inline-flex h-10 items-center rounded-field px-3 font-medium focus-visible:outline-2 focus-visible:outline-offset-2 focus-visible:outline-primary"<% if $LinkingMode == 'current' %> aria-current="page"<% end_if %><% if $OpenInNew %> target="_blank" rel="noopener noreferrer"<% end_if %>>$MenuTitle.XML</a>
                        <% if $Children %>
                            <button type="button" class="-ml-2 inline-flex size-8 cursor-pointer items-center justify-center rounded-field focus-visible:outline-2 focus-visible:outline-offset-2 focus-visible:outline-primary" data-menu-toggle="$ID" @click="toggle('$ID')" :aria-expanded="isOpen('$ID')" aria-controls="nav-panel-$ID">
                                <span class="sr-only"><%t Silverwind.ShowSubmenu 'Show {title} submenu' title=$MenuTitle.XML %></span>
                                <svg class="size-4 transition-transform" :class="isOpen('$ID') && 'rotate-180'" viewBox="0 0 20 20" fill="currentColor" aria-hidden="true"><path fill-rule="evenodd" d="M5.22 8.22a.75.75 0 0 1 1.06 0L10 11.94l3.72-3.72a.75.75 0 1 1 1.06 1.06l-4.25 4.25a.75.75 0 0 1-1.06 0L5.22 9.28a.75.75 0 0 1 0-1.06Z" clip-rule="evenodd"/></svg>
                            </button>
                        <% end_if %>
                    </div>
                    <% if $Children %>
                        <% if $MegaMenuLayout == 'Tabs' %>
                            <% include Includes/Nav/MegaTabs %>
                        <% else_if $MegaMenuLayout == 'List' %>
                            <% include Includes/Nav/MegaList %>
                        <% else_if $MegaMenuLayout == 'Gallery' %>
                            <% include Includes/Nav/MegaGallery %>
                        <% else %>
                            <% include Includes/Nav/Dropdown %>
                        <% end_if %>
                    <% end_if %>
                </li>
            <% end_loop %>
        </ul>

        <div class="ml-auto flex items-center gap-1">
            <% if $SiteConfig.ThemeHeaderSearch != 'hide' %><% include Includes/Nav/Search %><% end_if %>
            <% include Includes/Nav/Account %>
            <% if $MenuType('Header Right') %>
                <div class="ml-2 hidden items-center gap-2 lg:flex">
                    <% loop $MenuType('Header Right') %>
                        <% loop $MenuItems %>
                            <% include LinkButton Size='btn-sm' %>
                        <% end_loop %>
                    <% end_loop %>
                </div>
            <% end_if %>
            <button type="button" x-ref="mobileToggle" @click="openMobile()" class="btn btn-ghost btn-square lg:hidden" :aria-expanded="mobileOpen" aria-controls="mobile-menu">
                <span class="sr-only"><%t Silverwind.OpenMenu 'Open menu' %></span>
                <svg class="size-6" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="1.5" aria-hidden="true"><path stroke-linecap="round" stroke-linejoin="round" d="M3.75 6.75h16.5M3.75 12h16.5m-16.5 5.25h16.5"/></svg>
            </button>
        </div>
    </nav>

    <%--
        Rendered at the end of <body>, outside the header: the header's
        backdrop-blur makes it the containing block for position:fixed
        children, which would squash the menu into the 64px header bar.
        Teleported content stays part of this Alpine component.
    --%>
    <template x-teleport="body">
        <% include Includes/Nav/MobileMenu %>
    </template>
</header>
<% end_cached %>
