<% if not $HideChildren %>
    <% if $Children %>
        <ul class="grid gap-6 sm:grid-cols-2 lg:grid-cols-$ChildGridColumns">
            <% loop $Children %>
                <li><% include Card %></li>
            <% end_loop %>
        </ul>
    <% end_if %>
<% end_if %>
