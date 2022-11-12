local rhapsody = 0
local flash = 0
local dif = 0
local hit = 0
local defaultNotePos = {};
heartbeat = ''
function onCreate()
	makeLuaSprite('white', 'White', -200, -100);
	setScrollFactor('white', 0, 0);
	scaleObject('white', 1.4, 1.4)
	addLuaSprite('white', true);
        setProperty('white.alpha', 0.0);
	makeLuaSprite('black', 'Black', -200, -100);
	setScrollFactor('black', 0, 0);
	scaleObject('black', 1.4, 1.4)
	addLuaSprite('black', false);
        setProperty('black.alpha', 0.0);
	makeLuaSprite('tip', 'RhapsodyTip', 700, 200);
	setScrollFactor('tip', 0, 0);
	scaleObject('tip', 1.1, 1.1)
	addLuaSprite('tip', true);
        addCharacterToList('Usky', 'bf')
        addCharacterToList('UskyNega', 'bf')
        addCharacterToList('BlackBF', 'dad')
        addCharacterToList('bf', 'dad')
        addCharacterToList('Blackgf', 'gf')
        addCharacterToList('gf', 'gf')
                makeAnimatedLuaSprite('heart', 'Heartbeat', 1110, -80);
	        scaleObject('heart', 1.1, 1.1)
		addAnimationByPrefix('heart', 'beat', 'HeartBeat', 24, false)
		setScrollFactor('heart',0 , 0);
	        addLuaSprite('heart', true); 
	        setObjectCamera('heart', 'other');
	makeLuaSprite('You', 'YOU', 100, 400);
	setScrollFactor('You', 0, 0);
	scaleObject('You', 1.1, 1.1)
	addLuaSprite('You', true);
        setProperty('You.alpha', 0);
end
function onCreatePost() -- Code in here reverses the order of the notes
	noteTweenX("NoteMove1", 0, defaultPlayerStrumX0, 0.01, cubeInOut)
	noteTweenX("NoteMove2", 1, defaultPlayerStrumX1, 0.01, cubeInOut)
	noteTweenX("NoteMove3", 2, defaultPlayerStrumX2, 0.01, cubeInOut)
	noteTweenX("NoteMove4", 3, defaultPlayerStrumX3, 0.01, cubeInOut)
	noteTweenX("NoteMove5", 4, defaultOpponentStrumX0, 0.01, cubeInOut)
	noteTweenX("NoteMove6", 5, defaultOpponentStrumX1, 0.01, cubeInOut)
	noteTweenX("NoteMove7", 6, defaultOpponentStrumX2, 0.01, cubeInOut)
	noteTweenX("NoteMove8", 7, defaultOpponentStrumX3, 0.01, cubeInOut)
           doTweenAlpha('youIndicator', 'You', 1, 1, 'quadIn')
end
function onUpdate()
    health = getProperty('health')
    if getProperty('health') < 0.9 then -- Detects whenever the health has gone under 45%
       rhapsody = 1
    else 
       rhapsody = 0
    end
	      Step = getProperty('curBeat')
	if keyJustPressed('space') then
              if (Step % 2) == 0 then
              hit = 1
              end
	end
end
function onUpdatePost()
	setProperty('dad.x', 1020)
	setProperty('boyfriend.x', 170)
	setProperty('dad.flipX', false)
	setProperty('boyfriend.flipX', false)
    P1Mult = getProperty('healthBar.x') + ((getProperty('healthBar.width') *        getProperty('healthBar.percent') * 0.01) + (150 * getProperty('iconP1.scale.x') - 150) / 2 - 26)
    P2Mult = getProperty('healthBar.x') + ((getProperty('healthBar.width') * getProperty('healthBar.percent') * 0.01) - (150 * getProperty('iconP2.scale.x')) / 2 - 26 * 2)
    setProperty('iconP1.x',P1Mult - 110)
    setProperty('iconP1.origin.x',240)
    setProperty('iconP1.flipX',true)
    setProperty('iconP2.x',P2Mult + 110)
    setProperty('iconP2.origin.x',-100)
    setProperty('iconP2.flipX',true)
    setProperty('healthBar.flipX',true)
end
function onBeatHit()
	      Step = getProperty('curBeat')
if curBeat == 0 then

    for i = 0,7 do
        noteTweenAlpha(i .. 'tween', i, 0, 0.2, linear)
    end
end
if (Step % 2) == 0 then
		objectPlayAnimation('heart', 'beat', true)
 end
if (Step % 2) == 1 then
 if hit == 0 then
	      setProperty('health',getProperty('health')-0.2)
 else
              hit = 0
 end
end
if rhapsody == 1 then
if flash == 1 then 
           setProperty('white.alpha', 1.0);
           doTweenAlpha('hudFunne', 'white', 0, 0.5, 'quadIn')
           flash = 0
end
           setProperty('black.alpha', 1.0);
-- Swaps the character sprites after the health goes below 45%
triggerEvent('Change Character', 'bf', 'UskyNega') 
triggerEvent('Change Character', 'dad', 'BlackBF')
triggerEvent('Change Character', 'gf', 'Blackgf')
else
if flash == 0 then 
           setProperty('white.alpha', 1.0);
           doTweenAlpha('hudFunny', 'white', 0, 0.5, 'quadIn')
           flash = 1
end
           setProperty('black.alpha', 0.0);
if curBeat < 287 then
triggerEvent('Change Character', 'bf', 'Usky')
triggerEvent('Change Character', 'dad', 'bf')
triggerEvent('Change Character', 'gf', 'gf')
elseif curBeat < 332 and curBeat > 286 then
triggerEvent('Change Character', 'bf', 'UskyMad')
triggerEvent('Change Character', 'dad', 'bf')
triggerEvent('Change Character', 'gf', 'gf')
else
triggerEvent('Change Character', 'bf', 'UskySad')
triggerEvent('Change Character', 'dad', 'bf')
triggerEvent('Change Character', 'gf', 'gf')
end
end
if curBeat == 8 then
           doTweenAlpha('youIndicator', 'You', 0, 1, 'quadIn')
           doTweenAlpha('hudFunne', 'tip', 0, 0.5, 'quadIn')
end
if curBeat == 287 then
triggerEvent('Play Animation', 'angry', 'bf')
end
end
