local xx = 520;
local yy = 320;
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
        setProperty('health', health- 0.007);
    end
end

local allowCountdown = false;
local playDialogue = false;
function onStartCountdown()
	-- Block the first countdown and start a timer of 0.8 seconds to play the dialogue
	if not allowCountdown and isStoryMode and not seenCutscene then
		startVideo('ManifestCutsceneEX');
		allowCountdown = true;
		playDialogue = true;
		return Function_Stop;
	elseif playDialogue then
		setProperty('inCutscene', true);
		runTimer('startDialogue', 0.8);
		playDialogue = false;
		return Function_Stop;
	end
	return Function_Continue;
end

function onTimerCompleted(tag, loops, loopsLeft)
	if tag == 'startDialogue' then -- Timer completed, play dialogue
		startDialogue('dialogueex', 'The Manifest');
	end
end
local allowCountdown = false

function coolEffect(sust, zoomto)
    setObjectCamera("fuck", "hud")
    setProperty('fuck.visible', true)
end

function onBeatHit()
    if curBeat == 216 then
        coolEffect()
        cameraFlash('hud', '000000', 1)
    end
    if curBeat == 280 then
        cameraFlash('hud', 'FF0000', 0.5, true)
        setProperty('fuck.visible', false)
    end
    if curBeat == 342 then
        stomp(0.25)
    end
    if curBeat == 344 then
        coolEffect()
        cameraFlash('hud', '000000', 1)
    end
    if curBeat == 440 then
        cameraFlash('hud', 'FF0000', 0.5, true)
        setProperty('fuck.visible', false)
    end
end

function stomp(stomp)
    setProperty('camGame.zoom', getProperty('camGame.zoom') + stomp)
    setProperty('camHUD.zoom', getProperty('camHUD.zoom') + (stomp / 1.5))
end

function onUpdatePost(elapsed)
    rot = rot + (180 * elapsed)
    setProperty('fuck.alpha', 0.25*((math.sin(rot / 180) * 10)) / 2 + 1.5)
end