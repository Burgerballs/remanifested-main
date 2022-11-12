function onCreate()
	makeLuaSprite('lb', 'lightblueBG', -1150, -340);
	setScrollFactor('lb', 1, 1);
	scaleObject('lb', 1.3, 1.3)
	addLuaSprite('lb', false);
	makeLuaSprite('lbtc', 'Trashcan', 350, 250);
	setScrollFactor('lbtc', 1, 1);
	scaleObject('lbtc', 1.1, 1.1)
	addLuaSprite('lbtc', false);
end