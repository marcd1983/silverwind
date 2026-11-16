<% if $MenuType('Account') %>
    <div class="relative" data-menu-item="account" @mouseenter="enter('account')" @mouseleave="leave()" @focusout="focusOut(\$event)" @click.outside="isOpen('account') && close()">
        <button type="button" class="btn btn-ghost btn-square" data-menu-toggle="account" @click="toggle('account')" :aria-expanded="isOpen('account')" aria-controls="nav-panel-account">
            <span class="sr-only"><%t Silverwind.Account 'Account' %></span>
            <svg class="size-5" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="1.75" aria-hidden="true"><path stroke-linecap="round" stroke-linejoin="round" d="M15.75 6a3.75 3.75 0 1 1-7.5 0 3.75 3.75 0 0 1 7.5 0ZM4.501 20.118a7.5 7.5 0 0 1 14.998 0A17.933 17.933 0 0 1 12 21.75c-2.676 0-5.216-.584-7.499-1.632Z"/></svg>
        </button>
        <div id="nav-panel-account" x-show="isOpen('account')" x-cloak x-transition.opacity.duration.150ms class="absolute top-full right-0 z-50 pt-2">
            <ul class="menu w-56 rounded-box border border-base-300 bg-base-100 p-2 text-base-content shadow-lg">
                <% loop $MenuType('Account') %>
                    <% loop $MenuItems %>
                        <li><a href="$URL"<% if $OpenInNew %> target="_blank" rel="noopener noreferrer"<% end_if %>>$Title.XML</a></li>
                    <% end_loop %>
                <% end_loop %>
            </ul>
        </div>
    </div>
<% end_if %>
