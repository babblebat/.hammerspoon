local hotkey = require 'hs.hotkey'

local appsModule = {}

function appsModule.init()
    local mash = { "cmd", "ctrl", "alt" }

    hotkey.bind(mash, 'C', function()
    	hs.application.launchOrFocus("Google Chrome")
    end)
    hotkey.bind(mash, 'T', function()
    	hs.application.launchOrFocus("Terminal")
    end)
end

return appsModule 

