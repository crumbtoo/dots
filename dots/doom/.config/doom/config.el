;;; $DOOMDIR/config.el -*- lexical-binding: t; -*-

;; Place your private configuration here! Remember, you do not need to run 'doom
;; sync' after modifying this file!

;; FIXME: TEMPORARY!!!!!!! we're using this for hacking on org-mode.
(setq load-prefer-newer t)

(progn
  (require 'server)
  (let ((editor (if (server-running-p)
                    "emacsclient"
                  "emacs")))
    (setenv "EDITOR" editor)
    (setenv "VISUAL" editor)))

;; Some functionality uses this to identify you, e.g. GPG configuration, email
;; clients, file templates and snippets. It is optional.
(setq user-full-name "Madeleine Sydney"
      user-mail-address "lomiskiam@gmail.com")

;; Doom exposes five (optional) variables for controlling fonts in Doom:
;;
;; - `doom-font' -- the primary font to use
;; - `doom-variable-pitch-font' -- a non-monospace font (where applicable)
;; - `doom-big-font' -- used for `doom-big-font-mode'; use this for
;;   presentations or streaming.
;; - `doom-symbol-font' -- for symbols
;; - `doom-serif-font' -- for the `fixed-pitch-serif' face
;;
;; See 'C-h v doom-font' for documentation and more examples of what they
;; accept. For example:
;;
(setq doom-font (font-spec :family "VictorMono NF" :size 13)
      doom-variable-pitch-font (font-spec :family "Overpass" :size 13)
      doom-big-font (font-spec :family "VictorMono NF" :size 17))

(dolist (char-range '((#x0250 . #x02af) ; IPA extensions
                      (#x2200 . #x22FF))) ; Mathematical operators
  (set-fontset-font "fontset-default" char-range "JuliaMono"))

;; (add-hook! 'after-setting-font-hook
;;   (let ((julia-mono (font-spec :family "JuliaMono" :size 13)))
;;     (set-fontset-font t
;;                       '(#x0250 . #x02af)
;;                       julia-mono)))

(setq fancy-splash-image (concat doom-user-dir "emacs-small.png"))

;;
;; If you or Emacs can't find your font, use 'M-x describe-font' to look them
;; up, `M-x eval-region' to execute elisp code, and 'M-x doom/reload-font' to
;; refresh your font settings. If Emacs still can't find your font, it likely
;; wasn't installed correctly. Font issues are rarely Doom issues!

;; There are two ways to load a theme. Both assume the theme is installed and
;; available. You can either set `doom-theme' or manually load a theme with the
;; `load-theme' function. This is the default:
(setq doom-theme 'kanagawa-wave)

;; This determines the style of line numbers in effect. If set to `nil', line
;; numbers are disabled. For relative line numbers, set this to `relative'.
(setq display-line-numbers-type 'relative)

;; If you use `org' and don't want your org files in the default location below,
;; change `org-directory'. It must be set before org loads!
(setq org-directory "~/org")
(setq org-roam-directory "~/org/roam")
(setq org-mobile-inbox-for-pull "~/org/mobile-inbox.org")
(setq org-cycle-emulate-tab nil)
;; (setq org-mobile-directory "~/Dropbox/Apps/Metanote")
;; (modify-all-frames-parameters
;;  '((right-divider-width . 40)
;;    (internal-border-width . 40)))
;; (dolist (face '(window-divider
;;                 window-divider-first-pixel
;;                 window-divider-last-pixel))
;;   (face-spec-reset-face face)
;;   (set-face-foreground face (face-attribute 'default :background)))
;; (set-face-background 'fringe (face-attribute 'default :background))
;; Insert a "CLOSED: [timestamp]" line when changing an item to DONE.
(setq org-log-done 'time)
(setq
 ;; Edit settings
 org-auto-align-tags nil
 org-tags-column 0
 org-fold-catch-invisible-edits 'show-and-error
 org-special-ctrl-a/e t
 org-insert-heading-respect-content t
 org-startup-with-inline-images t

 ;; Org styling, hide markup etc.
 org-hide-emphasis-markers t
 org-pretty-entities t

 ;; Agenda styling
 org-agenda-tags-column 0
 org-agenda-block-separator ?─
 org-agenda-time-grid
 '((daily today require-timed)
   (800 1000 1200 1400 1600 1800 2000)
   " ┄┄┄┄┄ " "┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄")
 org-agenda-current-time-string
 "◁── now ─────────────────────────────────────────────────")

;; (setq org-project-capture-default-backend
;;   (make-instance 'org-project-capture-projectile-backend))

(setq haskell-interactive-popup-errors nil)
(setq haskell-auto-insert-module-format-string
      (let ((hrule (make-string 80 ?-)))
        (string-join
         `("{- |"
           "-}"
           "module %s"
           "  ("
           "  )"
           "  where"
           ,hrule
           ,hrule
           "\n")
         "\n")))

