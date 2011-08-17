quoteLookup = ->
  $(".quote").each ->
    $quote = $(@)
    link = $quote.find(".link").attr "href"
    $lookup = $quote.find ".lookup"
    $.get "#{link}.json", (data) ->
      $lookup.html data.value

$ ->
  quoteLookup()
