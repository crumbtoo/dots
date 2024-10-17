(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-safe-themes
   '("476fe2180054c68863477bd43617e17bb4d10b75e44f6efed146cc55d7b28809" default))
 '(elfeed-feeds '("https://xkcd.com/rss.xml"))
 '(evil-snipe-scope 'visible)
 '(magit-todos-insert-after '(bottom) nil nil "Changed by setter of obsolete option `magit-todos-insert-at'")
 '(org-agenda-files
   '("~/Dropbox/org/events.org" "/home/crumb/src/sydml/README.org"
     "/home/crumb/org/aliases.org" "/home/crumb/org/birthdays.org"
     "/home/crumb/org/classy-todo.org" "/home/crumb/org/cool-projects.org"
     "/home/crumb/org/dreams.org" "/home/crumb/org/elfeed.org"
     "/home/crumb/org/glossary.org" "/home/crumb/org/inbox.org"
     "/home/crumb/org/journal.org" "/home/crumb/org/project-ideas.org"
     "/home/crumb/org/todo.org"))
 '(org-safe-remote-resources
   '("\\`https://fniessen\\.github\\.io/org-html-themes/org/theme-bigblow\\.setup\\'"))
 '(safe-local-variable-directories
   '("/home/crumb/git/scheme-macros/" "/home/crumb/src/demand-driven/"
     "/home/crumb/src/silly.old/" "/home/crumb/src/silly/"
     "/home/crumb/src/sydml/" "/home/crumb/src/lean-playground/"))
 '(safe-local-variable-values
   '((geiser-repl-per-project-p . t)
     (eval with-eval-after-load 'yasnippet
      (let
          ((guix-yasnippets
            (expand-file-name "etc/snippets/yas"
                              (locate-dominating-file default-directory
                                                      ".dir-locals.el"))))
        (unless (member guix-yasnippets yas-snippet-dirs)
          (add-to-list 'yas-snippet-dirs guix-yasnippets) (yas-reload-all))))
     (eval setq-local guix-directory
      (locate-dominating-file default-directory ".dir-locals.el"))
     (eval add-to-list 'completion-ignored-extensions ".go")))
 '(smtpmail-smtp-server "smtp.gmail.com")
 '(smtpmail-smtp-service 587))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
