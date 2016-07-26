local audio = require ('modules/audio')

-- bind mash+R to reload Hammerspoon config
hs.hotkey.bind({"cmd", "alt", "ctrl"}, "R", function()
	hs.reload()
end)

audio.init()