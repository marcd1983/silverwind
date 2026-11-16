<div class="sw-container py-section">
    <h1 class="text-3xl font-bold tracking-tight sm:text-4xl">$Title.XML</h1>

    <div class="mt-6 max-w-xl">
        <% include Includes/Nav/SearchForm %>
    </div>

    <% if $Query %>
        <p class="mt-6 opacity-80"><%t Silverwind.SearchedFor 'Results for “{query}”' query=$Query.XML %></p>
    <% end_if %>

    <% if $Results %>
        <ul class="mt-6 divide-y divide-base-300">
            <% loop $Results %>
                <li class="py-5">
                    <h2 class="text-lg font-semibold"><a href="$Link" class="link link-hover link-primary">$MenuTitle.XML</a></h2>
                    <% if $MetaDescription %>
                        <p class="mt-1 opacity-80">$MetaDescription.XML</p>
                    <% else_if $Content %>
                        <p class="mt-1 opacity-80">$Content.LimitWordCount(40)</p>
                    <% end_if %>
                </li>
            <% end_loop %>
        </ul>
        <% include Pagination List=$Results %>
    <% else %>
        <div class="alert mt-6"><%t Silverwind.NoResults 'Sorry, nothing matched your search.' %></div>
    <% end_if %>
</div>
