;;; ../../git/dots/dots/doom/.config/doom/exwm.el -*- lexical-binding: t; -*-

(defun mb/set-keys ()
  ;; These keys should always pass through to Emacs when in line mode.
  (setq exwm-input-prefix-keys
        `,@(mapcar (lambda (vector) (aref vector 0))
                   `(,@(mapcar (lambda (i) (kbd (format "s-%s" i)))
                               (number-sequence 0 9)) ;; Pass s-[0-9] through.
                     ;; ,(kbd "C-h")
                     ,(kbd "C-x")
                     ,(kbd "C-\\")
                     ,(kbd "C-w")
                     ,(kbd "C-g")
                     ,(kbd "C-SPC")
                     ,(kbd "M-x")
                     ;; ,(kbd "M-`")
                     ;; ,(kbd "M-&")
                     ,(kbd "M-:")
                     ,(kbd "s-,")
                     ,(kbd "s-$")
                     ,(kbd "s-.")
                     ,(kbd "s-;")
                     ,(kbd "s-/")
                     ,(kbd "s-g"))))

  ;; Make Doom's leader work.
  (exwm-input-set-key (kbd doom-leader-alt-key) doom-leader-map)

  ;; Ctrl+Q will enable the next key to be sent directly.
  (define-key exwm-mode-map [?\C-q] 'exwm-input-send-next-key)

  ;; Rofi-styled launcher.
  (exwm-input-set-key (kbd "s-d") #'app-launcher-run-app)

  ;; Configure global key bindings.
  (setq exwm-input-global-keys
        `(([?\s-i] . exwm-input-toggle-keyboard)
          ([?\s-f] . exwm-layout-toggle-fullscreen)
          ([?\s-$] . (lambda (command)
                       (interactive (list (read-shell-command "$ ")))
                       (start-process-shell-command command nil command)))
          ,@(mapcar (lambda (i)
                      `(,(kbd (format "s-%d" i)) .
                        (lambda ()
                          (interactive)
                          (exwm-workspace-switch-create ,i))))
                    (number-sequence 0 9)))))

(use-package! exwm
  :init
  (setq
   ;; Use the primary clipboard.
   select-enable-primary t
   ;; Follow the mouse.
   focus-follows-mouse t
   ;; Move the focus to the followed window.
   mouse-autoselect-window t
   ;; Warp the cursor automatically after workspace switches.
   exwm-workspace-warp-cursor t
   ;; Start with a single workspace.
   exwm-workspace-number 10
   ;; But show buffers on other workspaces.
   exwm-workspace-show-all-buffers t
   ;; And allow switching to buffers on other workspaces.
   exwm-layout-show-all-buffers t)
  :config
  (mb/set-keys)
  (add-hook 'exwm-update-title-hook
            (lambda ()
              (exwm-workspace-rename-buffer exwm-class-name)))
  (exwm-systemtray-mode 1)
  (setq input-method-use-echo-area t)
  (setenv "GTK_IM_MODULE" "xim")
  (setenv "QT_IM_MODULE" "xim")
  (setenv "XMODIFIERS" "@im=exwm-xim")
  (setenv "CLUTTER_IM_MODULE" "xim")
  (require 'exwm-xim)
  (exwm-xim-mode 1)
  (exwm-enable))

(use-package exwm-edit
  :config
  ;; Edit text in an *exwm-edit* buffer
  (add-to-list 'exwm-input-global-keys '([?\C-c ?\'] . exwm-edit--compose)))

;; (use-package! exwm-evil
;;   :after exwm
;;   :config
;;   (add-hook 'exwm-manage-finish-hook #'enable-exwm-evil-mode)
;;   (cl-pushnew 'escape exwm-input-prefix-keys)

;;   ;; We will disable `C-c' in insert state.
;;   (define-key exwm-mode-map (kbd "C-c") nil)

;;   (map! :map exwm-mode-map
;;         :localleader
;;         (:prefix ("d" . "debug")
;;          :desc "Clear debug buffer" "l" #'xcb-debug:clear
;;          :desc "Insert mark into the debug buffer" "m" #'xcb-debug:mark
;;          :desc "Enable debug logging" "t" #'exwm-debug)
;;         :desc "Toggle fullscreen" "f" #'exwm-layout-toggle-fullscreen
;;         :desc "Hide floating window" "h" #'exwm-floating-hide
;;         :desc "Send next key" "q" #'exwm-input-send-next-key
;;         :desc "Toggle floating" "SPC" #'exwm-floating-toggle-floating
;;         :desc "Send escape" "e" (cmd! (exwm-evil-send-key 1 'escape))
;;         :desc "Toggle modeline" "m" #'exwm-layout-toggle-mode-line))
