window.delayRemoveSuccess = ->
  $notices = $(".alert-success").filter(":visible")
  setTimeout (-> $notices.slideUp "fast"), 5000

$ ->
  delayRemoveSuccess()
