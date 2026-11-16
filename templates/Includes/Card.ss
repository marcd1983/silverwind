<article class="card h-full border border-base-300 bg-base-100 shadow-sm transition hover:shadow-md">
    <% if $Photo %>
        <figure>
            <a href="$Link" tabindex="-1"<% if $OpenInNew %> target="_blank" rel="noopener noreferrer"<% end_if %>>
                <img src="$Photo.FocusFill(600,400).URL" alt="" width="600" height="400" class="aspect-[3/2] w-full object-cover" loading="lazy">
            </a>
        </figure>
    <% end_if %>
    <div class="card-body">
        <h2 class="card-title text-lg"><a href="$Link" class="link link-hover"<% if $OpenInNew %> target="_blank" rel="noopener noreferrer"<% end_if %>>$MenuTitle.XML</a></h2>
        <% if $Description %><p class="opacity-80">$Description.XML</p><% end_if %>
    </div>
</article>
