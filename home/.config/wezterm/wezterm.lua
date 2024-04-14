local wezterm = require 'wezterm';
local mux = wezterm.mux

wezterm.on('gui-startup', function(window)
    local tab, pane, window = mux.spawn_window(cmd or {})
    local gui_window = window:gui_window()
    gui_window:perform_action(wezterm.action.ToggleFullScreen, pane)
end)


return {

  native_macos_fullscreen_mode = true,
	
  -- Font configuration
  font = wezterm.font("JetBrainsMono Nerd Font"),
  
    -- Set the default font size
  font_size = 14.0,

  -- Color scheme
 
  -- Window configuration
  window_padding = {
    left = 8,
    right = 8,
    top = 8,
    bottom = 8,
  },

  -- Cursor configuration
  default_cursor_style = "BlinkingBlock",


  -- Ligatures
  harfbuzz_features = {"calt=0"},

  -- Keybindings
  keys = {
    {key="c", mods="ALT", action=wezterm.action{SplitHorizontal={domain="CurrentPaneDomain"}}},
    {key="-", mods="CTRL", action=wezterm.action{SplitVertical={domain="CurrentPaneDomain"}}},
    {key="=", mods="CTRL", action=wezterm.action{SplitHorizontal={domain="CurrentPaneDomain"}}},
    {key="t", mods="CTRL", action=wezterm.action{SpawnTab="CurrentPaneDomain"}},
    {key="d", mods="CTRL", action=wezterm.action{CloseCurrentTab={confirm=true}}},
  },

  -- Scrolling
  enable_scroll_bar = true,
  scrollback_lines = 5000,

  -- True color
  enable_wayland = true,
}
