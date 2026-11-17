<!DOCTYPE html>
<html lang="$ContentLocale" data-theme="silverwind">
<% require themedCSS('dist/silverwind') %>
<% require themedJavascript('dist/silverwind', 'module') %>
<% include DocumentHeader %>
<body class="$ClassName.ShortName flex min-h-screen flex-col bg-base-100 text-base-content antialiased"<% if $i18nScriptDirection %> dir="$i18nScriptDirection"<% end_if %>>
    <a href="#main-content" class="sw-skip-link"><%t Silverwind.SkipToContent 'Skip to content' %></a>
    <% if $SiteConfig.BodyScripts %>$SiteConfig.BodyScripts.RAW<% end_if %>

    <% include Header %>

    <main id="main-content" tabindex="-1" class="flex-1 focus:outline-none">
        $PageSlider
        $Layout
    </main>

    <%-- Project hook for content between the page and the footer (e.g. a site-wide call-to-action). Outside the footer's cache, so it can vary per page and by date --%>
    $BeforeFooter

    <% include Footer %>
    <% include CookieConsent %>

    <% if $SiteConfig.FooterScripts %>$SiteConfig.FooterScripts.RAW<% end_if %>
    <% if $HasPerm('CMS_ACCESS') %>$SilverStripeNavigator<% end_if %>
</body>
</html>
