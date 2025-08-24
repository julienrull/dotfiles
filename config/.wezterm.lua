-- Pull in the wezterm API
local wezterm = require 'wezterm'

-- This will hold the configuration.
local config = wezterm.config_builder()
config.font = wezterm.font('IosevkaTermNerdFont')
-- This is where you actually apply your config choices.

config.enable_tab_bar = false 
config.window_background_opacity = 0.98

-- For example, changing the initial geometry for new windows:
config.initial_cols = 120
config.initial_rows = 28

-- or, changing the font size and color scheme.
config.font_size = 24
config.color_scheme = 'Gruber (base16)'

-- Finally, return the configuration to wezterm:
return config
