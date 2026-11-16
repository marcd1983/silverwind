<% if $Pages %>
    <nav class="breadcrumbs mb-2 text-sm opacity-80" aria-label="<%t Silverwind.Breadcrumb 'Breadcrumb' %>">
        <ul>
            <% loop $Pages %>
                <% if $IsLast %>
                    <li><span aria-current="page">$MenuTitle.XML</span></li>
                <% else_if $Up.Unlinked %>
                    <li>$MenuTitle.XML</li>
                <% else %>
                    <li><a href="$Link">$MenuTitle.XML</a></li>
                <% end_if %>
            <% end_loop %>
        </ul>
    </nav>
<% end_if %>
