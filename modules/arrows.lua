local hotkey = require 'hs.hotkey'
local window = require 'hs.window'

local position = require('modules/position')
local monitors = require('modules/monitors')

local arrowsModule = {}

function arrowsModule.init()
    local mash = { "cmd", "ctrl", "alt" }
    local keys = {
        UP = "top",
        DOWN = "bottom",
        LEFT = "left",
        RIGHT = "right",
        SPACE = "full"
    }

    for key, position_string in pairs(keys) do
        local position_fn = position[position_string]

        if position_fn == nil then
            error("arrow: " .. position_string .. " is not a valid position")
        end

        hotkey.bind(mash, key, function()
            local win = window.focusedWindow()
            if win == nil then
                return
            end

            local screen = win:screen()
            local dimensions = monitors.get_screen_dimensions(screen)
            local newframe = position_fn(dimensions)

            win:setFrame(newframe)
        end)

    end

end

return arrowsModule 
