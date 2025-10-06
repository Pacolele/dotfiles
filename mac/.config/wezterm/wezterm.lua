local wezterm = require("wezterm")

local config = wezterm.config_builder()

-- Editor settings
config.initial_rows = 32
config.initial_cols = 150
config.window_decorations = "RESIZE"

config.window_padding = { left = 8, right = 8, top = 8, bottom = 8 }
-- Tab Appearance
config.use_fancy_tab_bar = true

-- Font settings
config.font_size = 13

-- Color scheme
config.color_scheme_dirs = { os.getenv("HOME") .. "/.config/wezterm/colors" }
config.color_scheme = "MelangeDark"

return config
