local audio = require ('modules/audio')
local arrows = require ('modules/arrows')

-- bind mash+R to reload Hammerspoon config
hs.hotkey.bind({"cmd", "alt", "ctrl"}, "R", function()
	hs.reload()
end)

audio.init()
arrows.init()
