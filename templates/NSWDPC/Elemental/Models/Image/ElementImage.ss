<%-- Width comes from the block's own Block width setting; Height crops around the focus point --%>
<% if $Image %>
    $RenderedTitle
    <figure>
        <% if $Height == 'small' %>
            <% with $Image.FocusFill(1600,400) %><img src="$URL" alt="$Title.ATT" width="$Width" height="$Height" class="h-48 w-full rounded-box object-cover sm:h-64 lg:h-80" loading="lazy"><% end_with %>
        <% else_if $Height == 'medium' %>
            <% with $Image.FocusFill(1600,600) %><img src="$URL" alt="$Title.ATT" width="$Width" height="$Height" class="h-64 w-full rounded-box object-cover sm:h-96 lg:h-[30rem]" loading="lazy"><% end_with %>
        <% else_if $Height == 'large' %>
            <% with $Image.FocusFill(1600,900) %><img src="$URL" alt="$Title.ATT" width="$Width" height="$Height" class="h-80 w-full rounded-box object-cover sm:h-[32rem] lg:h-[45rem]" loading="lazy"><% end_with %>
        <% else %>
            <% with $Image.ScaleMaxWidth(1600) %><img src="$URL" alt="$Title.ATT" width="$Width" height="$Height" class="h-auto w-full rounded-box" loading="lazy"><% end_with %>
        <% end_if %>
        <% if $Caption && $ShowCaption %>
            <figcaption class="mt-2 text-sm opacity-70">$Caption</figcaption>
        <% end_if %>
    </figure>
<% end_if %>
