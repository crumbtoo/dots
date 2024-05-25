;; inherits: haskell
;; extends

(declarations
  (_) @decl)

(signature
  type: (_) @signature.inner) @signature.outer

((variable) @hole
 (#match? @hole "(undefined|_)")) @hole

(alternative
 pattern: (_) @pat)
(patterns (_) @pat)

(data_type
 constructors: (_) @decl.inner) @decl.outer

(instance
 declarations: (_) @decl.inner) @decl.outer

(signature
 type: (_) @decl.inner) @decl.outer

(bind
 match: (match expression: (_) @decl.inner)) @decl.outer

(function
 match: (match expression: (_) @decl.inner)) @decl.outer

(newtype
 constructor: (_) @decl.inner) @decl.outer

(class
 declarations: (_) @decl.inner) @decl.outer

(declarations
 (_) @decl.outer)

(data_type
 constructors: (_)) @toplevel

(instance
 declarations: (_)) @toplevel

(function
 match: (match expression: (_))) @toplevel

(newtype
 constructor: (_)) @toplevel

(class
 declarations: (_)) @toplevel

(declarations
 (_) @toplevel)

; [((signature) @_start . (bind) @_end
;  (#make-range! "sigfunc" @_start @_end))
;  (signature)
;  (bind)] @toplevel

