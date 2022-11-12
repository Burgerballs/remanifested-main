local rhapsody = 0
local flash = 0
local dif = 0
local hit = 0
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
        addCharacterToList('sky-rhapsody', 'bf')
        addCharacterToList('sky-annoyedFLIP', 'bf')
        addCharacterToList('BlackBF', 'dad')
        addCharacterToList('bf', 'dad')
        addCharacterToList('BlackGF', 'gf')
        addCharacterToList('gf', 'gf')
                makeAnimatedLuaSprite('heart', 'Heartbeat', 1110, -80);
	        scaleObject('heart', 1.1, 1.1)
		addAnimationByPrefix('heart', 'beat', 'HeartBeat', 24, false)
		setScrollFactor('heart',0 , 0);
	        addLuaSprite('heart', true); 
	        setObjectCamera('heart', 'other');
end
function onUpdate()
    health = getProperty('health')
    if getProperty('health') < 0.9 then
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
if (Step % 2) == 0 then
		objectPlayAnimation('heart', 'beat', true)
 end
if (Step % 2) == 1 then
 if hit == 0 then
	      setProperty('health',getProperty('health')-0.1)
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
triggerEvent('Change Character', 'bf', 'sky-rhapsody')
triggerEvent('Change Character', 'dad', 'BlackBF')
triggerEvent('Change Character', 'gf', 'BlackGF')
else
if flash == 0 then 
           setProperty('white.alpha', 1.0);
           doTweenAlpha('hudFunny', 'white', 0, 0.5, 'quadIn')
           flash = 1
end
           setProperty('black.alpha', 0.0);
triggerEvent('Change Character', 'bf', 'sky-annoyed')
triggerEvent('Change Character', 'dad', 'bf')
triggerEvent('Change Character', 'gf', 'gf')
end
if curBeat == 8 then
           doTweenAlpha('hudFunne', 'tip', 0, 0.5, 'quadIn')
end
end
