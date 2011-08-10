window.delayRemoveSuccess = ->
  $notices = $(".success").filter(":visible")
  setTimeout (-> $notices.slideUp "fast"), 5000

$ ->
  delayRemoveSuccess()
