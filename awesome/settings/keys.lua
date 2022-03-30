local gears = require("gears")
local awful = require("awful")

globalkeys = gears.table.join(

	---------- Window Managment ---------
	awful.key({ modkey }, "j", function()
		awful.client.focus.global_bydirection("down")
		if client.focus then
			client.focus:raise()
		end
	end, { description = "focus down", group = "client" }),
	awful.key({ modkey }, "k", function()
		awful.client.focus.global_bydirection("up")
		if client.focus then
			client.focus:raise()
		end
	end, { description = "focus up", group = "client" }),
	awful.key({ modkey }, "h", function()
		awful.client.focus.global_bydirection("left")
		if client.focus then
			client.focus:raise()
		end
	end, { description = "focus left", group = "client" }),
	awful.key({ modkey }, "l", function()
		awful.client.focus.global_bydirection("right")
		if client.focus then
			client.focus:raise()
		end
	end, { description = "focus right", group = "client" }),

	awful.key({ modkey, "Control" }, ".", function()
		awful.screen.focus_relative(1)
	end, { description = "focus the next screen", group = "screen" }),
	awful.key({ modkey, "Control" }, ",", function()
		awful.screen.focus_relative(-1)
	end, { description = "focus the previous screen", group = "screen" }),
	awful.key({ modkey, "Control" }, "l", function()
		awful.tag.incmwfact(0.05)
	end, { description = "increase master width factor", group = "layout" }),
	awful.key({ modkey, "Control" }, "h", function()
		awful.tag.incmwfact(-0.05)
	end, { description = "decrease master width factor", group = "layout" }),
	awful.key({ modkey, "Shift" }, "h", function()
		awful.tag.incnmaster(1, nil, true)
	end, { description = "increase the number of master clients", group = "layout" }),
	awful.key({ modkey, "Shift" }, "l", function()
		awful.tag.incnmaster(-1, nil, true)
	end, { description = "decrease the number of master clients", group = "layout" }),
	awful.key({ modkey }, "Tab", function()
		awful.layout.inc(1)
	end, { description = "select next", group = "layout" }),

	-- Standard program

	awful.key({ modkey, "Control" }, "r", awesome.restart, { description = "reload awesome", group = "awesome" }),
	awful.key({ modkey, "Shift" }, "q", awesome.quit, { description = "quit awesome", group = "awesome" }),

	---------- Apps Hotkeys -------
	-- Terminal
	awful.key({ modkey }, "Return", function()
		awful.spawn(terminal)
	end),
	-- Rofi prompt
	awful.key({ modkey }, "r", function()
		awful.spawn("rofi -show drun")
	end),

	awful.key({ modkey, "Shift" }, "r", function()
		awful.spawn("rofi -show")
	end),

	-- Keyboard Layouts
	awful.key({ modkey }, "x", function()
		awful.spawn("setxkbmap us")
	end),

	awful.key({ modkey }, "z", function()
		awful.spawn("setxkbmap es olpc")
	end),

	-- Spotify
	awful.key({ modkey }, "s", function()
		awful.spawn("spotify")
	end),

	-- Volume
	awful.key({}, "XF86AudioLowerVolume", function()
		awful.spawn("pactl set-sink-volume @DEFAULT_SINK@ -10%")
	end),
	awful.key({}, "XF86AudioRaiseVolume", function()
		awful.spawn("pactl set-sink-volume @DEFAULT_SINK@ +10%")
	end),

	-- Brightness
	awful.key({}, "XF86MonBrightnessDown", function()
		awful.spawn("brightnessctl set 10%-")
	end),
	awful.key({}, "XF86MonBrightnessUp", function()
		awful.spawn("brightnessctl set +10%")
	end),

	-- Web Browser
	awful.key({ modkey }, "b", function()
		awful.spawn(browser)
	end),

	-- Redshift
	awful.key({ modkey }, "e", function()
		awful.spawn("redshift -O 4000k")
	end),
	awful.key({ modkey, "Shift" }, "e", function()
		awful.spawn("redshift -x")
	end),

	-- Discord
	awful.key({ modkey }, "d", function()
		awful.spawn("discord")
	end),

	-- Thunar
	awful.key({ modkey }, "f", function()
		awful.spawn("thunar")
	end),

	-- Lock Screen
	awful.key({ modkey, "Mod1" }, "l", function()
		awful.spawn("betterlockscreen -l")
	end)
)

clientkeys = gears.table.join(
	awful.key({ modkey }, "w", function(c)
		c:kill()
	end, { description = "close", group = "client" }),
	awful.key(
		{ modkey, "Shift" },
		"f",
		awful.client.floating.toggle,
		{ description = "toggle floating", group = "client" }
	)
)

-- Bind all key numbers to tags.
-- Be careful: we use keycodes to make it work on any keyboard layout.
-- This should map on the top row of your keyboard, usually 1 to 9.
for i = 1, 9 do
	globalkeys = gears.table.join(
		globalkeys,
		-- View tag only.
		awful.key({ modkey }, "#" .. i + 9, function()
			local screen = awful.screen.focused()
			local tag = screen.tags[i]
			if tag then
				tag:view_only()
			end
		end, { description = "view tag #" .. i, group = "tag" }),
		-- Toggle tag display.
		awful.key({ modkey, "Control" }, "#" .. i + 9, function()
			local screen = awful.screen.focused()
			local tag = screen.tags[i]
			if tag then
				awful.tag.viewtoggle(tag)
			end
		end, { description = "toggle tag #" .. i, group = "tag" }),
		-- Move client to tag.
		awful.key({ modkey, "Shift" }, "#" .. i + 9, function()
			if client.focus then
				local tag = client.focus.screen.tags[i]
				if tag then
					client.focus:move_to_tag(tag)
				end
			end
		end, { description = "move focused client to tag #" .. i, group = "tag" }),
		-- Toggle tag on focused client.
		awful.key({ modkey, "Control", "Shift" }, "#" .. i + 9, function()
			if client.focus then
				local tag = client.focus.screen.tags[i]
				if tag then
					client.focus:toggle_tag(tag)
				end
			end
		end, { description = "toggle focused client on tag #" .. i, group = "tag" })
	)
end

clientbuttons = gears.table.join(
	awful.button({}, 1, function(c)
		c:emit_signal("request::activate", "mouse_click", { raise = true })
	end),
	awful.button({ modkey }, 1, function(c)
		c:emit_signal("request::activate", "mouse_click", { raise = true })
		awful.mouse.client.move(c)
	end),
	awful.button({ modkey }, 3, function(c)
		c:emit_signal("request::activate", "mouse_click", { raise = true })
		awful.mouse.client.resize(c)
	end)
)

-- Set keys
root.keys(globalkeys)
