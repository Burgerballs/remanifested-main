percent=0

function onCreatePost()
    makeLuaSprite('hpbar', 'healthBarBG', 100, 0)
    screenCenter('hpbar', 'y')
    addLuaSprite('hpbar')
    setObjectCamera('hpbar', 'hud')
    makeLuaSprite('totallyrealbar', nil, getProperty('hpbar.x') + 4, getProperty('hpbar.y') + 6);
    makeGraphic('totallyrealbar', 10, 600 - 12, '6f0000');
    addLuaSprite('totallyrealbar');
    setObjectCamera('totallyrealbar', 'hud');
    makeLuaSprite('enemybar', nil, getProperty('hpbar.x') + 4, getProperty('hpbar.y') + 6);
    makeGraphic('enemybar', 10, 600 - 12 - 300, 'ba68dd');
    addLuaSprite('enemybar');
    setObjectCamera('enemybar', 'hud');

    updatehealthbar()

    makeAnimatedLuaSprite('theicon2', 'icons/sky', 25, 0)
    addAnimationByIndices('theicon2', 'idle', 'idle', '0', 0)
    addAnimationByIndices('theicon2', 'lose', 'lose', '0', 0)
    addAnimationByIndices('theicon2', 'win', 'idle', '0', 0)
    addLuaSprite('theicon2')
    setObjectCamera('theicon2', 'hud')
    objectPlayAnimation('theicon2', 'idle')
    setProperty('theicon2.y', getProperty('totallyrealbar.y') + getProperty('health')*294 - 75)
end

function onUpdatePost(elapsed)
    setProperty('theicon2.y', getProperty('totallyrealbar.y') + getProperty('health')*294- 75)
    if getProperty('health') <= 0 then
        setProperty('theicon2.y', getProperty('totallyrealbar.y') - 75)
    end
    if getProperty('health') >= 2 then
        setProperty('theicon2.y', getProperty('totallyrealbar.y') + 294*2 - 75)
    end
    if manifesting then
        if getProperty('health') >= 1.60 then
            objectPlayAnimation('theicon2', 'lose')
        elseif getProperty('health') <= 0.40 then
            objectPlayAnimation('theicon2', 'idle')
        else
            objectPlayAnimation('theicon2', 'idle')
        end
    else
        if getProperty('health') >= 1.60 then
            objectPlayAnimation('theicon2', 'idle')
        elseif getProperty('health') <= 0.40 then
            objectPlayAnimation('theicon2', 'lose')
        else
            objectPlayAnimation('theicon2', 'idle')
        end
    end
    if songstarted then
    setGraphicSize('theicon2', lerp(150, getProperty('theicon2.width'),  boundTo(1 - (elapsed * 9), 0, 1)))
    updateHitbox('theicon2')
    end
    updatehealthbar()
end
function updatehealthbar()
    local funval = getProperty('health')*294
    if manifesting then
        makeGraphic('enemybar', 10, funval, '6f0000');
    else
    makeGraphic('enemybar', 10, funval, 'ba68dd');
    end
end

function onBeatHit()
    if curBeat % 2 == 0 then
        
        setGraphicSize('theicon2', getProperty('theicon2.width')*1.20, getProperty('theicon2.height')*1.20)
        updateHitbox('theicon2')
	else
	
        setGraphicSize('theicon2', getProperty('theicon2.width')*1.075, getProperty('theicon2.height')*1.075)
        updateHitbox('theicon2')
	end
end

function lerp(a, b, ratio)
	return a + (ratio * (b - a))
end

function boundTo(value, min, max)
    local newValue = value
    if newValue < min then
        newValue = min
    elseif newValue > max then
        newValue = max
    end
    return newValue
end

function onSongStart()
    songstarted = true
end

function onStepHit()
	if curStep == 10 then
		modchart = false
	end
	if curStep == 384 or curStep == 768 or curStep == 1151 or curStep == 1172 or curStep == 1276 or curStep == 1282 or curStep == 1304 or curStep == 1536 or curStep == 1922 or curStep == 1937 or curStep == 1943 or curStep == 1956 then
		fleetON()
	end
	if curStep == 640 or curStep == 1024 or curStep == 1154 or curStep == 1176 or curStep == 1279 or curStep == 1300 or curStep == 1408 or curStep == 1792 or curStep == 1926 or curStep == 1940 or curStep == 1946 or curStep == 1960 then
		fleetOFF()
	end
end

function fleetON()
    manifesting = true
    setObjectCamera('hpbar', 'hud')
    makeLuaSprite('totallyrealbar', nil, getProperty('hpbar.x') + 4, getProperty('hpbar.y') + 6);
    makeGraphic('totallyrealbar', 10, 600 - 12, 'ba68dd');
    addLuaSprite('totallyrealbar');
    setObjectCamera('totallyrealbar', 'hud');
    makeLuaSprite('enemybar', nil, getProperty('hpbar.x') + 4, getProperty('hpbar.y') + 6);
    makeGraphic('enemybar', 10, 600 - 12 - 300, '6f0000');
    addLuaSprite('enemybar');
    setObjectCamera('enemybar', 'hud');
    makeAnimatedLuaSprite('theicon2', 'icons/manifestsky', 25, 0)
    addAnimationByIndices('theicon2', 'idle', 'idle', '0', 0)
    addAnimationByIndices('theicon2', 'lose', 'lose', '0', 0)
    addAnimationByIndices('theicon2', 'win', 'idle', '0', 0)
    addLuaSprite('theicon2')
    setObjectCamera('theicon2', 'hud')
    objectPlayAnimation('theicon2', 'idle')
    setProperty('theicon2.y', getProperty('totallyrealbar.y') + getProperty('health')*294 - 75)
end
function fleetOFF()
    manifesting = false
    setObjectCamera('hpbar', 'hud')
    makeLuaSprite('totallyrealbar', nil, getProperty('hpbar.x') + 4, getProperty('hpbar.y') + 6);
    makeGraphic('totallyrealbar', 10, 600 - 12, '6f0000');
    addLuaSprite('totallyrealbar');
    setObjectCamera('totallyrealbar', 'hud');
    makeLuaSprite('enemybar', nil, getProperty('hpbar.x') + 4, getProperty('hpbar.y') + 6);
    makeGraphic('enemybar', 10, 600 - 12 - 300, 'ba68dd');
    addLuaSprite('enemybar');
    setObjectCamera('enemybar', 'hud');
    makeAnimatedLuaSprite('theicon2', 'icons/sky', 25, 0)
    addAnimationByIndices('theicon2', 'idle', 'idle', '0', 0)
    addAnimationByIndices('theicon2', 'lose', 'lose', '0', 0)
    addAnimationByIndices('theicon2', 'win', 'idle', '0', 0)
    addLuaSprite('theicon2')
    setObjectCamera('theicon2', 'hud')
    objectPlayAnimation('theicon2', 'idle')
    setProperty('theicon2.y', getProperty('totallyrealbar.y') + getProperty('health')*294 - 75)
end