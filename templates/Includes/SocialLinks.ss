<% if $SiteConfig.Facebook || $SiteConfig.Instagram || $SiteConfig.LinkedIn || $SiteConfig.Youtube || $SiteConfig.Twitter %>
    <ul class="flex flex-wrap gap-x-4 gap-y-2 text-sm">
        <% if $SiteConfig.Facebook %><li><a href="$SiteConfig.Facebook.ATT" class="link link-hover" target="_blank" rel="noopener noreferrer">Facebook</a></li><% end_if %>
        <% if $SiteConfig.Instagram %><li><a href="$SiteConfig.Instagram.ATT" class="link link-hover" target="_blank" rel="noopener noreferrer">Instagram</a></li><% end_if %>
        <% if $SiteConfig.LinkedIn %><li><a href="$SiteConfig.LinkedIn.ATT" class="link link-hover" target="_blank" rel="noopener noreferrer">LinkedIn</a></li><% end_if %>
        <% if $SiteConfig.Youtube %><li><a href="$SiteConfig.Youtube.ATT" class="link link-hover" target="_blank" rel="noopener noreferrer">YouTube</a></li><% end_if %>
        <% if $SiteConfig.Twitter %><li><a href="$SiteConfig.Twitter.ATT" class="link link-hover" target="_blank" rel="noopener noreferrer">X</a></li><% end_if %>
    </ul>
<% end_if %>
