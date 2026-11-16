<% include PageHeader %>
<% if $Content %>
    <div class="sw-container pb-section">
        <div class="prose max-w-narrow">$Content</div>
    </div>
<% else %>
    <%-- Full width: each block sets its own width --%>
    <div class="<% if not $HidePageTitle %>sw-after-header<% end_if %>">$ElementalArea</div>
<% end_if %>
<% if $Form || $CommentsForm %>
    <div class="sw-container pb-section">
        <div class="max-w-2xl">
            $Form
            $CommentsForm
        </div>
    </div>
<% end_if %>
<% if $Children && not $HideChildren %>
    <div class="sw-container pb-section">
        <% include ChildGrid %>
    </div>
<% end_if %>
