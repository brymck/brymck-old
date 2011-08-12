LANGUAGE_SUBPATH_INDEX = 1
LANGUAGE_REGEX = /[a-z]{2}/ # two-letter ISO language code
$languages = $("#languages").find "span[data-href], a[href]"

stripLanguage = (pathname) ->
  subpaths = pathname.split "/"
  subpaths.splice(LANGUAGE_SUBPATH_INDEX, 1) if LANGUAGE_REGEX.test subpaths[LANGUAGE_SUBPATH_INDEX]
  subpaths.join "/"

window.updateLanguageSelector = ->
  pathname = stripLanguage window.location.pathname
  for language in $languages
    $language = $(language)
    if $language.is "a"
      $language.attr "href", "/#{$language.attr "lang"}#{pathname}"
    else if $language.is "span"
      $language.data "href", "/#{$language.attr "lang"}#{pathname}"
