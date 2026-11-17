<head>
    <% base_tag %>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    $PageMetaTags
    <% if $SchemaJSON %><script type="application/ld+json">$SchemaJSON.RAW</script><% end_if %>
    <link rel="icon" href="favicon.ico" sizes="any">
    <%-- Project hook: third-party scripts for <head>, gated by cookie consent (see src/js/components/consent-gate.js) --%>
    $SiteScripts('head')
</head>
