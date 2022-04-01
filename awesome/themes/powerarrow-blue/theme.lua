local gears = require("gears")
local lain = require("lain")
local awful = require("awful")
local wibox = require("wibox")
local math, string, os = math, string, os
local my_table = awful.util.table or gears.table -- 4.{0,1} compatibility

local theme = {}
theme.dir = os.getenv("HOME") .. "/.config/awesome/themes/powerarrow-blue"
theme.font = "Hack Nerd Font 10"
theme.taglist_font = "Hack Nerd Font 10"
theme.fg_normal = "#ffffff"
theme.widget_fg = "#282a36"
theme.fg_focus = "#61afef"
theme.fg_urgent = "#61afef"
theme.bg_normal = "#282a36"
theme.bg_focus = "#282a36"
theme.bg_urgent = "#282a36"
theme.taglist_fg_focus = "#61afef"
theme.tasklist_bg_focus = "#282a36"
theme.tasklist_fg_focus = "#61afef"
theme.border_width = 2
theme.border_normal = "#282a36"
theme.border_focus = "#61afef"
theme.border_marked = "#CC9393"
theme.titlebar_bg_focus = "#3F3F3F"
theme.titlebar_bg_normal = "#3F3F3F"
theme.titlebar_bg_focus = theme.bg_focus
theme.titlebar_bg_normal = theme.bg_normal
theme.titlebar_fg_focus = theme.fg_focus
theme.menu_height = 20
theme.menu_width = 140
theme.menu_submenu_icon = theme.dir .. "/icons/submenu.png"
theme.awesome_icon = theme.dir .. "/icons/awesome.png"
theme.taglist_squares_sel = theme.dir .. "/icons/square_sel.png"
theme.taglist_squares_unsel = theme.dir .. "/icons/square_unsel.png"
theme.layout_tile = theme.dir .. "/icons/tile.png"
theme.layout_tileleft = theme.dir .. "/icons/tileleft.png"
theme.layout_tilebottom = theme.dir .. "/icons/tilebottom.png"
theme.layout_tiletop = theme.dir .. "/icons/tiletop.png"
theme.layout_fairv = theme.dir .. "/icons/fairvw.png"
theme.layout_fairh = theme.dir .. "/icons/fairh.png"
theme.layout_spiral = theme.dir .. "/icons/spiral.png"
theme.layout_dwindle = theme.dir .. "/icons/dwindle.png"
theme.layout_max = theme.dir .. "/icons/maxw.png"
theme.layout_fullscreen = theme.dir .. "/icons/fullscreen.png"
theme.layout_magnifier = theme.dir .. "/icons/magnifier.png"
theme.layout_floating = theme.dir .. "/icons/floating.png"
theme.widget_ac = theme.dir .. "/icons/ac.png"
theme.widget_battery = theme.dir .. "/icons/battery.png"
theme.widget_battery_low = theme.dir .. "/icons/battery_low.png"
theme.widget_battery_empty = theme.dir .. "/icons/battery_empty.png"
theme.widget_mem = theme.dir .. "/icons/mem.png"
theme.widget_cpu = theme.dir .. "/icons/cpu.png"
theme.widget_temp = theme.dir .. "/icons/temp.png"
theme.widget_net = theme.dir .. "/icons/net.png"
theme.widget_hdd = theme.dir .. "/icons/hdd.png"
theme.widget_music = theme.dir .. "/icons/note.png"
theme.widget_music_on = theme.dir .. "/icons/note.png"
theme.widget_music_pause = theme.dir .. "/icons/pause.png"
theme.widget_music_stop = theme.dir .. "/icons/stop.png"
theme.widget_vol = theme.dir .. "/icons/vol.png"
theme.widget_vol_low = theme.dir .. "/icons/vol_low.png"
theme.widget_vol_no = theme.dir .. "/icons/vol_no.png"
theme.widget_vol_mute = theme.dir .. "/icons/vol_mute.png"
theme.widget_mail = theme.dir .. "/icons/mail.png"
theme.widget_mail_on = theme.dir .. "/icons/mail_on.png"
theme.widget_task = theme.dir .. "/icons/task.png"
theme.widget_scissors = theme.dir .. "/icons/scissors.png"
theme.widget_weather = theme.dir .. "/icons/dish.png"
theme.tasklist_plain_task_name = true
theme.tasklist_disable_icon = false
theme.useless_gap = 4
theme.titlebar_close_button_focus = theme.dir .. "/icons/titlebar/close_focus.png"
theme.titlebar_close_button_normal = theme.dir .. "/icons/titlebar/close_normal.png"
theme.titlebar_ontop_button_focus_active = theme.dir .. "/icons/titlebar/ontop_focus_active.png"
theme.titlebar_ontop_button_normal_active = theme.dir .. "/icons/titlebar/ontop_normal_active.png"
theme.titlebar_ontop_button_focus_inactive = theme.dir .. "/icons/titlebar/ontop_focus_inactive.png"
theme.titlebar_ontop_button_normal_inactive = theme.dir .. "/icons/titlebar/ontop_normal_inactive.png"
theme.titlebar_sticky_button_focus_active = theme.dir .. "/icons/titlebar/sticky_focus_active.png"
theme.titlebar_sticky_button_normal_active = theme.dir .. "/icons/titlebar/sticky_normal_active.png"
theme.titlebar_sticky_button_focus_inactive = theme.dir .. "/icons/titlebar/sticky_focus_inactive.png"
theme.titlebar_sticky_button_normal_inactive = theme.dir .. "/icons/titlebar/sticky_normal_inactive.png"
theme.titlebar_floating_button_focus_active = theme.dir .. "/icons/titlebar/floating_focus_active.png"
theme.titlebar_floating_button_normal_active = theme.dir .. "/icons/titlebar/floating_normal_active.png"
theme.titlebar_floating_button_focus_inactive = theme.dir .. "/icons/titlebar/floating_focus_inactive.png"
theme.titlebar_floating_button_normal_inactive = theme.dir .. "/icons/titlebar/floating_normal_inactive.png"
theme.titlebar_maximized_button_focus_active = theme.dir .. "/icons/titlebar/maximized_focus_active.png"
theme.titlebar_maximized_button_normal_active = theme.dir .. "/icons/titlebar/maximized_normal_active.png"
theme.titlebar_maximized_button_focus_inactive = theme.dir .. "/icons/titlebar/maximized_focus_inactive.png"
theme.titlebar_maximized_button_normal_inactive = theme.dir .. "/icons/titlebar/maximized_normal_inactive.png"

