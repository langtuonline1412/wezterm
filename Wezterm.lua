-- Pull in the wezterm API
local wezterm = require("wezterm")

-- This will hold the configuration
if wezterm.config_builder then
    config = wezterm.config_builder()
end

-- Color Scheme
config.color_scheme = "Tokyo Night"
config.colors = {
    foreground = "#CBE0F0",
    background = "#011423",
    cursor_bg = "47FF9C",
    cursor_border = "#47FF9C",
    cursor_fg = "#47FF9C",
    selection_bg = "#033259",
    selection_fg = "#CBE0F0",
    ansi = { "#214969", "#E52E2E", "#44FFB1", "#FFE073", "#0FC5ED", "#a277ff", "#24EAF7", "#24EAF7" },
    brights = { "#214969", "#E52E2E", "#44FFB1", "#FFE073", "#A277FF", "#a277ff", "#24EAF7", "#24EAF7" },

    tab_bar = {
        background = "#00141d",   -- col_gray1
        active_tab = {
            bg_color = "#80bfff", -- col_gray2 (bright blue tab)
            fg_color = "#00141d", -- dark text on active tab
        },
        inactive_tab = {
            bg_color = "#1a1a1a", -- col_gray4
            fg_color = "#FFFFFF", -- col_gray3
        },
        new_tab = {
            bg_color = "#1a1a1a",
            fg_color = "#4fc3f7", -- col_barbie (for the "+" button)
        },
    },
}
config.window_background_opacity = 0.85

-- Background
config.window_background_image = "C:/Users/Dai/.config/wezterm/bg/wallpaper.jpg"
-- config.window_background_image = "$env:USERPROFILE/.config/wezterm/bg/wallpaper.jpg"
config.window_background_image_hsb = {
    brightness = 0.3,
    hue = 1.0,
    saturation = 1.0,
}
-- config.text_background_opacity = 0.3

-- Font
config.font = wezterm.font("MesloLGM Nerd Font")
config.font_size = 12

-- window
-- config.window_decorations = "RESIZE | TITLE"
config.window_decorations = "RESIZE"

config.window_padding = {
    left = 2,
    right = 2,
    top = 0,
    bottom = 0,
}

-- Initial geometry for new windows
config.initial_cols = 120
config.initial_rows = 28

-- tab bar
config.enable_tab_bar = true
config.hide_tab_bar_if_only_one_tab = true
config.tab_bar_at_bottom = true

-- Keybindings using ALT for tabs & splits
config.keys = {
    -- Tab management
    { key = "t",          mods = "ALT",        action = wezterm.action.SpawnTab("CurrentPaneDomain") },
    { key = "w",          mods = "ALT",        action = wezterm.action.CloseCurrentTab({ confirm = false }) },
    { key = "Tab",        mods = "CTRL",       action = wezterm.action.ActivateTabRelative(1) },
    { key = "Tab",        mods = "CTRL|SHIFT", action = wezterm.action.ActivateTabRelative(-1) },

    -- Panel management
    { key = "v",          mods = "ALT",        action = wezterm.action.SplitVertical({ domain = "CurrentPaneDomain" }) },
    { key = "h",          mods = "ALT",        action = wezterm.action.SplitHorizontal({ domain = "CurrentPaneDomain" }) },
    { key = "q",          mods = "ALT",        action = wezterm.action.CloseCurrentPane({ confirm = false }) },

    -- Pane navigation (move between panes with ALT + Arrows)
    { key = "LeftArrow",  mods = "ALT",        action = wezterm.action.ActivatePaneDirection("Left") },
    { key = "RightArrow", mods = "ALT",        action = wezterm.action.ActivatePaneDirection("Right") },
    { key = "UpArrow",    mods = "ALT",        action = wezterm.action.ActivatePaneDirection("Up") },
    { key = "DownArrow",  mods = "ALT",        action = wezterm.action.ActivatePaneDirection("Down") },

    { key = "LeftArrow",  mods = "CTRL|ALT",   action = wezterm.action.AdjustPaneSize({ "Left", 1 }) },
    { key = "RightArrow", mods = "CTRL|ALT",   action = wezterm.action.AdjustPaneSize({ "Right", 1 }) },
    { key = "UpArrow",    mods = "CTRL|ALT",   action = wezterm.action.AdjustPaneSize({ "Up", 1 }) },
    { key = "DownArrow",  mods = "CTRL|ALT",   action = wezterm.action.AdjustPaneSize({ "Down", 1 }) },
}

-- Mouse bindings for quick action
config.mouse_bindings = {
    -- Right-click to copy selection
    {
        event = { Down = { streak = 1, button = "Right" } },
        mods = "NONE",
        action = wezterm.action.CopyTo("Clipboard"),
    },
    -- Middle-click to splitt horizontally
    {
        event = { Down = { streak = 1, button = "Middle" } },
        mods = "NONE",
        action = wezterm.action.SplitHorizontal({ domain = "CurrentPaneDomain" }),
    },
    -- Shift+Middle-click to close the split (pane)
    {
        event = { Down = { streak = 1, button = "Middle" } },
        mods = "SHIFT",
        action = wezterm.action.CloseCurrentPane({ confirm = false }),
    },
}

-- default shell
-- config.default_prog = { "pwsh.exe", "-NoLogo" }
config.default_prog = { "wsl.exe", "-d", "Ubuntu", "-e", "tmux" }
-- config.default_prog = {
-- 	"C:/Users/Dai/scoop/apps/msys2/current/usr/bin/bash.exe",
-- 	"-l",
-- 	"-i",
-- 	"-c",
-- 	"tmux new-session -A -s main",
-- }

-- Finally, return the configuration to wezterm
return config
