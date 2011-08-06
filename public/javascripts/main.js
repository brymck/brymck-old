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

  function enablePostPreview() {
    var $target = $("div.preview");
    
    if ($target.size() > 0) {
      var $source  = $(".preview_source");
      var $content = $("div.content", $target);
      var $buttons = $("input.preview_button, button.preview_button");
      var HOTKEY_TEXT = "Ctrl+Shift+P";

      $buttons.each(function(index, button) {
        var $button = $(button);
        
        if (button.nodeName.toUpperCase() === "BUTTON") {
          $button.text($button.text() + " (" + HOTKEY_TEXT + ")");
        } else {
          $button.val($button.val() + " (" + HOTKEY_TEXT + ")");
        }
      });

      var preview = function(e) {
        $.get("/en/posts/preview", $source.serialize(), function(data) {
          $target.show();
          $content.html(data);
        });
        e.preventDefault();
      };

      // Allow hotkey to preview (Ctrl+Shift+P)
      var hotKeyPreview = function(e) {
        if (e.ctrlKey && e.shiftKey && e.which === 80) {
          preview(e);
        }
      }

      $source.keyup(hotKeyPreview);
      $buttons.click(preview);
    }
  }

  $(document).ready(function() {
    addNestingHelper();
    addPrettyPrintTags();
    prettyPrint();
    delayRemoveNotices();
    enablePostPreview();
  });
})(jQuery);
