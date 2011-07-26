jQuery.noConflict();
(function($) {
  function addPrettyPrintTags() {
    $("code").each(function() {
      var $code   = $(this);
      var $parent = $code.parent("pre");
      ($parent.size() === 0 ? $code : $parent).addClass("prettyprint");
    });
  }

  $(document).ready(function() {
    addPrettyPrintTags();
    prettyPrint();
  });
})(jQuery);
