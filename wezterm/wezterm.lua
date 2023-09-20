local wezterm
package.preload["wezterm"] = package.preload["wezterm"] or function(...)
  local wezterm = require("wezterm")
  return {colors = require("nordic"), force_reverse_video_cursor = true, default_cursor_style = "BlinkingUnderline", font = wezterm.font("VictorMono Nerd Font", {}), font_size = 11, audible_bell = "Disabled", enable_tab_bar = false}
end
package.preload["nordic"] = package.preload["nordic"] or function(...)
  return {foreground = "#C7CDD8", background = "#0d1119", cursor_bg = "#c8c093", cursor_fg = "#c8c093", cursor_border = "#c8c093", selection_fg = "#C7CDD8", selection_bg = "#2E3440", scrollbar_thumb = "#16161d", split = "#16161d", ansi = {"#191C24", "#BF616A", "#A3BE8C", "#EBCB8B", "#81A1C1", "#B48EAD", "#8FBCBB", "#C7CDD8"}, brights = {"#3B4252", "#D06F79", "#B1D196", "#F0D399", "#88C0D0", "#C895BF", "#93CCDC", "#E5E9F0"}}
end
wezterm = require("wezterm")
return {colors = require("nordic"), force_reverse_video_cursor = true, default_cursor_style = "BlinkingUnderline", font = wezterm.font("VictorMono Nerd Font", {}), font_size = 11, audible_bell = "Disabled", enable_tab_bar = false}
