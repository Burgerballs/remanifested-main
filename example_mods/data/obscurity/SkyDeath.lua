function onCreate()
	setPropertyFromClass('GameOverSubstate', 'characterName', 'Skydead'); --Character json file for the death animation
	setPropertyFromClass('GameOverSubstate', 'loopSoundName', 'FakerDeath'); --put in mods/music/
	setPropertyFromClass('GameOverSubstate', 'deathSoundName', 'Crash'); --put in mods/sounds/
end