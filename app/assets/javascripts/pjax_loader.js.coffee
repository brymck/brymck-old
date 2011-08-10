PJAX_TIMEOUT_MS = 2000
currentContainer = null

bindPjax = (context = document) ->
  $(context).find("[data-pjax]").each ->
    $list = $(@)
    container = $list.data "pjax"

    $list.find("a:not([data-nopjax])").pjax(container, timeout: PJAX_TIMEOUT_MS).live "click", ->
      unless currentContainer?
        $(container).fadeTo "fast", 0.01
        currentContainer = container
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
      false

$(document).bind "end.pjax", ->
  $crumbs = $("#crumbs_under_rug")
  $("#breadcrumbs").html $crumbs.html() if $crumbs.size() > 0
  if currentContainer?
    bindPjax currentContainer
    $(currentContainer).fadeTo "fast", 1
    currentContainer = null

$ -> bindPjax()
