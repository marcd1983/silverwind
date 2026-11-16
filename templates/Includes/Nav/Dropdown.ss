<div id="nav-panel-$ID" x-show="isOpen('$ID')" x-cloak x-transition.opacity.duration.150ms class="absolute top-full left-0 z-50 pt-2">
    <ul class="menu w-64 rounded-box border border-base-300 bg-base-100 p-2 text-base-content shadow-lg">
        <% loop $Children %>
            <li>
                <a href="$Link" class="<% if $LinkingMode == 'current' %>menu-active<% else_if $LinkingMode == 'section' %>font-semibold<% end_if %>"<% if $LinkingMode == 'current' %> aria-current="page"<% end_if %><% if $OpenInNew %> target="_blank" rel="noopener noreferrer"<% end_if %>>$MenuTitle.XML</a>
                <% if $Children %>
                    <ul>
                        <% loop $Children %>
                            <li><a href="$Link" class="<% if $LinkingMode == 'current' %>menu-active<% end_if %>"<% if $LinkingMode == 'current' %> aria-current="page"<% end_if %><% if $OpenInNew %> target="_blank" rel="noopener noreferrer"<% end_if %>>$MenuTitle.XML</a></li>
                        <% end_loop %>
                    </ul>
                <% end_if %>
            </li>
        <% end_loop %>
    </ul>
</div>
