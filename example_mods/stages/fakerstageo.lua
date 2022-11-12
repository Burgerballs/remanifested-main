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
        if tag == 'starttimer' then
        setProperty('red.visible', false)
        end
end
function onSongStart()
	noteTweenX("NoteMove1", 0, -1000, 0.01, cubeInOut)
	noteTweenX("NoteMove2", 1, -1000, 0.01, cubeInOut)
	noteTweenX("NoteMove3", 2, -1000, 0.01, cubeInOut)
	noteTweenX("NoteMove4", 3, -1000, 0.01, cubeInOut)
end
function onCreate()
    runTimer('starttimer', 0.5, 1)
end 
function onPause()
        setProperty('red.visible', true)
        runTimer('starttimer', 0.2, 1)
	return Function_Stop; 
end
function onCreatePost()	
        makeAnimatedLuaSprite('writings','Drawings',400,200)
	addAnimationByPrefix('writings','1','1',24,true)
	addAnimationByPrefix('writings','2','2',24,true)
	addAnimationByPrefix('writings','3','3',24,true)
	addAnimationByPrefix('writings','4','4',24,true)
	objectPlayAnimation('writings','1',false)
	setScrollFactor('writings', 0, 0);
	makeLuaSprite('black', 'blackFlash', -200, -100);
	setScrollFactor('black', 0, 0);
	scaleObject('black', 1.4, 1.4)
	addLuaSprite('black', true);
	makeLuaSprite('red', 'Nightmare', 340, 200);
	setScrollFactor('red', 0, 0);
	scaleObject('red', 1, 1)
	addLuaSprite('writings', true);
	addLuaSprite('red', true);
        setProperty('writings.visible', false)
        setProperty('red.visible', false)


        setProperty('camHUD.alpha', 0)
        setProperty('timeBar.visible', false)
        setProperty('timeBarBG.visible', false)
        setProperty('timeTxt.visible', false)
        setProperty('gf.visible', false)
        setProperty('bf.visible', false)
end
function onUpdate()
if curStep == 1 then
        setProperty('black.visible', false)
end
if curBeat == 8 then
        setProperty('black.visible', true)
        setProperty('writings.visible', true)
end
if curBeat == 16 then
	objectPlayAnimation('writings','2',false)
end
if curBeat == 24 then
	objectPlayAnimation('writings','3',false)
end
if curBeat == 32 then
	objectPlayAnimation('writings','4',false)
end
if curBeat == 56 then
        setProperty('camHUD.alpha', 1)   
    for i = 0,3 do 

        setPropertyFromGroup('strumLineNotes', i, 'visible', false)
end
        setProperty('black.visible', false)
        setProperty('writings.visible', false)
end
end