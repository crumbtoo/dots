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
 '(org-safe-remote-resources
   '("\\`https://fniessen\\.github\\.io/org-html-themes/org/theme-bigblow\\.setup\\'"))
 '(safe-local-variable-values
   '((geiser-repl-per-project-p . t)
     (eval with-eval-after-load 'yasnippet
      (let
          ((guix-yasnippets
            (expand-file-name "etc/snippets/yas"
                              (locate-dominating-file default-directory ".dir-locals.el"))))
        (unless
            (member guix-yasnippets yas-snippet-dirs)
          (add-to-list 'yas-snippet-dirs guix-yasnippets)
          (yas-reload-all))))
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
