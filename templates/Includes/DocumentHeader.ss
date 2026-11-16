<head>
    <% base_tag %>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    $PageMetaTags
    <% if $SchemaJSON %><script type="application/ld+json">$SchemaJSON.RAW</script><% end_if %>
    <link rel="icon" href="favicon.ico" sizes="any">
    <% if $SiteConfig.HeadScripts %>$SiteConfig.HeadScripts.RAW<% end_if %>
</head>
