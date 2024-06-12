;; inherits: org
;; extends

(block
 parameter: (_) @_lang
 (#eq? @_lang "agda2")
 contents: (_) @injection.content
 (#set! injection.language "agda"))

