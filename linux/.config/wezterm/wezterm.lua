local wezterm = require 'wezterm'
local config = {}

if wezterm.config_builder then
	config = wezterm.config_builder()
end

-- config.color_scheme = 'Google Dark (Gogh)'
-- config.color_scheme = 'GruvboxDarkHard'
-- config.color_scheme = 'Gruvbox dark, hard (base16)'
config.color_scheme = 'GJM (terminal.sexy)'
config.window_frame = {
	active_titlebar_bg = '#303030',
	inactive_titlebar_bg = '#303030',
}
config.window_padding = {
	left = 2,
	right = 2,
	top = 2,
	bottom = 2
}
config.colors = {
	tab_bar = {
		-- inactive_tab_edge = '#1d9020',
		active_tab = {
			bg_color = '#1d2020',
			fg_color = '#ece2cd',
		},
		inactive_tab = {
			bg_color = '#303030',
			fg_color = '#9b969b',
		},
		inactive_tab_hover = {
			bg_color = '#1d2020',
			fg_color = '#ece2cd',
		},
		new_tab = {
			bg_color = '#303030',
			fg_color = '#9b969b',
		},
		new_tab_hover = {
			bg_color = '#303030',
			fg_color = '#ffffff',
		}
	},
	-- foreground = '#ebdbb2',
	background = '#1d2020',
	-- cursor_bg = '',
	-- cursor_fg = '',
	-- cursor_border = '',
	selection_fg = '#000000',
	-- selection_bg = '#3b3735',
	selection_bg = '#fe811b',
	-- ansi = {
	-- 	"#282828",
	-- 	"#fb4934",
	-- 	"#b8bb26",
	-- 	"#fabd2f",
	-- 	"#83a598",
	-- 	"#d3869b",
	-- 	"#8ec07c",
	-- 	"#d5c4a1",
	-- },
	-- brights = {
	-- 	"#665c54",
	-- 	"#fb4934",
	-- 	"#b8bb26",
	-- 	"#fabd2f"
	-- 	"#83a598",
	-- 	"#d3869b",
	-- 	"#8ec07c",
	-- 	"#fbf1c7",
	-- },

	copy_mode_active_highlight_bg = { Color = '#fe811b' },
	copy_mode_active_highlight_fg = { Color = '#000000' },
	copy_mode_inactive_highlight_bg = { Color = '#fabd2e' },
	copy_mode_inactive_highlight_fg = { Color = '#000000' },
	quick_select_label_bg = { Color = '#fe811b' },
	quick_select_label_fg = { Color = '#000000' },
	quick_select_match_bg = { Color = '#fabd2e' },
	quick_select_match_fg = { Color = '#000000' },
}

-- config.default_prog = { 'powershell.exe' }
config.default_prog = { "/usr/bin/zsh", "-l" }

config.font = wezterm.font_with_fallback {
	'JetBrainsMono Nerd Font',
	-- 'SFMono Nerd Font',
	-- 'IosevkaMineNew Nerd Font Extended'
	-- 'InputMono NF'
	-- 'InputMine 1.3 Nerd Font'
}
config.font_size = 13.5
-- config.font_size = 10.0
-- Using this because 1.4 is just a little too big for terminal use
config.line_height = 1.2
-- config.line_height = 1.3   -- 1.2 in Jetbrains
-- config.line_height = 1.4   -- 1.3 in Jetbrains
-- config.line_height = 1.5   -- 1.4 in Jetbrains

-- Disable ligatures
config.harfbuzz_features = { 'calt=0', 'clig=0', 'liga=0' }
-- Disable window resizing, currently crashes terminal
config.adjust_window_size_when_changing_font_size = false

-- Hide tab bar with one tab
config.hide_tab_bar_if_only_one_tab = true

-- Disable annoying confirmation when closing tabs
config.window_close_confirmation = "NeverPrompt"

-- Bash one-liner to output links (must use printf to do this)
-- printf '\e]8;;http://www.google.com\e\\This is a link\e]8;;\e\\\n'

-- Custom URLs
config.hyperlink_rules = wezterm.default_hyperlink_rules()
-- Example, turns text matching "T123" into a url.
table.insert(config.hyperlink_rules, {
	regex = [[\b[tt](\d+)\b]],
	format = 'https://www.google.com/search?q=$1'
})

-- Quick Select Patterns
config.quick_select_patterns = {
	-- SHA1 hash
	-- '[0-9a-f]{7,40}'
}

config.disable_default_key_bindings = true
config.keys = {
	{
		key = 'c',
		mods = 'CTRL|SHIFT',
		action = wezterm.action.CopyTo('Clipboard')
	},
	{
		key = 'v',
		mods = 'CTRL|SHIFT',
		action = wezterm.action.PasteFrom('Clipboard')
	},
	{
		key = '-',
		mods = 'CTRL',
		action = wezterm.action.DecreaseFontSize
	},
	{
		key = '=',
		mods = 'CTRL',
		action = wezterm.action.IncreaseFontSize
	},
	{
		key = '0',
		mods = 'CTRL',
		action = wezterm.action.ResetFontSize
	},
	{
		key = 'PageUp',
		mods = 'CTRL',
		action = wezterm.action.ScrollByPage(-1)
	},
	{
		key = 'PageDown',
		mods = 'CTRL',
		action = wezterm.action.ScrollByPage(1)
	},
	-- {
	-- 	key = 'k',
	-- 	mods = 'CTRL|SHIFT',
	-- 	action = wezterm.action.ClearScrollback("ScrollbackOnly")
	-- },
	-- {
	-- 	key = 'l',
	-- 	mods = 'CTRL|SHIFT',
	-- 	action = wezterm.action.ShowDebugOverlay
	-- },
	{
		key = 'p',
		mods = 'CTRL|SHIFT',
		action = wezterm.action.ActivateCommandPalette
	},
	-- {
	-- 	key = '.',
	-- 	mods = 'SUPER|ALT',
	-- 	action = wezterm.action.CharSelect
	-- },
	{
		key = 'f',
		mods = 'CTRL|SHIFT',
		action = wezterm.action.Search({ CaseInSensitiveString = "" })
	},
	{
		key = '{',
		mods = 'SUPER|SHIFT',
		action = wezterm.action.ActivateTabRelative(-1)
	},
	{
		key = '}',
		mods = 'SUPER|SHIFT',
		action = wezterm.action.ActivateTabRelative(1)
	},
	{
		key = 'w',
		mods = 'SUPER',
		action = wezterm.action.CloseCurrentTab({ confirm=true })
	},
	{
		key = 't',
		mods = 'SUPER',
		action = wezterm.action.SpawnTab("DefaultDomain")
	},
	{
		key = 'Escape',
		mods = 'CTRL',
		action = wezterm.action.ActivateCopyMode
	},
	{
		key = 'Space',
		mods = 'CTRL|SHIFT',
		action = wezterm.action.QuickSelect
	},
	{
		key = 'n',
		mods = 'SUPER',
		action = wezterm.action.SpawnWindow
	},
}

return config
