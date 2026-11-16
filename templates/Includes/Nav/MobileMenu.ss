<%-- The wrapper fades as a whole (backdrop included) while the panel slides, so closing animates too --%>
<div id="mobile-menu" x-show="mobileOpen" x-cloak x-transition.opacity.duration.200ms class="fixed inset-0 z-50 lg:hidden" role="dialog" aria-modal="true" aria-label="<%t Silverwind.Menu 'Menu' %>">
    <div class="absolute inset-0 bg-black/40" @click="closeMobile()" aria-hidden="true"></div>
    <div x-show="mobileOpen" x-trap.inert.noscroll="mobileOpen"
         x-transition:enter="transition ease-out duration-200" x-transition:enter-start="translate-x-full" x-transition:enter-end="translate-x-0"
         x-transition:leave="transition ease-in duration-150" x-transition:leave-start="translate-x-0" x-transition:leave-end="translate-x-full"
         class="absolute inset-y-0 right-0 flex w-full max-w-sm flex-col overflow-y-auto bg-base-100 p-4 shadow-xl">
        <div class="mb-4 flex items-center justify-between">
            <% include SiteBrand %>
            <button type="button" class="btn btn-ghost btn-square" @click="closeMobile()">
                <span class="sr-only"><%t Silverwind.CloseMenu 'Close menu' %></span>
                <svg class="size-6" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="1.5" aria-hidden="true"><path stroke-linecap="round" stroke-linejoin="round" d="M6 18 18 6M6 6l12 12"/></svg>
            </button>
        </div>

        <ul class="menu w-full p-0 text-base">
            <% loop $Menu(1) %>
                <% if $Children %>
                    <li>
                        <details<% if $LinkingMode == 'section' %> open<% end_if %>>
                            <summary class="font-medium">$MenuTitle.XML</summary>
                            <ul>
                                <li><a href="$Link"<% if $LinkingMode == 'current' %> class="menu-active" aria-current="page"<% end_if %>><%t Silverwind.Overview 'Overview' %></a></li>
                                <% loop $Children %>
                                    <% if $Children %>
                                        <li>
                                            <details<% if $LinkingMode == 'section' %> open<% end_if %>>
                                                <summary>$MenuTitle.XML</summary>
                                                <ul>
                                                    <li><a href="$Link"<% if $LinkingMode == 'current' %> class="menu-active" aria-current="page"<% end_if %>><%t Silverwind.AllOf 'All {title}' title=$MenuTitle.XML %></a></li>
                                                    <% loop $Children %>
                                                        <li><a href="$Link"<% if $LinkingMode == 'current' %> class="menu-active" aria-current="page"<% end_if %><% if $OpenInNew %> target="_blank" rel="noopener noreferrer"<% end_if %>>$MenuTitle.XML</a></li>
                                                    <% end_loop %>
                                                </ul>
                                            </details>
                                        </li>
                                    <% else %>
                                        <li><a href="$Link"<% if $LinkingMode == 'current' %> class="menu-active" aria-current="page"<% end_if %><% if $OpenInNew %> target="_blank" rel="noopener noreferrer"<% end_if %>>$MenuTitle.XML</a></li>
                                    <% end_if %>
                                <% end_loop %>
                            </ul>
                        </details>
                    </li>
                <% else %>
                    <li><a href="$Link" class="font-medium<% if $LinkingMode == 'current' %> menu-active<% end_if %>"<% if $LinkingMode == 'current' %> aria-current="page"<% end_if %><% if $OpenInNew %> target="_blank" rel="noopener noreferrer"<% end_if %>>$MenuTitle.XML</a></li>
                <% end_if %>
            <% end_loop %>
        </ul>

        <% if $MenuType('Header Right') %>
            <div class="mt-6 flex flex-col gap-2">
                <% loop $MenuType('Header Right') %>
                    <% loop $MenuItems %>
                        <% include LinkButton Block=1 %>
                    <% end_loop %>
                <% end_loop %>
            </div>
        <% end_if %>
    </div>
</div>
