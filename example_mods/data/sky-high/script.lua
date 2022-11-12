local allowCountdown = false
local endcut = false 
function onStartCountdown()
	-- Block the first countdown and start a timer of 0.8 seconds to play the dialogue
	if not allowCountdown and isStoryMode and not seenCutscene then
		setProperty('inCutscene', true);
		runTimer('startDialogue', 0.8);
		allowCountdown = true;
		return Function_Stop;
	end
	return Function_Continue;
end

function onTimerCompleted(tag, loops, loopsLeft)
	if tag == 'startDialogue' then -- Timer completed, play dialogue
		startDialogue('dialogue', '');
	end
end

-- Dialogue (When a dialogue is finished, it calls startCountdown again)
function onNextDialogue(count)
	-- triggered when the next dialogue line starts, 'line' starts with 1
end

function onSkipDialogue(count)
	-- triggered when you press Enter and skip a dialogue line that was still being typed, dialogue line starts with 1
end

function onEndSong()
    if endcut == false then
        if isStoryMode then
                endcut = true
		startDialogue('enddialogueex', '');
        return Function_Stop
        end
    end
    return Function_Continue
end 

function onBeatHit()
	if curBeat == 192 then
		blue(true)
	end
	if curBeat == 253 then
		blue(false)
	end
end

function blue(bool)
	if bool == true then
		stomp(0.25)
		cameraFlash('hud', '000000', 0.25)

		makeLuaSprite('blu', nil, -600, -300)
		makeGraphic('blu', 3000, 2000, '00B6D5')
		addLuaSprite('blu')

		doTweenColor('dadColorTween', 'dad', '000000', 0.25, 'linear')
		setProperty('gf.visible', false)
		doTweenColor('bfColorTween', 'boyfriend', '000000', 0.25, 'linear')
	end
	if bool == false then
		stomp(-0.25)
		cameraFlash('hud', 'FFFFFF', 0.25)

		setProperty('blu.visible', false)

		doTweenColor('dadColorTween', 'dad', 'FFFFFF', 0.25, 'linear')
		setProperty('gf.visible', true)
		doTweenColor('bfColorTween', 'boyfriend', 'FFFFFF', 0.25, 'linear')
	end
end

function stomp(stomp)
    setProperty('camGame.zoom', getProperty('camGame.zoom') + stomp)
    setProperty('camHUD.zoom', getProperty('camHUD.zoom') + (stomp / 1.5))
end