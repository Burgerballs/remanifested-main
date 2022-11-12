function onCreate()
	setPropertyFromClass('GameOverSubstate', 'characterName', 'skyDeath'); --Character json file for the death animation
	setPropertyFromClass('GameOverSubstate', 'deathSoundName', 'UndertaleDeathSound'); --put in mods/sounds/
	setPropertyFromClass('GameOverSubstate', 'loopSoundName', 'Avril14'); --put in mods/music/
end