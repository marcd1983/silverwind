<%-- Width and spacing come from the virtual block (where it sits); style and anchor from the linked block --%>
<% if $LinkedElement %>
<div class="sw-element element element--virtual $LinkedElement.SimpleClassName.LowerCase<% if $BlockWidthClass %> $BlockWidthClass<% end_if %><% if $SpacingClasses %> $SpacingClasses<% end_if %><% if $LinkedElement.StyleVariant %> $LinkedElement.StyleVariant<% end_if %><% if $LinkedElement.ExtraClass %> $LinkedElement.ExtraClass<% end_if %>" id="$LinkedElement.Anchor">
    $Element
</div>
<% end_if %>
