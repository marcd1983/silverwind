$RenderedTitle
<% if $Content %><div class="prose mb-6 max-w-none">$Content</div><% end_if %>
<% if $Code %>
    <div class="w-full overflow-x-auto [&_iframe]:w-full [&_iframe]:max-w-full [&_iframe]:rounded-box">
        $Code
    </div>
<% end_if %>
