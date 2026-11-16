<%--
    Site logo linking home. Pass OnDark=1 on a dark background: it uses the
    "Logo for dark backgrounds" (Settings > Theme > Header), or the site name
    as text, rather than a logo made for light backgrounds.
--%>
<a href="$BaseHref" class="flex items-center gap-3" rel="home">
    <% if $OnDark %>
        <% if $SiteConfig.ThemeLogoOnDark %>
            <% include Includes/LogoImage Logo=$SiteConfig.ThemeLogoOnDark %>
        <% else %>
            <span class="font-heading text-xl font-bold">$SiteConfig.Title.XML</span>
        <% end_if %>
    <% else_if $SiteConfig.SiteLogo %>
        <% include Includes/LogoImage Logo=$SiteConfig.SiteLogo %>
    <% else %>
        <span class="font-heading text-xl font-bold">$SiteConfig.Title.XML</span>
    <% end_if %>
</a>
