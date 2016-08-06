local audio = require ('modules/audio')
local arrows = require ('modules/arrows')
local wireless = require ('modules/wireless')

-- bind mash+R to reload Hammerspoon config
hs.hotkey.bind({"cmd", "alt", "ctrl"}, "R", function()
	hs.reload()
end)

audio.init()
arrows.init()
wireless.init()
