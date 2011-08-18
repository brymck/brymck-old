quoteLookup = (event) ->
  $(".quote").each ->
    $quote = $(@)
    link = $quote.find(".link").attr "href"
    $lookup = $quote.find ".lookup"
    $.get "#{link}.json", (data) ->
      $lookup.html data.value
  event.preventDefault()

window.attachQuoteLookup = ->
  $(".quote_lookup").click quoteLookup

$ ->
  attachQuoteLookup()
