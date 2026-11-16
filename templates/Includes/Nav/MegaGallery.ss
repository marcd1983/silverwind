<% include Includes/Nav/MegaPanelOpen %>
<ul class="grid gap-6 sm:grid-cols-3 lg:grid-cols-$MegaMenuColumns">
    <% loop $Children %>
        <li>
            <a href="$Link" class="group block"<% if $OpenInNew %> target="_blank" rel="noopener noreferrer"<% end_if %>>
                <% if $Photo %>
                    <img src="$Photo.FocusFill(480,320).URL" alt="" width="480" height="320" class="aspect-[3/2] w-full rounded-box object-cover transition group-hover:opacity-90" loading="lazy">
                <% else %>
                    <span class="block aspect-[3/2] w-full rounded-box bg-base-200"></span>
                <% end_if %>
                <span class="mt-3 block font-semibold group-hover:underline">$MenuTitle.XML</span>
            </a>
        </li>
    <% end_loop %>
</ul>
<% include Includes/Nav/MegaPanelClose %>
