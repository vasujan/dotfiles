local wezterm = require 'wezterm'

local config = {}
-- Use config builder if available
if wezterm.config_builder then
	local config = wezterm.config_builder()
end

-- config.color_scheme = 'Tokyo Night'
-- config.color_scheme = 'AdventureTime'
-- config.color_scheme = 'Batman'

config.font = wezterm.font_with_fallback({
	{ family = "MesloLGS Nerd Font Mono" },
})

config.window_background_opacity = 0.8
config.macos_window_background_blur = 15

config.initial_cols = 120
config.initial_rows = 40

config.window_decorations = "RESIZE"
config.window_close_confirmation = "AlwaysPrompt"
config.window_padding = {
  left = '1cell',
  right = '1cell',
  top = '0.5cell',
  bottom = '0.5cell',
}

-- config.enable_tab_bar = true
config.use_fancy_tab_bar = false
config.hide_tab_bar_if_only_one_tab = true


return config
