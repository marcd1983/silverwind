<div class="relative" data-menu-item="search" @focusout="focusOut(\$event)" @click.outside="isOpen('search') && close()">
    <button type="button" class="btn btn-ghost btn-square" data-menu-toggle="search" @click="toggle('search'); isOpen('search') && \$nextTick(() => \$refs.searchPanel.querySelector('input[type=search]')?.focus())" :aria-expanded="isOpen('search')" aria-controls="nav-panel-search">
        <span class="sr-only"><%t Silverwind.Search 'Search' %></span>
        <svg class="size-5" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="1.75" aria-hidden="true"><path stroke-linecap="round" stroke-linejoin="round" d="m21 21-5.197-5.197m0 0A7.5 7.5 0 1 0 5.196 5.196a7.5 7.5 0 0 0 10.607 10.607Z"/></svg>
    </button>
    <div id="nav-panel-search" x-ref="searchPanel" x-show="isOpen('search')" x-cloak x-transition.opacity.duration.150ms class="absolute top-full right-0 z-50 mt-2 w-80 rounded-box border border-base-300 bg-base-100 p-4 text-base-content shadow-lg">
        <% uncached %><% include Includes/Nav/SearchForm %><% end_uncached %>
        <% if $MenuType('Quick Links') %>
            <p class="mt-4 mb-1 text-xs font-semibold tracking-wide uppercase opacity-60"><%t Silverwind.QuickLinks 'Quick links' %></p>
            <ul class="menu w-full p-0">
                <% loop $MenuType('Quick Links') %>
                    <% loop $MenuItems %>
                        <li><a href="$URL"<% if $OpenInNew %> target="_blank" rel="noopener noreferrer"<% end_if %>>$Title.XML</a></li>
                    <% end_loop %>
                <% end_loop %>
            </ul>
        <% end_if %>
    </div>
</div>
