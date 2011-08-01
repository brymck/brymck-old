jQuery.noConflict();
(function($) {
  function addNestingHelper() {
    $("a.reply").click(function(e) {
      var $target = $(e.target);
      var id = $target.data("id");
      $("#comment_parent_id").val(id);
      $("#reply_name").attr("href", "#comment_" + id).text($target.data("name"));
      $("#reply_to").slideDown("fast");
      $("#comment_name").focus();
      e.preventDefault();
    });
    $("#clear_reply_to").click(removeReplyTo);
  }
  
  function removeReplyTo(e) {
    $("#reply_to").slideUp("fast");
    $("#comment_parent_id").val("");
    e.preventDefault();
  }

  function addPrettyPrintTags() {
    $("code").each(function() {
      var $code   = $(this);
      var $parent = $code.parent("pre");
      ($parent.size() === 0 ? $code : $parent).addClass("prettyprint");
    });
  }

  function delayRemoveNotices() {
    $(".success, .error, .notice").filter(":visible").each(function() {
      var $this = $(this);
      setTimeout(function() { $this.slideUp("fast"); }, 5000);
    });
  }

  $(document).ready(function() {
    addNestingHelper();
    addPrettyPrintTags();
    prettyPrint();
    delayRemoveNotices();
  });
})(jQuery);
