delayRemoveNotices = ->
  $(".success, .error, .notice").filter(":visible").each ->
    setTimeout (=> $(this).slideUp "fast"), 5000

$ ->
  delayRemoveNotices()
