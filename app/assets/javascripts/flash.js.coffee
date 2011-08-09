delayRemoveNotices = ->
  $notices = $(".success, .error, .notice").filter(":visible")
  setTimeout (-> $notices.slideUp "fast"), 5000

$ ->
  delayRemoveNotices()
