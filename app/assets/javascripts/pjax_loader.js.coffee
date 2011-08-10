$("nav a").pjax("#page").live "click", ->
  # Replace existing spanned out links
  $spans = $("nav span[data-href]")
  for span in $spans
    $span = $(span)
    linkHTML = "<a href='#{$span.data "href"}'>#{$span.text()}</a>"
    $span.replaceWith linkHTML

  $link = $(@)
  spanHTML = "<span data-href='#{$link.attr "href"}'>#{$link.text()}</span>"
  $link.replaceWith spanHTML
