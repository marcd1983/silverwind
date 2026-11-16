<%-- Overrides innoweb/silverstripe-cookie-consent's include; behaviour lives in src/js/components/cookie-consent.js --%>
<% if $PromptCookieConsent %>
<div x-data="cookieConsent" x-show="visible" x-transition.opacity role="dialog" aria-labelledby="cookieconsent-title"
     class="fixed inset-x-0 bottom-0 z-50 p-4"
     data-cookie="$CookieConsentCookieName" data-expiry="$CookieConsentCookieExpiry"<% if $AdditionalDomainsCookiesEnabled %> data-additional-host-links="<% loop $AdditionalHosts %>$BaseLink<% if not $IsLast %>,<% end_if %><% end_loop %>"<% end_if %>>
    <div class="card mx-auto max-w-3xl border border-base-300 bg-base-100 shadow-xl">
        <div class="card-body gap-3">
            <h2 class="card-title" id="cookieconsent-title">$SiteConfig.CookieConsentTitle</h2>
            <div class="prose prose-sm max-w-none">$SiteConfig.CookieConsentContent</div>
            <div class="card-actions mt-2 flex-wrap">
                <% if $SiteUsesNecessaryCookiesOnly %>
                    <a class="btn btn-primary" href="$AcceptNecessaryCookiesLink" rel="nofollow" data-cookie-groups="Necessary" @click.prevent="accept">
                        <%t Innoweb\\CookieConsent\\CookieConsent.AcceptNecessaryCookies 'Accept necessary cookies' %>
                    </a>
                    <a class="btn btn-ghost" href="$CookiePolicyPage.Link" rel="nofollow">
                        <%t Innoweb\\CookieConsent\\CookieConsent.ReviewCookiePolicy 'Review cookie policy' %>
                    </a>
                <% else %>
                    <a class="btn btn-primary" href="$AcceptAllCookiesLink" rel="nofollow" data-cookie-groups="$AcceptAllCookiesGroups" @click.prevent="accept">
                        <%t Innoweb\\CookieConsent\\CookieConsent.AcceptAllCookies 'Accept all cookies' %>
                    </a>
                    <a class="btn btn-outline" href="$AcceptNecessaryCookiesLink" rel="nofollow" data-cookie-groups="Necessary" @click.prevent="accept">
                        <%t Innoweb\\CookieConsent\\CookieConsent.AcceptOnlyNecessaryCookies 'Accept only necessary cookies' %>
                    </a>
                    <a class="btn btn-ghost" href="$CookiePolicyPage.Link" rel="nofollow">
                        <%t Innoweb\\CookieConsent\\CookieConsent.ManageCookies 'Manage cookie settings' %>
                    </a>
                <% end_if %>
            </div>
        </div>
    </div>
</div>
<% end_if %>
<% if $SetAdditionalDomainsCookies %>
    <% loop $AdditionalHosts %>
        <img src="$FullLink" width="1" height="1" alt="" class="hidden">
    <% end_loop %>
<% end_if %>
