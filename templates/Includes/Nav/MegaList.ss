<% include Includes/Nav/MegaPanelOpen %>
<div class="grid gap-8 lg:grid-cols-$MegaMenuColumns">
    <% loop $Children %>
        <div>
            <a href="$Link" class="text-sm font-semibold tracking-wide uppercase opacity-70 hover:opacity-100"<% if $OpenInNew %> target="_blank" rel="noopener noreferrer"<% end_if %>>$MenuTitle.XML</a>
            <ul class="mt-3 space-y-2">
                <li><a href="$Link" class="link link-hover"<% if $OpenInNew %> target="_blank" rel="noopener noreferrer"<% end_if %>><%t Silverwind.AllOf 'All {title}' title=$MenuTitle.XML %></a></li>
                <% loop $Children %>
                    <li><a href="$Link" class="link link-hover<% if $LinkingMode == 'current' %> text-primary<% end_if %>"<% if $LinkingMode == 'current' %> aria-current="page"<% end_if %><% if $OpenInNew %> target="_blank" rel="noopener noreferrer"<% end_if %>>$MenuTitle.XML</a></li>
                <% end_loop %>
            </ul>
        </div>
    <% end_loop %>
    <% if not $HideParentCard %>
        <% if $Photo %>
            <a href="$Link" class="group block"<% if $OpenInNew %> target="_blank" rel="noopener noreferrer"<% end_if %>>
                <img src="$Photo.FocusFill(480,320).URL" alt="" width="480" height="320" class="aspect-[3/2] w-full rounded-box object-cover" loading="lazy">
                <span class="mt-3 block font-semibold group-hover:underline"><%t Silverwind.ViewAll 'View all {title}' title=$MenuTitle.XML %> &rarr;</span>
            </a>
        <% end_if %>
    <% end_if %>
</div>
<% include Includes/Nav/MegaPanelClose %>
