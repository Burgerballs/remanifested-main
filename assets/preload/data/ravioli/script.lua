local duringJump = false
local jumpTime = 0
local jumpPressed = 0

function onCreatePost()
    makeLuaSprite('atmosphereA', 'bg/GBA-aspect', 0.77, 445)
    scaleObject('atmosphereA', 2,2)
    addLuaSprite('atmosphereA')
    setProperty('atmosphereA.visible', false)
    makeLuaSprite('bingchilling', 0, 0, 445)
    addLuaSprite('bingchilling')
    setProperty('bingchilling.visible', false)
    setObjectCamera("bingchilling", "hud")
    if downscroll == true then 
        scaleObject('bingchilling', 1, -1)
    end
    makeLuaSprite('bingchilling', 0, 0, 0)
    addLuaSprite('bingchilling')
    setProperty('bingchilling.visible', false)
    makeLuaSprite('collideBox', nill, 160, 479)
    scaleObject('collideBox', 2,2)
    addLuaSprite('collideBox')
    makeGraphic('collideBox', 4096, 1, '000000')
    setProperty('bf.maxVelocity.y', 300)
end

function onBeatHit()
    if curBeat == 32 then
        doTweenX('camGameTween', 'atmosphereA', 0.5, 2, 'backOut')
        doTweenY('camGameTween2', 'atmosphereA', getProperty('atmosphereA.y') + 200, 2, 'backOut')
    end
    if curBeat == 256 then
    end
end

function onUpdatePost(elapsed)
    jumpPressed = keyPressed('space')
    overlapping = objectsOverlap('boyfriend', 'collideBox')
    setProperty('defaultCamZoom', getProperty('atmosphereA.x'))
    setProperty('camFollowPos.x', getProperty('atmosphereA.y'))
   -- if jumpPressed == true and duringJump == false then
    --    if jumpTime <= 0.25 then
    --        setProperty('boyfriend.velocity.y', -200)
    --    end
    --    jumpTime = jumpTime + elapsed
    --end
    --if jumpTime == 0.25 or jumpPressed == false and not overlapping then
    --    setProperty('boyfriend.velocity.y', 900)
    --    jumpTime = 0
    --end
end

function onTimerCompleted(tag, loops, loopsLeft)
    if tag == 'a' then
    end
end

function threebytwo(fade)
    cameraShake('game', 0.05, 0.1)
    cameraFlash('hud', '000000', fade)
    setProperty('bingchilling.visible', true)
    setProperty('borderL.visible', false)
end