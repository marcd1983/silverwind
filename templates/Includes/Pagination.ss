<%-- Usage: <% include Pagination List=$Results %> (any PaginatedList) --%>
<% if $List.MoreThanOnePage %>
    <nav class="mt-10 flex justify-center" aria-label="<%t Silverwind.Pagination 'Pagination' %>">
        <div class="join">
            <% if $List.NotFirstPage %>
                <a class="join-item btn" href="$List.PrevLink" rel="prev"><span aria-hidden="true">&laquo;</span><span class="sr-only"><%t Silverwind.Previous 'Previous page' %></span></a>
            <% end_if %>
            <% loop $List.PaginationSummary(4) %>
                <% if $CurrentBool %>
                    <span class="join-item btn btn-active" aria-current="page">$PageNum</span>
                <% else_if $Link %>
                    <a class="join-item btn" href="$Link">$PageNum</a>
                <% else %>
                    <span class="join-item btn btn-disabled">&hellip;</span>
                <% end_if %>
            <% end_loop %>
            <% if $List.NotLastPage %>
                <a class="join-item btn" href="$List.NextLink" rel="next"><span aria-hidden="true">&raquo;</span><span class="sr-only"><%t Silverwind.Next 'Next page' %></span></a>
            <% end_if %>
        </div>
    </nav>
<% end_if %>
