;; This "home-environment" file can be passed to 'guix home reconfigure'
;; to reproduce the content of your profile.  This is "symbolic": it only
;; specifies package names.  To reproduce the exact same profile, you also
;; need to capture the channels being used, as returned by "guix describe".
;; See the "Replicating Guix" section in the manual.

(use-modules (gnu home)
             (gnu packages)
             (gnu services)
             (guix gexp)
             (gnu home services)
             (gnu home services dotfiles)
             (gnu home services symlink-manager)
             (gnu home services shells))

(home-environment
  ;; Below is the list of packages that will show up in your
  ;; Home profile, under ~/.guix-home/profile.
  (packages
    (specifications->packages
      (list "neovim")))

  ;; Below is the list of Home services.  To search for available
  ;; services, run 'guix home search KEYWORD' in a terminal.
  (services
    (list
      (service home-symlink-manager-service-type)
      ; (service home-dotfiles-service-type
      ;        (home-dotfiles-configuration
      ;          (directories (list "./dots"))))
      ; (service home-xdg-configuration-files-service-type
      ;          `(("nvim" ,(local-file "dots/.config/nvim" #:recursive? #t))))
      (service home-dotfiles-service-type
               (home-dotfiles-configuration
                 (directories '("./dots"))
                 (layout 'stow)))
      (service home-bash-service-type
               (home-bash-configuration
                 (aliases '(("ls" . "ls --color=auto")
                            ("l"  . "ls -la --color=auto")
                            ("v"  . "nvim")))
                 (bashrc
                   (list (local-file ".bashrc"
                                     "bashrc")))
                 (bash-logout
                   (list (local-file ".bash_logout"
                                     "bash_logout"))))))))

