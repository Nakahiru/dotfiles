local wezterm = require("wezterm")
local config = {}

-- OPTIONS
config.font = wezterm.font("Monolisa Nerd Font Mono")
config.font_size = 16
config.line_height = 1.0
config.hide_tab_bar_if_only_one_tab = true
config.enable_scroll_bar = false
config.use_fancy_tab_bar = false
config.tab_bar_at_bottom = true
config.color_scheme = "Catppuccin Mocha" -- or Macchiato, Frappe, Latte
-- config.color_scheme = "rose-pine-moon" -- or rose-pine-moon, rose-pine, rose-pine-dawn
config.window_background_opacity = 0.95
config.macos_window_background_blur = 50
config.window_decorations = "TITLE | RESIZE | MACOS_FORCE_ENABLE_SHADOW"
config.use_resize_increments = false
config.window_padding = {
	left = 4,
	right = 0,
	top = 0,
	bottom = 0,
}

-- KEYMAPS
config.leader = { key = "a", mods = "CTRL", timeout_milliseconds = 1000 }
config.disable_default_key_bindings = true
config.keys = {
	{ key = "L", mods = "LEADER", action = wezterm.action.ShowDebugOverlay },
	{ key = "u", mods = "LEADER", action = wezterm.action.ActivateCommandPalette },
	{
		key = "r",
		mods = "LEADER",
		action = wezterm.action.ActivateKeyTable({
			name = "resize_pane",
			one_shot = false,
		}),
	},

	{ key = "v", mods = "CMD", action = wezterm.action.PasteFrom("Clipboard") },
	{ key = "c", mods = "CMD", action = wezterm.action.CopyTo("Clipboard") },
	{ key = "f", mods = "CMD", action = wezterm.action.Search({ CaseSensitiveString = "" }) },

	{ mods = "LEADER", key = "1", action = wezterm.action.ActivateTab(0) },
	{ mods = "LEADER", key = "2", action = wezterm.action.ActivateTab(1) },
	{ mods = "LEADER", key = "3", action = wezterm.action.ActivateTab(2) },
	{ mods = "LEADER", key = "4", action = wezterm.action.ActivateTab(3) },
	{ mods = "LEADER", key = "5", action = wezterm.action.ActivateTab(4) },
	{ mods = "LEADER", key = "6", action = wezterm.action.ActivateTab(5) },
	{ mods = "LEADER", key = "7", action = wezterm.action.ActivateTab(6) },
	{ mods = "LEADER", key = "8", action = wezterm.action.ActivateTab(7) },
	{ mods = "LEADER", key = "9", action = wezterm.action.ActivateTab(-1) },

	-- splitting
	{ mods = "LEADER|CTRL", key = "-", action = wezterm.action.SplitVertical({ domain = "CurrentPaneDomain" }) },
	{ mods = "LEADER", key = "-", action = wezterm.action.SplitVertical({ domain = "CurrentPaneDomain" }) },

	{ mods = "LEADER|CTRL", key = "|", action = wezterm.action.SplitHorizontal({ domain = "CurrentPaneDomain" }) },
	{ mods = "LEADER", key = "|", action = wezterm.action.SplitHorizontal({ domain = "CurrentPaneDomain" }) },

	{ mods = "LEADER|CTRL", key = "n", action = wezterm.action.ActivateTabRelative(1) },
	{ mods = "LEADER", key = "n", action = wezterm.action.ActivateTabRelative(1) },

	{ mods = "LEADER|CTRL", key = "p", action = wezterm.action.ActivateTabRelative(-1) },
	{ mods = "LEADER", key = "p", action = wezterm.action.ActivateTabRelative(-1) },

	{ mods = "LEADER|CTRL", key = "c", action = wezterm.action.SpawnTab("CurrentPaneDomain") },
	{ mods = "LEADER", key = "c", action = wezterm.action.SpawnTab("CurrentPaneDomain") },

	{ mods = "LEADER|CTRL", key = "q", action = wezterm.action.CloseCurrentTab({ confirm = true }) },
	{ mods = "LEADER", key = "q", action = wezterm.action.CloseCurrentTab({ confirm = true }) },

	{ key = "h", mods = "LEADER", action = wezterm.action.ActivatePaneDirection("Left") },

	{ key = "l", mods = "LEADER", action = wezterm.action.ActivatePaneDirection("Right") },

	{ key = "k", mods = "LEADER|CTRL", action = wezterm.action.ActivatePaneDirection("Up") },
	{ key = "k", mods = "LEADER", action = wezterm.action.ActivatePaneDirection("Up") },

	{ key = "j", mods = "LEADER|CTRL", action = wezterm.action.ActivatePaneDirection("Down") },
	{ key = "j", mods = "LEADER", action = wezterm.action.ActivatePaneDirection("Down") },
}

