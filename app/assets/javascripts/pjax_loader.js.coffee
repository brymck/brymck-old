PJAX_TIMEOUT_MS = 2000

bindPjax = ->
  $("[data-pjax]").each ->
    $list = $(@)
    container = $list.data "pjax"

    $list.find("a:not([data-nopjax])").pjax(container, timeout: PJAX_TIMEOUT_MS).live "click", ->
      $link = $(@)

      # Replace existing spanned out links
      if $list.hasClass "delink-current"
        $spans = $list.find "span[data-href]"
        $spans.each ->
          $span = $(@)
          linkHTML = "<a href='#{$span.data "href"}'>#{$span.text()}</a>"
          $span.replaceWith linkHTML

        spanHTML = "<span data-href='#{$link.attr "href"}'>#{$link.text()}</span>"
        $link.replaceWith spanHTML

$(document).bind "end.pjax", ->
  $crumbs = $("#crumbs_under_rug")
  $("#breadcrumbs").html $crumbs.html() if $crumbs.size() > 0

$ -> bindPjax()