(setq lsp-rename-use-prepare nil)

                                        ; (load-file (let ((coding-system-for-read 'utf-8))
                                        ;                 (shell-command-to-string "agda-mode locate")))

;; Whenever you reconfigure a package, make sure to wrap your config in an
;; `after!' block, otherwise Doom's defaults may override your settings. E.g.
;;
;;   (after! PACKAGE
;;     (setq x y))
;;
;; The exceptions to this rule:
;;
;;   - Setting file/directory variables (like `org-directory')
;;   - Setting variables which explicitly tell you to set them before their
;;     package is loaded (see 'C-h v VARIABLE' to look up their documentation).
;;   - Setting doom variables (which start with 'doom-' or '+').
;;
;; Here are some additional functions/macros that will help you configure Doom.
;;
;; - `load!' for loading external *.el files relative to this one
;; - `use-package!' for configuring packages
;; - `after!' for running code after a package has loaded
;; - `add-load-path!' for adding directories to the `load-path', relative to
;;   this file. Emacs searches the `load-path' when you load packages with
;;   `require' or `use-package'.
;; - `map!' for binding new keys
;;
;; To get information about any of these functions/macros, move the cursor over
;; the highlighted symbol at press 'K' (non-evil users must press 'C-c c k').
;; This will open documentation for it, including demos of how they are used.
;; Alternatively, use `C-h o' to look up a symbol (functions, variables, faces,
;; etc).
;;
;; You can also try 'gd' (or 'C-c c d') to jump to their definition and see how
;; they are implemented.
;; (use-package! kanagawa-theme
;;   :config
;;   (load-theme 'kanagawa t))

;; disable synchronization between the kill ring and system clipboard.
(setq select-enable-clipboard nil)

(after! elfeed
  (add-hook 'elfeed-search-mode-hook #'elfeed-update))

(after! evil
  ;; TODO: we should probably use `map!'
  (define-key evil-normal-state-map "gx" #'browse-url-at-point)
  (define-key evil-normal-state-map "gX" #'evil-exchange)
  (define-key evil-normal-state-map "#" 'evilnc-comment-operator)
  (define-key evil-visual-state-map "#" 'evilnc-comment-operator)
  (evil-set-initial-state 'exwm-mode 'emacs)
  (setq evil-move-beyond-eol t)
  (setq evil-vsplit-window-right t)
  (define-key evil-outer-text-objects-map "B" 'evil-a-curly)
  (define-key evil-inner-text-objects-map "B" 'evil-inner-curly)
  (setq evil-snipe-scope 'visible))

;; TODO: upstream to evil-collection
(map! :map helpful-mode-map
      :n "C-p" #'help-go-back
      :n "C-n" #'help-go-forward)

(key-chord-mode 1)
(key-chord-define evil-visual-state-map "JK" 'evil-normal-state)

(setq indent-tabs-mode nil
      tab-width 2)

(global-tree-sitter-mode)
(add-hook 'tree-sitter-after-on-hook
          #'tree-sitter-hl-mode)

(setq idris-interpreter-path "idris2")

(map! :map comint-mode-map
      :i "C-k" #'comint-previous-input
      :i "C-j" #'comint-next-input)

(after! racket-mode
  (map! :map racket-repl-mode-map
        :i "C-k" #'racket-repl-previous-input
        :i "C-j" #'racket-repl-next-input)

  (add-to-list 'display-buffer-alist
               '("\\`\\*Racket REPL"
                 (+popup-buffer) (actions) (side . bottom)
                 (size) (window-width . 40) (window-height . 0.16) (slot) (vslot)
                 (window-parameters (ttl . 5) (quit) (select . ignore) (modeline)
                                    (autosave)))))

(after! haskell
  ;; remove annoying virtual type signatures.
  ;; (setq lsp-haskell-plugin-ghcide-type-lenses-global-on nil)
  (map! :map haskell-mode-map
        :localleader
        "a i" (cmd! (haskell-add-import))
        "a d" #'haskell-cabal-add-dependency)
  (map! :map interactive-haskell-mode-map
        :i "C-j" #'haskell-interactive-mode-history-next
        :i "C-k" #'haskell-interactive-mode-history-previous))

;; (use-package mu4e
;;   ;; :load-path "/usr/share/emacs/site-lisp/mu4e/"
;;   ;; :defer 20 ; Wait until 20 seconds after startup
;;   :config

;;   ;; This is set to 't' to avoid mail syncing issues when using mbsync
;;   (setq mu4e-change-filenames-when-moving t)

;;   ;; Refresh mail using isync every 10 minutes
;;   (setq mu4e-update-interval (* 10 60))
;;   (setq mu4e-get-mail-command "mbsync -a")
;;   (setq mu4e-maildir "~/Mail")

;;   (setq mu4e-drafts-folder "/[Gmail]/Drafts")
;;   (setq mu4e-sent-folder   "/[Gmail]/Sent Mail")
;;   (setq mu4e-refile-folder "/[Gmail]/All Mail")
;;   (setq mu4e-trash-folder  "/[Gmail]/Trash")

;;   (setq mu4e-maildir-shortcuts
;;     '((:maildir "/Inbox"    :key ?i)
;;       (:maildir "/[Gmail]/Sent Mail" :key ?s)
;;       (:maildir "/[Gmail]/Trash"     :key ?t)
;;       (:maildir "/[Gmail]/Drafts"    :key ?d)
;;       (:maildir "/[Gmail]/All Mail"  :key ?a))))

(setq message-signature (concat "\n\n-- \n"
                                "Sent from mu4e.\n"
                                "Madeleine Sydney Ślaga\n"))

;; break long paragraphs w/ newlines
;; (add-hook 'text-mode-hook 'turn-on-auto-fill)
;; (add-hook 'org-mode-hook 'turn-on-auto-fill)
;; (add-hook 'markdown-mode-hook 'turn-on-auto-fill)
(auto-fill-mode 1)
;; (setq comment-auto-fill-only-comments t)

;; (after! vterm
;;  (key-chord-define vterm-mode-map "jk" 'evil-normal-state))

;; (after! eshell-vterm
;;  (eshell-vterm-mode))

;; (map! :mode calc-mode
;;       :map calc-mode-map
;;       :n "<spc>" nil)

(add-hook! 'eshell-mode-hook
  (setq-local company-mode nil)
  ;; (setq eshell-list-files-after-cd t)
  ;; (appendq! eshell-visual-commands
  ;;           '("nix-shell"
  ;;             "nvim"))
  ;; (appendq! eshell-visual-subcommands
  ;;           '(("nix" "develop" "shell")
  ;;             ("jj" "split")))
  )

(add-hook! 'pdf-view-mode-hook
  (pdf-view-themed-minor-mode))

(add-hook 'eshell-load-hook #'eat-eshell-mode)
;; (add-hook 'eshell-load-hook #'eat-eshell-visual-command-mode)

;; (after! evil-cleverparens
;;   (require 'evil-cleverparens-text-objects)
;;   (map! :textobj "s" #'evil-cp-inner-form #'evil-cp-a-form))

(add-hook! '(scheme-mode-hook clojure-mode-hook emacs-lisp-mode-hook
             geiser-repl-mode-hook lisp-mode-hook racket-mode-hook
             racket-repl-mode-hook)
  (dolist (c '(?- ?_ ?? ?! ?+ ?* ?/ ?:))
    ;; TODO: how do we make this buffer-local?
    (modify-syntax-entry c "w"))
  (evil-cleverparens-mode)
  ;; remove s/S from cleverparens in favour of evil-snipe
  (map! :map evil-cleverparens-mode-map
        :nv "{" #'evil-cp-previous-opening
        :nv "}" #'evil-cp-next-opening
        :nv "g {" #'evil-cp-previous-closing
        :nv "g }" #'evil-cp-next-closing
        :nv "g l" #'paredit-forward-down
        :nv "g h" #'paredit-backward-up
        :nv "g j" #'sp-next-sexp
        :nv "g k" #'paredit-backward
        :nv "H" #'paredit-backward
        :nv "L" #'sp-next-sexp
        :nv "[" nil
        :nv "]" nil
        :nv "s" nil
        :nv "S" nil)
  (paredit-mode))

(use-package! websocket
  :after org-roam)

(use-package! org-roam-ui
  :after org-roam ;; or :after org
  ;;         normally we'd recommend hooking orui after org-roam, but since org-roam does not have
  ;;         a hookable mode anymore, you're advised to pick something yourself
  ;;         if you don't care about startup time, use
  ;;  :hook (after-init . org-roam-ui-mode)
  :config
  (setq org-roam-ui-sync-theme t
        org-roam-ui-follow t
        org-roam-ui-update-on-save t
        org-roam-ui-open-on-start t))

(defun syd/start-exwm ()
  (load! "+exwm"))
