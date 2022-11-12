function onCreate()
	setPropertyFromClass('GameOverSubstate', 'characterName', 'unavailable'); --Character json file for the death animation
	setPropertyFromClass('GameOverSubstate', 'loopSoundName', ''); --put in mods/music/
	setPropertyFromClass('GameOverSubstate', 'deathSoundName', 'Error'); --put in mods/sounds/
end
function onGameOver()

setProperty('camFollowPos.x',790)
setProperty('camFollowPos.y',120)
setProperty('camFollow.x',790)
setProperty('camFollow.y',120)

setProperty('camGame.scroll.x',790)
setProperty('camGame.scroll.y',120)

setProperty('isCameraOnForcedPos',true)
setProperty('camGame.zoom',1.1)
setProperty('defaultCamZoom',1.1)
end