// Place your application-specific JavaScript functions and classes here
// This file is automatically included by javascript_include_tag :defaults

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