local markup = lain.util.markup
local separators = lain.util.separators

-- Textclock
local clockicon = wibox.widget.imagebox(theme.widget_clock)
local clock = awful.widget.watch("date +'%a %d %b %R'", 60, function(widget, stdout)
	widget:set_markup(" " .. markup.font(theme.font, stdout))
end)

-- Calendar
theme.cal = lain.widget.cal({
	attach_to = { clock },
	notification_preset = {
		font = "Hack Nerd Font 11",
		fg = theme.fg_normal,
		bg = theme.bg_normal,
	},
})

-- MEM
local memicon = wibox.widget.imagebox(theme.widget_mem)
local mem = lain.widget.mem({
	settings = function()
		widget:set_markup(markup.font(theme.font, " " .. mem_now.used .. "MB "))
	end,
})

-- CPU
local cpuicon = wibox.widget.imagebox(theme.widget_cpu)
local cpu = lain.widget.cpu({
	settings = function()
		widget:set_markup(markup.font(theme.font, " " .. cpu_now.usage .. "% "))
	end,
})

-- Battery
local baticon = wibox.widget.imagebox(theme.widget_battery)
local bat = lain.widget.bat({
	settings = function()
		if bat_now.status and bat_now.status ~= "N/A" then
			if bat_now.ac_status == 1 then
				widget:set_markup(markup.font(theme.font, " AC "))
				baticon:set_image(theme.widget_ac)
				return
			elseif not bat_now.perc and tonumber(bat_now.perc) <= 5 then
				baticon:set_image(theme.widget_battery_empty)
			elseif not bat_now.perc and tonumber(bat_now.perc) <= 15 then
				baticon:set_image(theme.widget_battery_low)
			else
				baticon:set_image(theme.widget_battery)
			end
			widget:set_markup(markup.font(theme.font, " " .. bat_now.perc .. "% "))
		else
			widget:set_markup()
			baticon:set_image(theme.widget_ac)
		end
	end,
})

-- ALSA volume
local volicon = wibox.widget.imagebox(theme.widget_vol)
theme.volume = lain.widget.alsa({
	settings = function()
		if volume_now.status == "off" then
			volicon:set_image(theme.widget_vol_mute)
		elseif tonumber(volume_now.level) == 0 then
			volicon:set_image(theme.widget_vol_no)
		elseif tonumber(volume_now.level) <= 50 then
			volicon:set_image(theme.widget_vol_low)
		else
			volicon:set_image(theme.widget_vol)
		end

		widget:set_markup(markup.font(theme.font, " " .. volume_now.level .. "% "))
	end,
})

