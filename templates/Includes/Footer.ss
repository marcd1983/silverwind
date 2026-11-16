<% cached 'sw-footer', $Locale, $CurrentPage.ID, $SiteConfig.LastEdited, $List('SilverStripe\LinkField\Models\Link').max('LastEdited'), $List('SilverStripe\LinkField\Models\Link').count(), $Locations.max('LastEdited'), $Locations.count() %>
<%-- Style, social links, locations and copyright: Settings > Theme > Footer --%>
<footer class="<% if $SiteConfig.ThemeFooterStyle == 'light' %>bg-base-200 text-base-content<% else_if $SiteConfig.ThemeFooterStyle == 'primary' %>bg-primary text-primary-content<% else %>bg-neutral text-neutral-content<% end_if %>" role="contentinfo">
    <div class="sw-container grid gap-10 py-12 sm:grid-cols-2 lg:grid-cols-4">
        <div class="space-y-4">
            <% include SiteBrand OnDark=$SiteConfig.ThemeFooterIsDark %>
            <% if $SiteConfig.Tagline %><p class="opacity-80">$SiteConfig.Tagline.XML</p><% end_if %>
            <% if $SiteConfig.ThemeFooterSocial != 'hide' %><% include SocialLinks %><% end_if %>
        </div>

        <% loop $MenuType('Footer') %>
            <% if $MenuItems %>
                <nav aria-label="$Name.ATT">
                    <h2 class="footer-title mb-3">$Name.XML</h2>
                    <ul class="space-y-2">
                        <% loop $MenuItems %>
                            <li><a href="$URL" class="link link-hover opacity-90"<% if $OpenInNew %> target="_blank" rel="noopener noreferrer"<% end_if %>>$Title.XML</a></li>
                        <% end_loop %>
                    </ul>
                </nav>
            <% end_if %>
        <% end_loop %>

        <% if $SiteConfig.ThemeFooterLocations != 'hide' %>
        <% loop $Locations %>
                <div>
                    <h2 class="footer-title mb-3"><%t Silverwind.ContactUs 'Contact us' %></h2>
                    <address class="space-y-1 not-italic opacity-90">
                        <% if $LocationName %><strong class="block">$LocationName.XML</strong><% end_if %>
                        <% if $Address %><span class="block">$Address.XML</span><% end_if %>
                        <% if $Address2 %><span class="block">$Address2.XML</span><% end_if %>
                        <% if $City || $State || $Zip %><span class="block">$City.XML<% if $City && $State %>, <% end_if %>$State.XML $Zip.XML</span><% end_if %>
                        <% if $Phone %><a href="tel:$Phone.ATT" class="link link-hover mt-2 block">$Phone.XML</a><% end_if %>
                    </address>
                    <% if $MapLinkURL %>
                        <a href="$MapLinkURL.ATT" class="btn btn-outline btn-sm mt-4" target="_blank" rel="noopener noreferrer"><%t Silverwind.ViewMap 'View map' %></a>
                    <% else_if $FullAddress %>
                        <a href="https://www.google.com/maps/search/?api=1&amp;query=$FullAddress.URLATT" class="btn btn-outline btn-sm mt-4" target="_blank" rel="noopener noreferrer"><%t Silverwind.ViewOnGoogleMaps 'View on Google Maps' %></a>
                    <% end_if %>
                </div>
            <% end_loop %>
        <% end_if %>
    </div>

    <div class="border-t border-current/15">
        <div class="sw-container flex flex-col gap-4 py-6 text-sm sm:flex-row sm:items-center sm:justify-between">
            <p class="opacity-70"><% if $SiteConfig.ThemeCopyrightText %>$SiteConfig.ThemeCopyrightText.XML<% else %>&copy; $Now.Year $SiteConfig.Title.XML<% end_if %></p>
            <% loop $MenuType('Bottom Footer') %>
                <% if $MenuItems %>
                    <ul class="flex flex-wrap gap-x-6 gap-y-2">
                        <% loop $MenuItems %>
                            <li><a href="$URL" class="link link-hover opacity-70 hover:opacity-100"<% if $OpenInNew %> target="_blank" rel="noopener noreferrer"<% end_if %>>$Title.XML</a></li>
                        <% end_loop %>
                    </ul>
                <% end_if %>
            <% end_loop %>
        </div>
    </div>
</footer>
<% end_cached %>
