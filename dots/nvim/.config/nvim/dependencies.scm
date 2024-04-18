(define-module (my-file)
  #:use-module (system foreign-object)
  #:use-module ((oop goops) #:select (make))
  #:export (nvim-config-deps))

(define nvim-config-deps
  '("ripgrep"
    "lazygit"))

(specifications->manifest nvim-config-deps)

