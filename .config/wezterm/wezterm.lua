local wezterm = require("wezterm")
local config = {}

config.font = wezterm.font("Monolisa Nerd Font Mono")
config.font_size = 16
config.line_height = 1.0
config.hide_tab_bar_if_only_one_tab = true
config.enable_scroll_bar = false
config.use_fancy_tab_bar = false
config.tab_bar_at_bottom = true
-- config.color_scheme = "Catppuccin Mocha" -- or Macchiato, Frappe, Latte
config.color_scheme = "rose-pine-moon" -- or rose-pine-moon, rose-pine, rose-pine-dawn

-- config.use_resize_increments = true
config.window_padding = {
	left = 4,
	right = 0,
	top = 0,
	bottom = 0,
}

return config
