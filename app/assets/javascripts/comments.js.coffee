removeReplyTo = (event) ->
  $("#reply_to").slideUp "fast"
  $("#comment_parent_id").val ""
  event.preventDefault()

addNestingHelper = ->
  $("a.reply").bind "click", (event) =>
    $target = $ event.target
    id      = $target.data "id"
    $("#comment_parent_id").val id
    $("#reply_name").attr("href", "#comment_#{id}").text $target.data "name"
    $("#reply_to").slideDown "fast"
    $("#comment_name").focus
    event.preventDefault()
  $("#clear_reply_to").click removeReplyTo

$ ->
  addNestingHelper()