wezterm.on("update-right-status", function(window, pane)
	local current_theme = wezterm.color.get_builtin_schemes()[config.color_scheme]
	local text_foreground = current_theme.foreground
	local LEFT_ARROW = utf8.char(0xe0b2)
	local cells = {}

	local leader = ""
	local active_key_table = window:active_key_table()
	wezterm.log_info(active_key_table)

	if window:leader_is_active() then
		leader = "LEADER "
	end

	local date = wezterm.strftime("%a %b %-d %H:%M")

	table.insert(cells, leader)
	table.insert(cells, date)
	table.insert(cells, active_key_table)

	local elements = {}
	local num_cells = 0

	local color_for_each_cell = {
		current_theme.ansi[4],
		current_theme.ansi[2],
		current_theme.ansi[6],
	}

	local function formatCell(text, is_last)
		local cell_no = num_cells + 1
		table.insert(elements, { Foreground = { Color = text_foreground } })
		table.insert(elements, { Background = { Color = color_for_each_cell[cell_no] } })
		table.insert(elements, { Text = " " .. text .. " " })
		if not is_last then
			table.insert(elements, { Foreground = { Color = color_for_each_cell[cell_no + 1] } })
			table.insert(elements, { Text = LEFT_ARROW })
		end
		num_cells = num_cells + 1
	end

	while #cells > 0 do
		local cell = table.remove(cells, 1)
		formatCell(cell, #cells == 0)
	end

	window:set_right_status(wezterm.format(elements))
end)

-- The filled in variant of the < symbol
local SOLID_LEFT_ARROW = wezterm.nerdfonts.pl_right_hard_divider

-- The filled in variant of the > symbol
local SOLID_RIGHT_ARROW = wezterm.nerdfonts.pl_left_hard_divider

-- This function returns the suggested title for a tab.
-- It prefers the title that was set via `tab:set_title()`
-- or `wezterm cli set-tab-title`, but falls back to the
-- title of the active pane in that tab.
function tab_title(tab_info)
	local title = tab_info.tab_title
	-- if the tab title is explicitly set, take that
	if title and #title > 0 then
		return title
	end
	-- Otherwise, use the title from the active pane
	-- in that tab
	return tab_info.tab_index .. ": " .. tab_info.active_pane.title
end

local test = wezterm.color.get_builtin_schemes()[config.color_scheme]
-- wezterm.log_info(test)
-- wezterm.log_info(test.background)
-- wezterm.log_info(test.brights[1])

wezterm.on("format-tab-title", function(tab, tabs, panes, config, hover, max_width)
	local edge_background = test.ansi[1]
	local background = test.ansi[1]
	local foreground = test.foreground

	if tab.is_active then
		background = test.ansi[5]
		foreground = test.foreground
	elseif hover then
		foreground = test.ansi[5]
	end

	if tab.is_active == false and tab.tab_index < 0 then
		edge_background = test.background
	end
	if tab.is_active == true and tab.tab_index < 0 then
		edge_background = test.background
	end
	if tab.tab_index == (#tabs - 1) then
		edge_background = test.background
	end

	local bar = tab.tab_index - 1
	if tab.tab_index == 0 then
		bar = tab.tab_index
	end

	local previous_tab = tabs[bar + 1]
	-- wezterm.log_info(previous_tab)
	-- wezterm.log_info(config.resolved_palette.ansi)
	-- wezterm.log_info(tabs[bar + 1].tab_id)

	-- wezterm.log_info(tab.tab_index)
	local foo = ""
	-- if tab.tab_index ~= 0 then
	-- 	foo = SOLID_LEFT_ARROW
	-- end

	local edge_foreground = background

	local title = tab_title(tab)

	-- ensure that the titles fit in the available space,
	-- and that we have room for the edges.
	title = wezterm.truncate_right(title, max_width - 3)

	return {
		{ Background = { Color = background } },
		{ Foreground = { Color = foreground } },
		{ Text = " " .. title .. " " },
		{ Background = { Color = edge_background } },
		{ Foreground = { Color = edge_foreground } },
		{ Text = SOLID_RIGHT_ARROW },
	}
end)

config.colors = {
	tab_bar = {
		background = test.background,
		new_tab = {
			bg_color = test.background,
			fg_color = test.foreground,
		},
		new_tab_hover = {
			bg_color = test.background,
			fg_color = test.ansi[7],
			italic = true,
		},
	},
	compose_cursor = test.ansi[7],
}

config.key_tables = {
	resize_pane = {
		{ key = "h", action = wezterm.action.AdjustPaneSize({ "Left", 1 }) },
		{ key = "l", action = wezterm.action.AdjustPaneSize({ "Right", 1 }) },
		{ key = "k", action = wezterm.action.AdjustPaneSize({ "Up", 1 }) },
		{ key = "j", action = wezterm.action.AdjustPaneSize({ "Down", 1 }) },
		-- Cancel the mode by pressing escape
		{ key = "Escape", action = "PopKeyTable" },
	},
}

return config
