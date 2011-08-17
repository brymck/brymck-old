NUMBER_REGEX = ///
               (\]\[|_) # preceding underscore or brackets
               ([0-9]+) # index
               (\]\[|_) # following underscore or brackets
               ///
IS_BLANK =     ///
               ^        # beginning of string
               \s*      # zero or more spaces
               $        # end of string
               ///

incrementIndex = (a, b, c, d) -> "#{b}#{parseInt(c) + 1}#{d}"

dupeUnlessEmpty = (node) ->
  $duplicable = $(node)
  $first = $duplicable.find("input").eq 0
  nextId = $first.attr("id").replace NUMBER_REGEX, incrementIndex
  $first.keyup (event) ->
    unless IS_BLANK.test $first.val()
      $next = $("##{nextId}")
      if $next.size() is 0
        $dupe = $duplicable.clone()
        $dupe.find("label").each ->
          $label = $(@)
          $label.attr "for",   $label.attr("for").replace   NUMBER_REGEX, incrementIndex
        $dupe.find("input").each ->
          $input = $(@)
          $input.attr "id",    $input.attr("id").replace    NUMBER_REGEX, incrementIndex
          $input.attr "name",  $input.attr("name").replace  NUMBER_REGEX, incrementIndex
          $input.val("")
        dupeUnlessEmpty $dupe
        $duplicable.after $dupe
    else
      $next = $("##{nextId}")
      $duplicable.next().remove() if $next.size() isnt 0



makeDuplicable = ->
  $(".duplicable").each ->
    dupeUnlessEmpty @

$ ->
  makeDuplicable()
