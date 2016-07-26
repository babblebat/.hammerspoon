local audio = require('hs.audiodevice')

local audioModule = {}

local lastMuteState
local menuBar = hs.menubar.new()

local mutedIconData = 
[[ASCII:
· · · · · · . . 2 · · ·
7 A · · · · . # 3 · · ·
· # # · · · # · # · · ·
· · 7 A · # · · # · · ·
1 # # 1 2 · · · # · · ·
6 · · · 8 B · · # · · ·
# · · · . # # · # · · ·
# · · · · · # B # · · ·
6 · · · · · · 8 # · · ·
5 # # 5 4 . . · # C . ·
· · · · · # · · # 9 # ·
· · · · · · # · # · # C
· · · · · · · 4 # · · 9
· · · · · · · . 3 · · ·
]]

local unMutedIconData = 
[[ASCII:
· · · · · · · . 3
· . · · · · . # #
· · . · · · # · #
· · · . · # · · #
1 # # # 2 · · · #
# · · · · · · · #
# · · · . · · · #
# · · · · · · · #
# · · · · · · · #
6 # # # 5 . . · #
· · · · · # · · #
· · · · · · # · #
· · · · · · · # #
· · · · · · · . 4
]]


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
		menuBar:setIcon(mutedIconData)
	else 
		menuBar:setIcon(unMutedIconData)
	end
end


return audioModule