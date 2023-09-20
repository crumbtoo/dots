(local wezterm          (require :wezterm))

{ ;;; appearance
  :colors   (require :nordic)
  :enable_tab_bar false
  :force_reverse_video_cursor true

  ;; cursor
  :default_cursor_style "BlinkingUnderline"

  ;; font
  :font (wezterm.font "VictorMono Nerd Font" {  })
  :font_size 11

  ;;; behaviour
  :audible_bell "Disabled"
}

