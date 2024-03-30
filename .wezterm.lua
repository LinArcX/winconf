local wezterm = require 'wezterm'
local action = wezterm.action
local mux = wezterm.mux
local config = {}

config.use_fancy_tab_bar = true
config.show_tabs_in_tab_bar = true
config.window_decorations = "INTEGRATED_BUTTONS|RESIZE"
config.integrated_title_button_style = "Windows"

wezterm.on("gui-startup", function()
  local tab, pane, window = mux.spawn_window{}
  window:gui_window():maximize()
end)

local padding = {
	left = "0.3cell",
	right = "0.1cell",
	top = "0.1cell",
	bottom = "0.0cell",
}

-- Reload the configuration every ten minutes
wezterm.time.call_after(600, function()
	wezterm.reload_configuration()
end)

-- A helper function for my fallback fonts
local function font_with_fallback(name, params)
	local names = { name, "FiraCode Nerd Font", "mini-file-icons", "Hack Nerd Font", "SauceCodePro Nerd Font" }
	return wezterm.font_with_fallback(names, params)
end

local function get_theme()
	local _time = os.date("*t")
	if _time.hour >= 1 and _time.hour < 9 then
		return "Rosé Pine (base16)"
	elseif _time.hour >= 9 and _time.hour < 17 then
		return "Gruvbox Light"
	elseif _time.hour >= 17 and _time.hour < 21 then
		return "Earthsong"
	elseif _time.hour >= 21 and _time.hour < 24 or _time.hour >= 0 and _time.hour < 1 then
		return "kanagawabones"
	end
end

config.bidi_enabled = true
config.enable_scroll_bar = true
config.window_background_opacity = 0.99
config.window_padding = padding
config.bold_brightens_ansi_colors = false
config.bidi_direction = "AutoLeftToRight"
config.color_scheme = 'Eighties (dark) (terminal.sexy)' --get_theme()
config.font = wezterm.font 'CaskaydiaMono Nerd Font'
config.font_size = 10
config.font_shaper = "Harfbuzz"
config.scrollback_lines = 9999
config.font = font_with_fallback({
	family = "CaskaydiaMono Nerd Font",
	harfbuzz_features = {
		"zero",
	},
})

-- timeout_milliseconds defaults to 1000 and can be omitted
config.leader = { key = 'b', mods = 'CTRL', timeout_milliseconds = 1000 }
config.keys = {
  {
    key = 'LeftArrow',
    mods = 'LEADER',
    action = action.AdjustPaneSize { 'Left', 2 },
  },
  {
    key = 'RightArrow',
    mods = 'LEADER',
    action = action.AdjustPaneSize { 'Right', 2 },
  },
  {
    key = 'UpArrow',
    mods = 'LEADER',
    action = action.AdjustPaneSize { 'Up', 2 }
  },
  {
    key = 'DownArrow',
    mods = 'LEADER',
    action = action.AdjustPaneSize { 'Down', 2 },
  },

  {
    key = 'LeftArrow',
    mods = 'SHIFT|CTRL',
    action = action.ActivatePaneDirection 'Left',
  },
  {
    key = 'RightArrow',
    mods = 'SHIFT|CTRL',
    action = action.ActivatePaneDirection 'Right',
  },
  {
    key = 'UpArrow',
    mods = 'SHIFT|CTRL',
    action = action.ActivatePaneDirection 'Up',
  },
  {
    key = 'DownArrow',
    mods = 'SHIFT|CTRL',
    action = action.ActivatePaneDirection 'Down',
  },


  --{ 
  --  key = 'a',
  --  mods = 'ALT',
  --  action = action.ActivatePaneByIndex(0)
  --},
  --{ 
  --  key = 'b',
  --  mods = 'ALT',
  --  action = action.ActivatePaneByIndex(1)
  --},
  --{ 
  --  key = 'c',
  --  mods = 'ALT',
  --  action = action.ActivatePaneByIndex(2) 
  --},
  {
    key = 'h',
    mods = 'LEADER',
    action = action.SplitHorizontal { domain = 'CurrentPaneDomain' },
  },
  {
    key = 'v',
    mods = 'LEADER',
    action = action.SplitVertical { domain = 'CurrentPaneDomain' },
  },
  {
    key = 't',
    mods = 'LEADER',
    action = action({ SpawnTab = "CurrentPaneDomain" })
  },
  { 
	  key = 'f',
	  mods = 'LEADER',
	  action = action.ToggleFullScreen,
  },
  { 
	  key = 'l',
	  mods = 'LEADER',
	  action = action.ShowLauncher,
  },
  {
    key = 'w',
    mods = 'LEADER',
    action = action.CloseCurrentTab { confirm = true },
  },
  {
    key = 'x',
    mods = 'LEADER',
    action = action.CloseCurrentPane { confirm = true },
  },
  -- Send "CTRL-A" to the terminal when pressing CTRL-A, CTRL-A
  {
    key = 'a',
    mods = 'LEADER|CTRL',
    action = wezterm.action.SendKey { key = 'a', mods = 'CTRL' },
  },
}

return config
