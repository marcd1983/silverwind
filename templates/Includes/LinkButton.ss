<%-- A linkfield Link as a daisyUI button. $ButtonClass comes from silverwind-blocks' LinkStyleExtension; modal triggers open a <dialog>. Optional: Size (e.g. btn-sm), Block (1 for full width) --%>
<% if $ModalTarget %>
<button type="button" class="<% if $ButtonClass %>$ButtonClass<% else %>btn btn-primary<% end_if %><% if $Size %> $Size<% end_if %><% if $Block %> btn-block<% end_if %>" data-modal-target="$ModalTarget" aria-haspopup="dialog">$Title.XML</button>
<% else %>
<a href="$URL"<% if $OpenInNew %> target="_blank" rel="noopener noreferrer"<% end_if %> class="<% if $ButtonClass %>$ButtonClass<% else %>btn btn-primary<% end_if %><% if $Size %> $Size<% end_if %><% if $Block %> btn-block<% end_if %>">$Title.XML</a>
<% end_if %>
