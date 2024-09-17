-- Pull in the wezterm API
local wezterm = require 'wezterm'

-- This will hold the configuration.
local config = wezterm.config_builder()

-- This is where you actually apply your config choices

-- For example, changing the color scheme:
config.color_scheme = 'Catppuccin Macchiato'

-- Change the fontsize
config.font = wezterm.font("FiraCode Nerd Font Mono")
config.font_size = 9

-- disable the tab bar
config.enable_tab_bar = false

-- Remove window decorations
config.window_decorations = "RESIZE"
config.window_background_opacity = 0.9
-- config.window_background_opacity = 1

-- Autostart WSL
config.default_domain = 'WSL:Ubuntu'

-- and finally, return the configuration to wezterm
return config
