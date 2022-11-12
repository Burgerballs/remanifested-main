function onCreatePost()
    makeLuaText("score", "", 1280, 0, 360)
    setTextAlignment("score", 'center')
    setTextSize('score', 40)
    setTextBorder('score', 0, 'FFFFFF')
    addLuaText("score")

    makeLuaSprite('overlay', nil, -600, -300)
	makeGraphic('overlay', 3000, 2000, '000000')
	addLuaSprite('overlay', true)
    setProperty('overlay.alpha', 0)
end

function onEvent(name, value1, value2)
	if name == "message" then
		setProperty('score.text', value1)
	end
    if name == "goingdark" then
        doTweenAlpha('ooo dark','overlay', value1, value2, 'sineInOut')
    end
    if name == "Speed Bounce" then
		speedBounce(value1 / 1.5, value2 / (stepCrochet / 10))
	end
end

function speedBounce(target, duration)
    triggerEvent('Change Scroll Speed', target, 0)
    triggerEvent('Change Scroll Speed', 1, duration)
end