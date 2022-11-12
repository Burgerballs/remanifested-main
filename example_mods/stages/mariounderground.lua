local hits = 0
local bush = 0
local bush2 = 0
local hill = 0
local blocks = 0
local cloud = 0
local current = "-fire"
local invinc = 0
local flash = 0
local thing = 15
local upscrollpos = 0
function onCreatePost()
    setProperty('timeBar.y', 10000)
    setProperty('timeTxt.y', 10000)
    setPropertyFromClass('GameOverSubstate', 'characterName', 'pixelbluedeath'); --Character json file for the death animation
	setPropertyFromClass('GameOverSubstate', 'loopSoundName', 'Smashing Windshields'); --put in mods/music/
    for i = 0,3 do
        setPropertyFromGroup('strumLineNotes', i, "x", getPropertyFromGroup('strumLineNotes', i, "x") - 775)
    end
    for i = 4,7 do
        setPropertyFromGroup('strumLineNotes', i, "x", getPropertyFromGroup('strumLineNotes', i, "x") - 80)
        setPropertyFromGroup('strumLineNotes', i, "y", getPropertyFromGroup('strumLineNotes', i, "y") + thing)
    end
    if downscroll then
        cameraSetTarget("boyfriend")
    end
    setProperty('health', 2)
    setProperty('healthBar.visible', false)
    setProperty('healthBarBG.visible', false)
    setProperty('iconP2.visible', false)
    setProperty('iconP1.visible', false)
    makeLuaSprite('atmosphere', 'bg/sky', -500,-500)
    scaleObject('atmosphere', 2,2)
    addLuaSprite('atmosphere')
    setProperty('atmosphere.color', '000000')
    makeLuaSprite("blocks", 'bg/underground/blocks', 0, -207)
    scaleObject('blocks.antialiasing', false)
    scaleObject('blocks', 10,10)
    for i = 1, 16 do
        makeLuaSprite(tostring(i), "bg/underground/block",(i*160) - 540,319)
        scaleObject(tostring(i), 10,10)
        addLuaSprite(tostring(i))
        makeLuaSprite(tostring(-i), "bg/underground/block",(i*160) - 540,479)
        scaleObject(tostring(-i), 10,10)
        addLuaSprite(tostring(-i))
        setProperty(tostring(i) .. ".antialiasing", false)
        setProperty(tostring(-i) .. ".antialiasing", false)
    end
    makeLuaSprite('borderL', 'bg/aspect',0,0)
    addLuaSprite('borderL', false)
    setObjectCamera("borderL", "hud")
    makeLuaText("score", "000000", 255, 166, 720 - 50)
    setTextAlignment("score", 'left')
    setTextFont("score","Press Start 2P.ttf")
    setTextSize('score', 40)
    setTextBorder('score', 0, 'FFFFFF')
    addLuaText("score")
    makeLuaText("accuracy", getProperty('ratingPercent') .. '%', 500, 620, 720 - 50)
    setTextAlignment("accuracy", 'right')
    setTextFont("accuracy","Press Start 2P.ttf")
    setTextSize('accuracy', 40)
    setTextBorder('accuracy', 0, 'FFFFFF')
    addLuaText("accuracy")
    setProperty('scoreTxt.visible', false)
    setProperty('showRating', false)
    setProperty('blocks.antialiasing', false)
    setProperty('numScore.visible', false)
    triggerEvent("Alt Idle Animation", "BF", "-fire")
    if downscroll == true then 
        scaleObject('borderL', 1, -1)
    end
    makeAnimatedLuaSprite('flags', 'pixelUI/flags', 600, 720 - 35)
    addAnimationByPrefix('flags', 'die', 'die', 1, true)
    addAnimationByPrefix('flags', 'flagminus', 'flagminus', 1, true)
    addAnimationByPrefix('flags', 'flagplus', 'flagplus', 1, true)
    addAnimationByPrefix('flags', 'flagcheck', 'flagcheck', 1, true)
    screenCenter('flags', 'x')
    setProperty('flags.antialiasing', false)
    
    addLuaSprite('flags', false)
    setObjectCamera("flags", "hud")
    
    setProperty('flags.scale.x', 7)
    setProperty('flags.scale.y', 7)

    objectPlayAnimation('flags', 'die', false)

    if downscroll == false then 
        thing = -15
    end
    if downscroll == true then 
        thing = -15
        setProperty('flags.y', 35 - 5)
        setProperty('score.y', 50 - 20 - 5)
        setProperty('accuracy.y', 50 - 20 - 5)
    end
    upscrollpos = getProperty(camFollowPos.y) - 40

end

