local hotkey = require 'hs.hotkey'
local wifi = require 'hs.wifi'

local wirelessModule = {}

function wirelessModule.init()
    local mash = { "cmd", "ctrl", "alt" }

    hotkey.bind(mash, 'W', function()
        wifi.setPower(not wifi.interfaceDetails().power)
    end)
end

return wirelessModule 

