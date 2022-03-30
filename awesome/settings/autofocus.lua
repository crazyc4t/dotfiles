local client = client
local screen = screen
local aclient = require("awful.client")
local atag = require("awful.tag")

--- When loaded, this module makes sure that there's always a client that will have focus
-- on events such as tag switching, client unmanaging, etc.
-- awful.autofocus

-- Give focus when clients appear/disappear and no one else has focus.
-- @param obj An object that should have a .screen property.
function check_focus(obj)
	-- When no visible client has the focus...
	if not client.focus or not client.focus:isvisible() then
		local c = aclient.focus.history.get(obj.screen, 0)
		if c then
			client.focus = c
		end
	end
end

-- Give focus on tag selection change.
-- @param tag A tag object
function check_focus_tag(t)
	local s = atag.getscreen(t)
	if not s then
		return
	end
	check_focus({ screen = s })
	if client.focus and client.focus.screen ~= s then
		local c = aclient.focus.history.get(s, 0)
		if c then
			client.focus = c
		end
	end
end

--made above functions global & removed some focus switches below (user interaction required instead)

--clear any focus
function clear_focus()
	--unfortunately this doesn't work at the moment
	--cf. https://github.com/awesomeWM/awesome/issues/164
	--(Qubes uses an older AwesomeWM version that doesn't have the fix yet)
	--client.focus = nil
end

atag.attached_connect_signal(nil, "property::selected", check_focus_tag)
client.connect_signal("unmanage", clear_focus)
client.connect_signal("tagged", check_focus)
client.connect_signal("untagged", check_focus)
client.connect_signal("property::hidden", clear_focus)
client.connect_signal("property::minimized", clear_focus)
