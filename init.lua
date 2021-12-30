local audio = require ('modules/audio')
local arrows = require ('modules/arrows')
local wireless = require ('modules/wireless')
local apps = require ('modules/apps')

-- test ability to push

-- bind mash+R to reload Hammerspoon config
hs.hotkey.bind({"cmd", "alt", "ctrl"}, "R", function()
	hs.reload()
end)

-- audio.init()
arrows.init()
wireless.init()
apps.init()
