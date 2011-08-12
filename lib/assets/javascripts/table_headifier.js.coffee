$.fn.headifier = ->
  @.each ->
    $table = $(@)

    # Ignore anything already has a header
    if $table.children("thead").size() is 0
      $tbody = $table.children "tbody"
      $thead = $("<thead>").insertBefore $tbody
      $tbody.children("tr").each ->
        $tr = $(@)

        # Ignore the first row that has a <td> tag and onward
        if $tr.children("td").size() is 0
          $thead.append $tr
        else
          false
