<% include PageHeader %>
<% if $SidebarPosition == 'none' || not $SidebarPosition %>
    <%-- Full width: each block sets its own width --%>
    <div class="<% if not $HidePageTitle %>sw-after-header<% end_if %>">$ElementalArea</div>
<% else %>
    <%-- With a sidebar, blocks fill their column --%>
    <div class="sw-container pb-section<% if $HidePageTitle %> pt-section<% end_if %>">
        <div class="grid gap-10 lg:grid-cols-12">
            <div class="sw-stacked min-w-0 lg:col-span-9<% if $SidebarPosition == 'left' %> lg:order-2<% end_if %>">
                $ElementalArea
            </div>
            <aside class="sw-stacked min-w-0 lg:col-span-3<% if $SidebarPosition == 'left' %> lg:order-1<% end_if %>">
                $SidebarElements
            </aside>
        </div>
    </div>
<% end_if %>
<% if $Children && not $HideChildren %>
    <div class="sw-container pb-section">
        <% include ChildGrid %>
    </div>
<% end_if %>
