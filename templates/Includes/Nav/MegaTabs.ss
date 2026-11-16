<% include Includes/Nav/MegaPanelOpen %>
<div x-data="{ tab: '$Children.First.ID' }" class="grid gap-8 lg:grid-cols-[16rem_1fr]">
    <div>
        <div role="tablist" aria-orientation="vertical" class="flex flex-col gap-1">
            <% loop $Children %>
                <button type="button" role="tab" id="nav-tab-$ID" aria-controls="nav-tabpanel-$ID" :aria-selected="tab === '$ID'" @click="tab = '$ID'" @mouseenter="tab = '$ID'" @focus="tab = '$ID'" class="flex items-center gap-3 rounded-field px-3 py-2 text-left transition" :class="tab === '$ID' ? 'bg-base-200 font-semibold' : 'hover:bg-base-200'">
                    <% if $Photo %><img src="$Photo.FocusFill(64,64).URL" alt="" width="32" height="32" class="size-8 rounded-full object-cover" loading="lazy"><% end_if %>
                    $MenuTitle.XML
                </button>
            <% end_loop %>
        </div>
        <% if $Links %>
            <div class="mt-6 flex flex-col gap-2">
                <% loop $Links %>
                    <% include LinkButton Size='btn-sm', Block=1 %>
                <% end_loop %>
            </div>
        <% end_if %>
    </div>
    <% loop $Children %>
        <div role="tabpanel" id="nav-tabpanel-$ID" aria-labelledby="nav-tab-$ID" x-show="tab === '$ID'"<% if not $IsFirst %> x-cloak<% end_if %> class="grid items-start gap-6 md:grid-cols-2">
            <% if $Photo %>
                <a href="$Link" tabindex="-1"<% if $OpenInNew %> target="_blank" rel="noopener noreferrer"<% end_if %>>
                    <img src="$Photo.FocusFill(800,450).URL" alt="" width="800" height="450" class="aspect-video w-full rounded-box object-cover" loading="lazy">
                </a>
            <% end_if %>
            <div>
                <h3 class="text-xl font-semibold">$Title.XML</h3>
                <% if $Description %><p class="mt-2 opacity-80">$Description.XML</p><% end_if %>
                <a href="$Link" class="btn btn-outline btn-primary mt-4"<% if $OpenInNew %> target="_blank" rel="noopener noreferrer"<% end_if %>><%t Silverwind.ViewTitle 'View {title}' title=$MenuTitle.XML %></a>
            </div>
        </div>
    <% end_loop %>
</div>
<% include Includes/Nav/MegaPanelClose %>
