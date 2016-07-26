local audio = require('hs.audiodevice')

local audioModule = {}

local lastMuteState
local menuBar = hs.menubar.new()

function audioModule.init()
	lastMuteState = currentMuteState()
	updateMenuBar()
	audio.current().device:watcherCallback(audioWatcherCallback):watcherStart()
end

function audioWatcherCallback(devUID, eventName, scope, element)  
	if ((eventName == 'mute') and  (currentMuteState() ~= lastMuteState)) then
		lastMuteState = currentMuteState()
		updateMenuBar()
	end
end

function currentMuteState() 
	return audio.current().muted
end

function updateMenuBar()
	-- see http://apps.timwhitlock.info/emoji/tables/unicode for Unicode emoji bytes
	if lastMuteState == true then
			title = '\xF0\x9F\x94\x87'
		else 
			title = '\xF0\x9F\x94\x89'
		end

		menuBar:setTitle(title)
end


return audioModule