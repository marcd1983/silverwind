<% include PageHeader %>
<div class="sw-container pb-section">
    <div class="prose max-w-3xl">
        $Content
        <h2><%t Innoweb\\CookieConsent\\Pages\\CookiePolicyPage.ManageCookies 'Manage Cookies' %></h2>
    </div>
    <div class="mt-4 max-w-3xl">$Form</div>
    <% if $SiteConfig.CookieGroups %>
        <div class="prose mt-10 max-w-3xl">
            <h2><%t Innoweb\\CookieConsent\\Pages\\CookiePolicyPage.CookiesUsed 'Cookies used on this website' %></h2>
        </div>
        <% loop $SiteConfig.CookieGroups %>
            <section class="mt-8 max-w-5xl">
                <h3 class="text-xl font-semibold">$Title</h3>
                <div class="prose mt-2 max-w-3xl">$Content</div>
                <div class="mt-4 overflow-x-auto rounded-box border border-base-300">
                    <table class="table">
                        <thead>
                            <tr>
                                <th><%t Innoweb\\CookieConsent\\Model\\CookieGroup.Title 'Cookie Name' %></th>
                                <th><%t Innoweb\\CookieConsent\\Model\\CookieGroup.Provider 'Placed by' %></th>
                                <th><%t Innoweb\\CookieConsent\\Model\\CookieGroup.Purpose 'Purpose' %></th>
                                <th><%t Innoweb\\CookieConsent\\Model\\CookieGroup.Expiry 'Expiry' %></th>
                            </tr>
                        </thead>
                        <tbody>
                            <% loop $Cookies %>
                                <tr>
                                    <td>$Title</td>
                                    <td>$ProviderLabel</td>
                                    <td>$Purpose</td>
                                    <td>$Expiry</td>
                                </tr>
                            <% end_loop %>
                        </tbody>
                    </table>
                </div>
            </section>
        <% end_loop %>
    <% end_if %>
    <% if $FooterContent %><div class="prose mt-10 max-w-3xl">$FooterContent</div><% end_if %>
</div>
