local xx = 520;
local yy = 450;
local xx2 = 820;
local yy2 = 450;
local ofs = 60;
local followchars = true;
local del = 0;
local del2 = 0;
local rot = 0

function onCreatePost()
    makeLuaSprite('fuck', 'vignette', 0,0)
    scaleObject('fuck', 1.1 , 1.1)
    addLuaSprite('fuck', true)
    setProperty('fuck.visible', false)
    setProperty('fuck.color', '000000')
    setObjectCamera("fuck", "hud")
    setProperty("camHUD.alpha", 0)

end

function onUpdatePost(elapsed)
    rot = rot + (180 * elapsed)
    setProperty('fuck.alpha', 0.25*((math.sin(rot / 180) * 10)) / 2 + 1.5)
end

function coolEffect(funny)
    if funny == true then
        setProperty('camGame.zoom', getProperty('camGame.zoom') + 0.15)
        setProperty('camHUD.zoom', getProperty('camHUD.zoom') + 0.05)
        cameraFlash('hud', '000000', 1)
        setProperty('fuck.visible', true)
    else
        setProperty('camGame.zoom', getProperty('camGame.zoom') - 0.15)
        setProperty('camHUD.zoom', getProperty('camHUD.zoom') - 0.05)
        cameraFlash('hud', 'FF0000', 0.5, true)
        setProperty('fuck.visible', false)
    end
end

function onBeatHit()
    if curBeat == 16 then
        setProperty("camHUD.alpha", 1)
    end
    if curBeat == 152 then
        coolEffect(true)
    end
    if curBeat == 216 then
        coolEffect(false)
    end
    if curBeat == 280 then
        coolEffect(true)
    end
    if curBeat == 408 then
        coolEffect(false)
    end
    if curBeat == 532 then
        setProperty("camHUD.alpha", 0)
    end
    if curBeat == 535 then
        setProperty("camHUD.alpha", 1)
        coolEffect(true)
        cameraFlash('hud', '000000', 1)
    end
    if curBeat == 664 then
        coolEffect(false)
    end
end

function onUpdate()
	if del > 0 then
		del = del - 1
	end
	if del2 > 0 then
		del2 = del2 - 1
	end
    if followchars == true then
        if mustHitSection == false then
            if getProperty('dad.animation.curAnim.name') == 'singLEFT' then
                triggerEvent('Camera Follow Pos',xx-ofs,yy)
            end
            if getProperty('dad.animation.curAnim.name') == 'singRIGHT' then
                triggerEvent('Camera Follow Pos',xx+ofs,yy)
            end
            if getProperty('dad.animation.curAnim.name') == 'singUP' then
                triggerEvent('Camera Follow Pos',xx,yy-ofs)
            end
            if getProperty('dad.animation.curAnim.name') == 'singDOWN' then
                triggerEvent('Camera Follow Pos',xx,yy+ofs)
            end
            if getProperty('dad.animation.curAnim.name') == 'idle' then
                triggerEvent('Camera Follow Pos',xx,yy)
            end
        else

            if getProperty('boyfriend.animation.curAnim.name') == 'singLEFT' then
                triggerEvent('Camera Follow Pos',xx2-ofs,yy2)
            end
            if getProperty('boyfriend.animation.curAnim.name') == 'singRIGHT' then
                triggerEvent('Camera Follow Pos',xx2+ofs,yy2)
            end
            if getProperty('boyfriend.animation.curAnim.name') == 'singUP' then
                triggerEvent('Camera Follow Pos',xx2,yy2-ofs)
            end
            if getProperty('boyfriend.animation.curAnim.name') == 'singDOWN' then
                triggerEvent('Camera Follow Pos',xx2,yy2+ofs)
            end
	    if getProperty('boyfriend.animation.curAnim.name') == 'idle' then
                triggerEvent('Camera Follow Pos',xx2,yy2)
            end
        end
    else

        triggerEvent('Camera Follow Pos','','')
    end

end
function opponentNoteHit()
    health = getProperty('health')
    if getProperty('health') > 0.05 then
        setProperty('health', health- 0.005);
    end
end