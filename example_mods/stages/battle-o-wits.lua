rot = 0
keyboarddestine = ''
curTypie = 0
kyslock = false
typetime = false
typetimelua = false

function onCreatePost()
    makeLuaSprite('witbg', 'bg/arse/witbg', -50,-50)
    scaleObject('witbg', 1.25 , 1.25)
    setScrollFactor('witbg', 0, 0);
    addLuaSprite('witbg', false)

    makeLuaSprite('wittable', 'bg/arse/wit-table', -50,530)
    setScrollFactor('wittable', 0, 0);
    scaleObject('wittable', 1.25 , 1.25)
    addLuaSprite('wittable', false)

    triggerEvent('Camera Follow Pos', 640, 400)

    makeAnimatedLuaSprite('witlight', 'bg/arse/witlight', 300, 0)
    addAnimationByPrefix('witlight', 'idle', 'Lightning', 12, true)
    addLuaSprite('witlight', true)
    screenCenter('witlight', 'xy')
    objectPlayAnimation('witlight', 'idle')
    setProperty('witlight.y', 0)

    makeLuaSprite('fuck', 'vignette', 0,0)
    scaleObject('fuck', 1.1 , 1.1)
    addLuaSprite('fuck', true)
    setProperty('fuck.visible', false)
    setProperty('fuck.color', '000000')
    setProperty('boyfriend.flipX', true)

    makeLuaText("biblua", keyboarddestine, 250, 480, 800)
    setTextAlignment("biblua", 'center')
    setTextSize('biblua', 20)
    setTextBorder('biblua', 1, '000000')
    screenCenter('biblua', 'x')
    addLuaText("biblua")
end

function onBeatHit()
    extraLogic(curBeat)
    if curBeat == 176 then
        coolEffect()
        cameraFlash('hud', '000000', 1)
    end
    if curBeat == 304 then
        coolEffect()
        cameraFlash('hud', '000000', 1)
    end
    if curBeat == 336 then
        setProperty('fuck.visible', false)
        cameraFlash('other', 'FFFFFF', 1)
    end
end


--=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=--
-------------Typing Mechanic!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!-----------------
--=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=--


function extraLogic(b)
    if b == 1 then
        spawnScreen('You are here', true)
    end

    if b == 5 then
        doTweenY('witlightf1','witlightf1', 800, 1, 'backInOut')
        doTweenY('pointer1','pointer1', 800, 1, 'backInOut')
        doTweenY("biblu1","biblu1", 800, 1, 'backInOut')
    end
    if b == 7 then
        removeLuaSprite('witlightf1')
        removeLuaSprite('pointer1')
        removeLuaSprite('biblu1')
    end
    if b == 8 then
        spawnScreen('Type "kys" when the screen flashes blue. If it flashes cyan, sky.lua to the right of you will type instead', false)
    end
    if b == 14 then
        doTweenY('witlightf1','witlightf8', 800, 1, 'backInOut')
        doTweenY('pointer1','pointer8', 800, 1, 'backInOut')
        doTweenY("biblu1","biblu8", 800, 1, 'backInOut')
    end
    if b == 16 then
        removeLuaSprite('witlightf8')
        removeLuaSprite('pointer8')
        removeLuaSprite('biblu8')
    end
    if b == 44 then
        cameraFlash('other', '0000FF', 1)
        spawnTypeScreen()
    end
    if b == 48 then
        if keyboarddestine ~= 'kys' then
            setProperty('health', 0)
            cameraFlash('other', 'FF0000', 1)
        else
            cameraFlash('other', '00FF00', 1)
        end
        typetime = false
        doTweenY('witlightf1','witlightf44', 800, 1, 'backInOut')
    end

    -- skylua
    if b == 80 then
        cameraFlash('other', '00FFFF', 1)
        spawnTypeScreen()
        typetime = false
        typetimelua = true
    end
    if b == 81 then 
        keyboarddestine = 'l b'
        characterPlayAnim('dad', 'bash1', true)
    end
    if b == 81 then 
        keyboarddestine = 'l bozo + '
        characterPlayAnim('dad', 'bash2', true)
    end
    if b == 82 then 
        keyboarddestine = 'l bozo + ratio!!'
        characterPlayAnim('dad', 'bash1', true)
    end
    if b == 83 then
        cameraFlash('other', '00FF00', 1)
        typetimelua = false
        doTweenY('witlightf1','witlightf80', 800, 1, 'backInOut')
    end

    --kys
    if b == 94 then
        cameraFlash('other', '0000FF', 1)
        spawnTypeScreen()
    end
    if b == 98 then
        if keyboarddestine ~= 'kys' then
            setProperty('health', 0)
            cameraFlash('other', 'FF0000', 1)
        else
            cameraFlash('other', '00FF00', 1)
        end
        typetime = false
        doTweenY('witlightf1','witlightf94', 800, 1, 'backInOut')
    end

    if b == 208 then
        setProperty('fuck.visible', false)
        cameraFlash('other', '00FFFF', 1)
        spawnTypeScreen()
        typetime = false
        typetimelua = true
    end
    if b == 210 then
        cameraFlash('other', '00FF00', 1)
        typetimelua = false
        doTweenY('witlightf1','witlightf208', 800, 1, 'backInOut')
    end

    if b == 222 then
        cameraFlash('other', '0000FF', 1)
        spawnTypeScreen()
    end
    if b == 226 then
        if keyboarddestine ~= 'kys' then
            setProperty('health', 0)
            cameraFlash('other', 'FF0000', 1)
        else
            cameraFlash('other', '00FF00', 1)
        end
        typetime = false
        doTweenY('witlightf1','witlightf222', 800, 1, 'backInOut')
    end

    if b == 240 then
        setProperty('fuck.visible', false)
        cameraFlash('other', '00FFFF', 1)
        spawnTypeScreen()
        typetime = false
        typetimelua = true
    end
    if b == 243 then
        cameraFlash('other', '00FF00', 1)
        typetimelua = false
        doTweenY('witlightf1','witlightf240', 800, 1, 'backInOut')
    end
    if b == 268 then
        cameraFlash('other', '0000FF', 1)
        spawnTypeScreen()
    end
    if b == 271 then
        if keyboarddestine ~= 'kys' then
            setProperty('health', 0)
            cameraFlash('other', 'FF0000', 1)
        else
            cameraFlash('other', '00FF00', 1)
        end
        typetime = false
        doTweenY('witlightf1','witlightf268', 800, 1, 'backInOut')
    end
