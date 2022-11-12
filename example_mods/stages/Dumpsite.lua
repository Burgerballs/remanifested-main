function onCreatePost()
    makeLuaSprite('sky', 'sky', -600, -650)
    addLuaSprite('sky')
		scaleObject('sky', 0.7, 0.7);
	setScrollFactor('sky', 0.5, 0.5);
    makeLuaSprite('ground', 'ground', -600, -650)
    addLuaSprite('ground')
		scaleObject('ground', 0.7, 0.7);
    makeLuaSprite('crane', 'crane', -600, -650)
    addLuaSprite('crane')
		scaleObject('crane', 0.7, 0.7);
    makeLuaSprite('cars', 'cars', -600, -650)
    addLuaSprite('cars')
		scaleObject('cars', 0.7, 0.7);
		setProperty('camGame.zoom', 2);
	makeAnimatedLuaSprite('LeftSkies', 'LeftSkies', -300, 200);
	addAnimationByPrefix('LeftSkies', 'LeftSkies', 'LeftSkies', 24, true)
	objectPlayAnimation('LeftSkies', 'LeftSkies', false)
	addLuaSprite('LeftSkies', false);
	makeAnimatedLuaSprite('RightSkies', 'RightSkies', 1400, 160);
	addAnimationByPrefix('RightSkies', 'RightSkies', 'RightSkies', 24, true)
	objectPlayAnimation('RightSkies', 'RightSkies', false)
	addLuaSprite('RightSkies', false);
		scaleObject('RightSkies', 1.1, 1.1);

end