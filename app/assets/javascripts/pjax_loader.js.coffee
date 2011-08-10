PJAX_TIMEOUT_MS = 2000
currentContainer = null

pjaxClickHandler = ($link, $list, container) ->
  # Fade out container if it exists
  unless currentContainer?
    $(container).fadeTo "fast", 0.01
    currentContainer = container

  # Replace existing delinked links in lists that request the feature
  if $list.hasClass "delink-current"
    $spans = $list.find "span[data-href]"
    $spans.each ->
      $span = $(@)
      linkHTML = "<a href='#{$span.data "href"}'>#{$span.text()}</a>"
      $span.replaceWith linkHTML

    # Delink current link
    spanHTML = "<span data-href='#{$link.attr "href"}'>#{$link.text()}</span>"
    $link.replaceWith spanHTML

pjaxBindClick = (context = document) ->
  # Finds everything with a data-pjax attribute, the value of which can be used
  # to identify the container for the PJAX response
  $(context).find("[data-pjax]").each ->
    $list = $(@)
    container = $list.data "pjax"

    $list.find("a:not([data-nopjax])").pjax(container, timeout: PJAX_TIMEOUT_MS)
      .live "click", -> pjaxClickHandler $(@), $list, container

pjaxBindEnd = ->
  $(document).bind "end.pjax", ->
    $crumbs = $("#crumbs_under_rug")
    $("#breadcrumbs").html $crumbs.html() if $crumbs.size() > 0

    # Fades in current container
    if currentContainer?
      pjaxBindClick currentContainer
      $(currentContainer).fadeTo "fast", 1
      currentContainer = null

$ ->
  # Implements PJAX if supported, otherwise degrades
  # Incidentally, this should help with IE if any font-smoothing issues exist
  # since even IE 10 has only partial support for pushstate:
  # http://caniuse.com/#search=pushstate
  if $.support.pjax
    pjaxBindClick()
    pjaxBindEnd()
