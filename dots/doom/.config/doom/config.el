;;; $DOOMDIR/config.el -*- lexical-binding: t; -*-

;; Place your private configuration here! Remember, you do not need to run 'doom
;; sync' after modifying this file!

(progn
  (require 'server)
  (when (server-running-p)
    (setenv "EDITOR" "emacsclient")
    (setenv "VISUAL" "emacsclient")))

;; Some functionality uses this to identify you, e.g. GPG configuration, email
;; clients, file templates and snippets. It is optional.
(setq user-full-name "sydney goose"
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
      ;; doom-variable-pitch-font (font-spec :family "VictorMono NF" :size 13)
      doom-variable-pitch-font (font-spec :family "Overpass" :size 13)
      doom-big-font (font-spec :family "VictorMono NF" :size 17))

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
(setq doom-theme 'kanagawa)
;; (load-theme 'kanagawa)
;; (use-package kanagawa-theme
;;   :ensure t
;;   :config
;;   (load-theme 'kanagawa t))
;; (setq doom-theme 'doom-one)

;; This determines the style of line numbers in effect. If set to `nil', line
;; numbers are disabled. For relative line numbers, set this to `relative'.
(setq display-line-numbers-type 'relative)

;; If you use `org' and don't want your org files in the default location below,
;; change `org-directory'. It must be set before org loads!
(setq org-directory "~/org")
(setq org-mobile-inbox-for-pull "~/org/mobile-inbox.org")
(setq org-mobile-directory "~/Dropbox/Apps/Metanote")
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
  (define-key evil-normal-state-map "#" 'evilnc-comment-operator)
  (define-key evil-visual-state-map "#" 'evilnc-comment-operator)
  (setq evil-move-beyond-eol t)
  (setq evil-vsplit-window-right t)
  (setq evil-snipe-scope 'visible))

(key-chord-mode 1)
(key-chord-define evil-visual-state-map "JK" 'evil-normal-state)

(setq indent-tabs-mode nil
      tab-width 2)

(with-eval-after-load 'yasnippet
  (add-to-list 'yas-snippet-dirs "~/git/guix/etc/snippets/yas"))

(global-tree-sitter-mode)
(add-hook 'tree-sitter-after-on-hook
          #'tree-sitter-hl-mode)

(setq idris-interpreter-path "idris2")

(map! :after haskell
      :map haskell-mode-map
      :localleader
      "a i" (cmd! (haskell-add-import))
      "a d" #'haskell-cabal-add-dependency)

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

(add-hook! 'eshell-mode-hook
  (setq eshell-list-files-after-cd t)
  (appendq! eshell-visual-commands '("nix-shell")))

(after! paredit
  )

(defun efs/exwm-update-class ()
  (exwm-workspace-rename-buffer exwm-class-name))

;(use-package! exwm
; :config
; ;; Set the default number of workspaces
; (setq exwm-workspace-number 5)
;
; ;; When window "class" updates, use it to set the buffer name
; ;; (add-hook 'exwm-update-class-hook #'efs/exwm-update-class)
;
; ;; These keys should always pass through to Emacs
; (setq exwm-input-prefix-keys
;   '(?\C-x
;     ?\C-u
;     ?\C-h
;     ?\M-x
;     ?\M-`
;     ?\M-&
;     ?\M-:
;     ?\C-\M-j  ;; Buffer list
;     ?\C-\ ))  ;; Ctrl+Space
;
; ;; Ctrl+Q will enable the next key to be sent directly
; (define-key exwm-mode-map [?\C-q] 'exwm-input-send-next-key)
;
; ;; Set up global key bindings.  These always work, no matter the input state!
; ;; Keep in mind that changing this list after EXWM initializes has no effect.
; (setq exwm-input-global-keys
;       `(
;         ;; Reset to line-mode (C-c C-k switches to char-mode via exwm-input-release-keyboard)
;         ([?\s-r] . exwm-reset)
;
;         ;; Move between windows
;         ([?\s-h] . windmove-left)
;         ([?\s-j] . windmove-down)
;         ([?\s-k] . windmove-up)
;         ([?\s-l] . windmove-right)
;
;         ;; Launch applications via shell command
;         ([?\s-&] . (lambda (command)
;                      (interactive (list (read-shell-command "$ ")))
;                      (start-process-shell-command command nil command)))
;
;         ;; Switch workspace
;         ([?\s-w] . exwm-workspace-switch)
;
;         ;; 's-N': Switch to certain workspace with Super plus a number key (0 - 9)
;         ,@(mapcar (lambda (i)
;                     `(,(kbd (format "s-%d" i)) .
;                       (lambda ()
;                         (interactive)
;                         (exwm-workspace-switch-create ,i))))
;                   (number-sequence 0 9))))
; (exwm-enable))
