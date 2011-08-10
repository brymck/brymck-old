PJAX_TIMEOUT_MS = 2000
currentContainer = null

pjaxClickHandler = ($link, container) ->
  # Fade out container if it exists
  unless currentContainer?
    $(container).fadeTo "fast", 0.01
    currentContainer = container

  # Replace existing delinked links in lists that request the feature
  $(".delink-current span[data-href]").each ->
    $span = $(@)
    linkHTML = "<a href='#{$span.data "href"}'>#{$span.text()}</a>"
    $span.replaceWith linkHTML

  # Delink current link if an ancestor is so disposed
  if $link.closest(".delink-current").size() > 0
    spanHTML = "<span data-href='#{$link.attr "href"}'>#{$link.text()}</span>"
    $link.replaceWith spanHTML

pjaxBindClick = (context = document) ->
  # Finds everything with a data-pjax attribute, the value of which can be used
  # to identify the container for the PJAX response
  $(context).find("[data-pjax]").each ->
    $list = $(@)
    container = $list.data "pjax"

    options = { timeout: PJAX_TIMEOUT_MS }
    options.header = "X-PJAX-NOARCHIVE" if $list.hasClass "archive"

    $list.find("a:not([data-nopjax])").pjax(container, options)
      .live "click", -> pjaxClickHandler $(@), container

pjaxBindEnd = ->
  $(document).bind "end.pjax", ->
    $crumbs = $("#crumbs_under_rug")
    $("#breadcrumbs").html $crumbs.html() if $crumbs.size() > 0

    # Fades in current container
    if currentContainer?
      pjaxBindClick currentContainer
      $(currentContainer).fadeTo "fast", 1
      currentContainer = null

    delayRemoveSuccess() # in flash.js.coffee

$ ->
  # Implements PJAX if supported, otherwise degrades
  # Incidentally, this should help with IE if any font-smoothing issues exist
  # since even IE 10 has only partial support for pushstate:
  # http://caniuse.com/#search=pushstate
  if $.support.pjax
    pjaxBindClick()
    pjaxBindEnd()
