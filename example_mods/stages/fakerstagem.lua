local countdownbegin = false

function onStartCountdown()
         if not countdownbegin then
         runTimer("startD", 0.5)
         setProperty('inCutscene', true)
         countdownbegin = true
          return Function_Stop
         end
         return Function_Continue
end

function onTimerCompleted(tag)
        if tag == 'startD' then
        startCountdown()
        end
end
function onSongStart()
	noteTweenX("NoteMove1", 0, -1000, 0.01, cubeInOut)
	noteTweenX("NoteMove2", 1, -1000, 0.01, cubeInOut)
	noteTweenX("NoteMove3", 2, -1000, 0.01, cubeInOut)
	noteTweenX("NoteMove4", 3, -1000, 0.01, cubeInOut)
end
function onCreate()
    setProperty('skipCountdown', true)
    runTimer('starttimer', 0.5, 1)
end 
function onCreatePost()
	makeLuaSprite('black', 'BlackFlash', -200, -100);
	setObjectCamera('black', 'other');
	setScrollFactor('black', 0, 0);
	scaleObject('black', 1.4, 1.4)
	addLuaSprite('black', true);

        setProperty('gf.visible', false)
end

function onUpdate()
    if curStep == 1 then
	setProperty('black.visible', false);
    end
    if curBeat == 388 then
           doTweenAlpha('dothetweenvg', 'black', 1, 1, 'quadIn');
    end
end