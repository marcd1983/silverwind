<% if $SearchForm %>
    <div class="sw-search">
        <% with $SearchForm %>
            <form $AttributesHTML role="search">
                <div class="join w-full">
                    <% loop $Fields %>$Field<% end_loop %>
                    <% loop $Actions %>$Field<% end_loop %>
                </div>
            </form>
        <% end_with %>
    </div>
<% end_if %>
