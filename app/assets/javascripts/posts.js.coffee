addPrettyPrintTags = ->
  $("code").each ->
    $code   = $ this
    $parent = $code.parent "pre"
    $target = if $parent.size() is 0 then $code else $parent
    $target.addClass "prettyprint"

enablePostPreview = ->
  $target = $ "div.preview"

  if $target.size() > 0
    $source       = $ ".preview_source"
    $content      = $ "div.content", $target
    $buttons      = $ "input.preview_button, button.preview_button"
    HOTKEY_TEXT   = "Ctrl+Shift+P"

    $buttons.each (index, button) ->
      $button = $ button
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
  addPrettyPrintTags()
  prettyPrint()
  enablePostPreview()
