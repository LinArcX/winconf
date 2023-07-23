local wezterm = require 'wezterm'
local config = {}

local padding = {
	left = "1cell",
	right = "1cell",
	top = "0.3cell",
	bottom = "0.5cell",
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
config.window_background_opacity = 0.95
config.window_padding = padding
config.bold_brightens_ansi_colors = false
config.bidi_direction = "AutoLeftToRight"
config.color_scheme = get_theme()
config.font = wezterm.font 'JetBrains Mono'
config.font_size = 10
config.font_shaper = "Harfbuzz"
config.scrollback_lines = 9999
config.font = font_with_fallback({
	family = "Cascadia Mono",
	harfbuzz_features = {
		"zero",
	},
})

-- timeout_milliseconds defaults to 1000 and can be omitted
config.leader = { key = 'b', mods = 'CTRL', timeout_milliseconds = 1000 }
config.keys = {
  {
    key = 'v',
    mods = 'LEADER',
    action = wezterm.action.SplitHorizontal { domain = 'CurrentPaneDomain' },
  },
  {
    key = 'h',
    mods = 'LEADER',
    action = wezterm.action.SplitVertical { domain = 'CurrentPaneDomain' },
  },
  {
    key = 't',
    mods = 'LEADER',
    action = wezterm.action({ SpawnTab = "CurrentPaneDomain" })
  },
  {
	key = 'f',
	mods = 'LEADER',
	action = wezterm.action.ToggleFullScreen,
  },
  {
	key = 'l',
	mods = 'LEADER',
	action = wezterm.action.ShowLauncher,
  },
  {
    key = 'w',
    mods = 'LEADER',
    action = wezterm.action.CloseCurrentTab { confirm = true },
  },
  {
    key = 'z',
    mods = 'LEADER',
    action = wezterm.action.CloseCurrentPane { confirm = true },
  },
  -- Send "CTRL-A" to the terminal when pressing CTRL-A, CTRL-A
  {
    key = 'a',
    mods = 'LEADER|CTRL',
    action = wezterm.action.SendKey { key = 'a', mods = 'CTRL' },
  },
}

return config
