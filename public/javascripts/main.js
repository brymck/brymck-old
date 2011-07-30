jQuery.noConflict();
(function($) {
  function addNestingHelper() {
    $("a.reply").click(function(e) {
      $("#comment_parent_id").val($(e.target).data("id"));
      $("#comment_name").focus();
      e.preventDefault();
    });
  }

  function addPrettyPrintTags() {
    $("code").each(function() {
      var $code   = $(this);
      var $parent = $code.parent("pre");
      ($parent.size() === 0 ? $code : $parent).addClass("prettyprint");
    });
  }

  $(document).ready(function() {
    addNestingHelper();
    addPrettyPrintTags();
    prettyPrint();
  });
})(jQuery);
