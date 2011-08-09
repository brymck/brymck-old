enablePostPreview = ->
  $target = $("div.preview")

  if $target.size() > 0
    $source       = $(".preview_source")
    $content      = $("div.content", $target)
    $buttons      = $("input.preview_button, button.preview_button")
    HOTKEY_TEXT   = "Ctrl+Shift+P"

    for button in $buttons
      $button = $(button)
      if button.nodeName.toUpperCase() is "BUTTON"
        $button.text "#{$button.text()} (#{HOTKEY_TEXT})"
      else
        $button.val  "#{$button.val() } (#{HOTKEY_TEXT})"

    preview = (event) ->
      $.get "/en/posts/preview", $source.serialize(), (data) ->
        $target.show()
        $content.html data
      event.preventDefault()

    hotKeyPreview = (event) ->
      preview event if e.ctrlKey and e.shiftKey and e.which is 80

    $source.keyup  hotKeyPreview
    $buttons.click preview

$ ->
  enablePostPreview()
