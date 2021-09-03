local wezterm = require 'wezterm';
return {

  -- define the leader, similar to tmux
  leader = { key="s", mods="CTRL" },

  window_padding = {
    left = 3, right = 3,
    top = 3, bottom = 3,
  },
  exit_behavior = "Close",

  -- tab related configurations
  enable_tab_bar = true,
  hide_tab_bar_if_only_one_tab = true,
  tab_max_width = 32,

  -- colorscheme and fonts
  font = wezterm.font("Source Code Pro"),
  color_scheme = "OneHalfDark",
  font_size = 18.0,

  -- scrollback and history,
  enable_scroll_bar = true,
  scrollback_lines = 10000,
  keys = {
    -- search for things that look like git hashes
    {key="H", mods="SHIFT|CTRL", action=wezterm.action{Search={Regex="[a-f0-9]{6,}"}}},

    -- Shift tabs (previous and next) using CMD and arrow keys.
    {key="LeftArrow", mods="CMD", action=wezterm.action{ActivateTabRelative=-1}},
    {key="RightArrow", mods="CMD", action=wezterm.action{ActivateTabRelative=1}},
  },

}
