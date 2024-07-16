;; This "home-environment" file can be passed to 'guix home reconfigure'
;; to reproduce the content of your profile.  This is "symbolic": it only
;; specifies package names.  To reproduce the exact same profile, you also
;; need to capture the channels being used, as returned by "guix describe".
;; See the "Replicating Guix" section in the manual.

(use-modules (gnu home)
             (gnu packages)
             (gnu services)
             (guix gexp)
             ; (gnu home services)
             ; (gnu home services dotfiles)
             ; (gnu home services symlink-manager)
             ; (gnu home services ssh)
             ; (gnu home services shells)
)

(define (service-dotfile . rest)
  (apply string-append "./service-dots" rest))

(home-environment
  ;; Below is the list of packages that will show up in your
  ;; Home profile, under ~/.guix-home/profile.
  (packages
    (specifications->packages
      (list "git" "stow" "zsh")))

  ;; Below is the list of Home services.  To search for available
  ;; services, run 'guix home search KEYWORD' in a terminal.
  (services
    (list
      ; (service home-symlink-manager-service-type)
      ; (service home-dotfiles-service-type
      ;          (home-dotfiles-configuration
      ;            (directories '("./dots"))
      ;            (layout 'stow)))
      ; (service home-zsh-service-type
      ;          (home-zsh-configuration
      ;            (zshrc
      ;              (list (local-file (service-dotfile "/zsh/zshrc"))
      ;                    (local-file (service-dotfile "/zsh/zsh-aliases"))
      ;                    (local-file (service-dotfile "/zsh/zsh-vi-mode/zsh-vi-mode.plugin.zsh"))))
      ;            (zlogout
      ;              (list (local-file (service-dotfile "/zsh/zsh-logout"))))
      ;            (zshenv
      ;              (list (local-file (service-dotfile "/zsh/zshenv"))))))
      ; (service home-inputrc-service-type
      ;          (home-inputrc-configuration
      ;            (variables
      ;              `(("bell-style" . "none")
      ;                ("colored-completion-prefix" . #t)
      ;                ("editing-mode" . "vi")
      ;                ("show-mode-in-prompt" . #t)
      ;                ("completion-ignore-case" . #t)
      ;                ("blink-matching-paren" . #t)))))
      #; (service home-openssh-service-type
               (home-openssh-configuration
                 #; (hosts
                   (list (openssh-host (name "")
                                       (user "charlie"))))
                 (authorized-keys (list (local-file "keys/fruitbook.pub"))))))))

