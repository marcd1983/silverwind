<%-- A logo image at the Theme > Header logo size. Pass Logo=(Image) --%>
<% with $Logo %>
    <img src="<% if $Extension == 'svg' %>$URL<% else %>$ScaleMaxHeight(112).URL<% end_if %>" alt="$Top.SiteConfig.Title.ATT" class="<% if $Top.SiteConfig.ThemeLogoSize == 'sm' %>h-8<% else_if $Top.SiteConfig.ThemeLogoSize == 'lg' %>h-12 lg:h-14<% else %>h-10<% end_if %> w-auto">
<% end_with %>
