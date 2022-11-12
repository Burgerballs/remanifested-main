function onCreate()
	setPropertyFromClass('GameOverSubstate', 'characterName', 'skyDeath'); --Character json file for the death animation
	setPropertyFromClass('GameOverSubstate', 'deathSoundName', 'UndertaleDeathSound'); --put in mods/sounds/
	setPropertyFromClass('GameOverSubstate', 'loopSoundName', 'Avril14'); --put in mods/music/
end
function onGameOver()

setProperty('camGame.zoom',0.8)
setProperty('defaultCamZoom',0.8)
end