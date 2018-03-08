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
    hotkey.bind(mash, 'X', function()
    	hs.application.launchOrFocus("XCode")
    end)
    hotkey.bind(mash, 'I', function()
    	hs.application.launchOrFocus("IntelliJ IDEA")
    end)
    hotkey.bind(mash, 'A', function()
    	hs.application.launchOrFocus("AppCode")
    end)
    hotkey.bind(mash, 'K', function()
    	hs.application.launchOrFocus("Visual Studio Code")
    end)
end

return appsModule 

