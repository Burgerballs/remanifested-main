crezy = 0
docuts = false

function onCreate()
    makeLuaSprite('crezy', nil, 0, 0)
	addLuaSprite('whit', false)

    makeLuaSprite('whit', 'bgmuk', 200, -300)
	addLuaSprite('whit', false)
    scaleObject('whit', 1.5, 1.5)

    makeLuaSprite('wittable', 'tablemuk', 200,400)
    scaleObject('wittable', 1.5, 1.5)
    setScrollFactor('wittable', 1, 0.3);
    addLuaSprite('wittable', true)


    makeAnimatedLuaSprite('amongle', 'greenmongle_speen', 1100,0);
	addAnimationByPrefix('amongle', 'mongle', 'greenamongle_spin', 24, true)
	objectPlayAnimation('amongle', 'mongle', false)
    setScrollFactor('amongle', 1, 1);
	addLuaSprite('amongle', false);
    setProperty('amongle.visible', false)
end

function onBeatHit()

    if curBeat == 160 then
        setProperty('amongle.visible', true)
    end

    if curBeat == 170 then
        docuts = true
        doTweenX('MoveInOne', 'crezy', 0.5, 2.8, 'SineInOut')
        triggerEvent('Camera Follow Pos',getGraphicMidpointX('amongle'),getGraphicMidpointY('amongle'))

        doTweenAlpha('MoveInOne2', 'canHUD', 0.2, 2, 'SineInOut')
    end
    if curBeat == 176 then
        docuts = false
        setProperty('defaultCamZoom', 1)
        doTweenAlpha('MoveInOne4', 'canHUD', 1, 0.2, 'SineInOut')
        triggerEvent('Camera Follow Pos', '', '')
        setProperty('amongle.visible', false)
    end
end

function onUpdatePost()
    if docuts then
        setProperty('defaultCamZoom', 1 + getProperty('crezy.x'))
    end
end