function noteMiss(id, direction, noteType, isSustainNote)
    setProperty('health', 2)
    if invinc == 0 then
        playSound("hurt", 10)
        hits = hits + 1
        invinc = 1
        flash = 0
        runTimer('invinc', 1, 1)
    end
    if hits == 1 then
        current = ""
        triggerEvent("Alt Idle Animation", "BF", "")
    end
    if hits == 2 then
        current = "-alt"
        triggerEvent("Alt Idle Animation", "BF", "-alt")
    end
    if hits == 3 then
        setProperty('health', 0)
    end
    score = getProperty('songScore')
    if score > 99999 then
        setProperty("score.text", score)
    elseif score > 9999 then
        setProperty("score.text", "0" .. tostring(score))
    elseif score > 999 then
        setProperty("score.text", "00" .. tostring(score))
    elseif score > 99 then
        setProperty("score.text", "000" .. tostring(score))
    elseif score > 9 then
        setProperty("score.text", "0000" .. tostring(score))
    else
        setProperty("score.text", "00000" .. tostring(score))
    end
end
prevfunny = 0
funny = 0
funnylol = 0
function onUpdatePost(elapsed)
    if not downscroll then
        setProperty('camFollowPos.y', upscrollpos)
    end
    setTextString('accuracy', round(getProperty('ratingPercent') * 100, 2) .. '%')
    if getPropertyFromClass('ClientPrefs', 'framerate') > 75 then -- 76+ framerate support, please don't cancel me for this code >:
    funny = funny + elapsed
    funnylol = 1*math.sin((funny)*120) - 0.8
    end

    if getProperty('ratingFC') == "Clear" or getProperty('ratingFC') == "SDCB" then
        objectPlayAnimation('flags', 'die', false)
    elseif getProperty('ratingFC') == "FC" then
        objectPlayAnimation('flags', 'flagminus', false)
    elseif getProperty('ratingFC') == "GFC" then
        objectPlayAnimation('flags', 'flagplus', false)
    elseif getProperty('ratingFC') == "SFC" then
        objectPlayAnimation('flags', 'flagcheck', false)
    end

    if invinc == 1 then
        if flash == 0 then
            setProperty('boyfriend.visible', false)
        elseif flash == 10 then
            setProperty('boyfriend.visible', true)
        end
        flash = flash + 1
        if flash == 20 then
            flash = 0
        end
    end
    if getPropertyFromClass('ClientPrefs', 'framerate') > 75 then
    if funnylol <= -0.8 then
    for i = 1, 16 do
        ground = tostring(i) .. ".x"
        ground2 = tostring(-i) .. ".x"
        setProperty(ground, getProperty(ground) - 20)
        setProperty(ground2, getProperty(ground2) - 20)
        if getProperty(ground) == -700 then
            if math.random(1,40) == 1 and blocks == 0 then
                blocks = 1
                addLuaSprite('blocks')
                setProperty('blocks.x', 12*160 - 45)
            end
            setProperty(ground, 12*160 - 60)
            setProperty(ground2, 12*160 - 60)
            if getProperty("blocks.x") <= -1500 then
                blocks = 0
                removeLuaSprite('blocks', false)
            end
        end
    end
    setProperty('blocks.x', getProperty('blocks.x') - 20)
    setProperty('cloud.x', getProperty('clouds.x') - 20)
    end
    elseif getPropertyFromClass('ClientPrefs', 'framerate') <= 75 then
    for i = 1, 16 do
        ground = tostring(i) .. ".x"
        ground2 = tostring(-i) .. ".x"
        setProperty(ground, getProperty(ground) - 20)
        setProperty(ground2, getProperty(ground2) - 20)
        if getProperty(ground) == -700 then
            if math.random(1,40) == 1 and blocks == 0 then
                blocks = 1
                addLuaSprite('blocks')
                setProperty('blocks.x', 12*160 - 45)
            end
            setProperty(ground, 12*160 - 60)
            setProperty(ground2, 12*160 - 60)
            if getProperty("blocks.x") <= -1500 then
                blocks = 0
                removeLuaSprite('blocks', false)
            end
        end
    end
    setProperty('blocks.x', getProperty('blocks.x') - 20)
end
end

function onMoveCamera(focus)
    cameraSetTarget("boyfriend")
end

function goodNoteHit(id, direction, noteType, isSustainNote)
    dir = ""
    if direction == 0 then
        dir = "LEFT"
    elseif direction == 1 then
        dir = "DOWN"
    elseif direction == 2 then
        dir = "UP"
    elseif direction == 3 then
        dir = "RIGHT"
    end
    characterPlayAnim("boyfriend", "sing" .. dir .. current, true)
    score = getProperty('songScore')
    if score > 99999 then
        setProperty("score.text", score)
    elseif score > 9999 then
        setProperty("score.text", "0" .. tostring(score))
    elseif score > 999 then
        setProperty("score.text", "00" .. tostring(score))
    elseif score > 99 then
        setProperty("score.text", "000" .. tostring(score))
    elseif score > 9 then
        setProperty("score.text", "0000" .. tostring(score))
    else
        setProperty("score.text", "00000" .. tostring(score))
    end
end

function onTimerCompleted(tag)
    invinc = 0
    setProperty('boyfriend.visible', true)
end

function round(num, numDecimalPlaces)
    -- http://lua-users.org/wiki/SimpleRound
    local mult = 10^(numDecimalPlaces or 0)
    return math.floor(num * mult + 0.5) / mult
end