end

function onEvent(name, value1, value2)
    if name == "BOWprintletter" then
		keyboarddestine = keyboarddestine .. value1
        characterPlayAnim('dad', 'bash' .. math.random(1,2), true)
	end
end

function spawnTypeScreen(title)
    typetime = true
    makeLuaSprite('witlightf' .. curBeat, 'bg/arse/kysguid', 300, 800)
    scaleObject('witlightf' .. curBeat, 1.5 , 1.5)
    screenCenter('witlightf' .. curBeat, 'x')
    setObjectCamera("witlightf" .. curBeat, "hud")
    addLuaSprite('witlightf' .. curBeat, false)

    setProperty('biblua.y', 800)
    doTweenY('witlightf' .. curBeat,'witlightf' .. curBeat, 230, 0.3, 'backInOut')
    doTweenY("biblua" .. curBeat,"biblua", 300, 0.3, 'backInOut')
end





--------------------------------------------------------------------------

function spawnScreen(title, pointer)
    makeLuaSprite('witlightf' .. curBeat, 'bg/arse/kysguid', 300, 800)
    scaleObject('witlightf' .. curBeat, 1.5 , 1.5)
    screenCenter('witlightf' .. curBeat, 'x')
    setObjectCamera("witlightf" .. curBeat, "hud")
    addLuaSprite('witlightf' .. curBeat, false)

    if pointer == true then
        makeLuaSprite('pointer' .. curBeat, 'bg/arse/point', 300, 800)
        scaleObject('pointer' .. curBeat, 1.5 , 1.5)
        screenCenter('pointer' .. curBeat, 'x')
        setObjectCamera("pointer" .. curBeat, "hud")
        addLuaSprite('pointer' .. curBeat, false)
    end

    makeLuaText("biblu" .. curBeat, title, 250, 480, 800)
    setTextAlignment("biblu" .. curBeat, 'center')
    setTextSize('biblu' .. curBeat, 20)
    setTextBorder('biblu' .. curBeat, 1, '000000')
    screenCenter('biblu' .. curBeat, 'x')
    addLuaText("biblu" .. curBeat)

    doTweenY('witlightf' .. curBeat,'witlightf' .. curBeat, 230, 0.5, 'backInOut')

    if pointer == true then
        doTweenY('pointer' .. curBeat,'pointer' .. curBeat, 300, 0.5, 'backInOut')
    end
    doTweenY("biblu" .. curBeat,"biblu" .. curBeat, 250, 0.5, 'backInOut')
end


function coolEffect(sust, zoomto)
    setObjectCamera("fuck", "hud")
    setProperty('fuck.visible', true)
end

function onUpdatePost(elapsed)
    setProperty('camZooming', false)
    rot = rot + (180 * elapsed)
    setProperty('fuck.alpha', 0.25*((math.sin(rot / 180) * 10)) / 2 + 1.5)
    setProperty("biblua.text", keyboarddestine)

    if typetime == true then
        setProperty("bf.stunned", true)
        if keypres('k') == true then
            keyboarddestine = keyboarddestine .. 'k'
            characterPlayAnim('bf', 'bash1', true)
        end
    
        if keypres('y') == true then
            keyboarddestine = keyboarddestine .. 'y'
            characterPlayAnim('bf', 'bash2', true)
        end
    
        if keypres('s') == true then
            keyboarddestine = keyboarddestine .. 's'
            characterPlayAnim('bf', 'bash1', true)
        end

        if keyboarddestine == 'kys' then
            kyslock = true
        end

        if kyslock == true then
            keyboarddestine = 'kys'
        end
    elseif typetimelua then
        
    else
        setProperty("bf.stunned", false)
        kyslock = false
        keyboarddestine = ''
    end
end