-- Net
local neticon = wibox.widget.imagebox(theme.widget_net)
local net = lain.widget.net({
	settings = function()
		widget:set_markup(
			markup.fontfg(theme.font, "#FEFEFE", " " .. net_now.received .. " ↓↑ " .. net_now.sent .. " ")
		)
	end,
})

-- Separators
local arrow = separators.arrow_left

function theme.powerline_rl(cr, width, height)
	local arrow_depth, offset = height / 2, 0

	-- Avoid going out of the (potential) clip area
	if arrow_depth < 0 then
		width = width + 2 * arrow_depth
		offset = -arrow_depth
	end

	cr:move_to(offset + arrow_depth, 0)
	cr:line_to(offset + width, 0)
	cr:line_to(offset + width - arrow_depth, height / 2)
	cr:line_to(offset + width, height)
	cr:line_to(offset + arrow_depth, height)
	cr:line_to(offset, height / 2)

	cr:close_path()
end

local function pl(widget, bgcolor, padding)
	return wibox.container.background(wibox.container.margin(widget, 16, 16), bgcolor, theme.powerline_rl)
end

function theme.at_screen_connect(s)
	-- Quake application
	-- s.quake = lain.util.quake({ app = awful.util.terminal })
	s.quake = lain.util.quake({ app = "alacritty", height = 0.50, argname = "--name %s" })

	-- All tags open with layout 1
	awful.tag(awful.util.tagnames, s, awful.layout.layouts[1])

	-- Create an imagebox widget which will contains an icon indicating which layout we're using.
	-- We need one layoutbox per screen.
	s.mylayoutbox = awful.widget.layoutbox(s)
	s.mylayoutbox:buttons(my_table.join(
		awful.button({}, 1, function()
			awful.layout.inc(1)
		end),
		awful.button({}, 3, function()
			awful.layout.inc(-1)
		end),
		awful.button({}, 4, function()
			awful.layout.inc(1)
		end),
		awful.button({}, 5, function()
			awful.layout.inc(-1)
		end)
	))
	-- Create a taglist widget
	s.mytaglist = awful.widget.taglist(s, awful.widget.taglist.filter.all, awful.util.taglist_buttons)

	-- Create a tasklist widget
	s.mytasklist = awful.widget.tasklist(s, awful.widget.tasklist.filter.currenttags, awful.util.tasklist_buttons)

	-- Create a keyboard layout widget
	s.mykeylayout = awful.widget.keyboardlayout()

	-- Create a image box for the lua logo
	s.lualogo = wibox.widget.textbox("  ")
	s.lualogo.font = "Hack Nerd Font 16"

	-- Create the wibox
	s.mywibox = awful.wibar({ position = "top", screen = s, height = 20, bg = theme.bg_normal, fg = theme.fg_normal })

	-- Add widgets to the wibox
	s.mywibox:setup({
		layout = wibox.layout.align.horizontal,
		{ -- Left widgets
			layout = wibox.layout.fixed.horizontal,
			--spr,
			s.lualogo,
			s.mytaglist,
			s.brightness_widget,
			spr,
		},
		s.mytasklist, -- Middle widget
		{ -- Right widgets
			layout = wibox.layout.fixed.horizontal,
			wibox.widget.systray(),

			arrow("alpha", "#56b6c2"),
			wibox.container.background(wibox.container.margin(s.mykeylayout), "#56b6c2"),
			arrow("#56b6c2", "#e06c75"),
			wibox.container.background(
				wibox.container.margin(
					wibox.widget({ volicon, theme.volume.widget, layout = wibox.layout.align.horizontal }),
					2,
					3
				),
				"#e06c75"
			),
			arrow("#e06c75", "#c679dd"),
			wibox.container.background(
				wibox.container.margin(
					wibox.widget({ memicon, mem.widget, layout = wibox.layout.align.horizontal }),
					2,
					3
				),
				"#c679dd"
			),
			arrow("#c679dd", "#56b6c2"),
			wibox.container.background(
				wibox.container.margin(
					wibox.widget({ baticon, bat.widget, layout = wibox.layout.align.horizontal }),
					3,
					3
				),
				"#56b6c2"
			),
			arrow("#56b6c2", "#98c379"),
			wibox.container.background(
				wibox.container.margin(
					wibox.widget({ nil, neticon, net.widget, layout = wibox.layout.align.horizontal }),
					3,
					3
				),
				"#98c379"
			),
			arrow("#98c379", "#61afef"),
			wibox.container.background(wibox.container.margin(clock, 4, 8), "#61afef"),
			arrow("#61afef", "alpha"),
			--]]
			s.mylayoutbox,
		},
	})
end

return theme
