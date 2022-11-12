local shake = 0
function onCreatePost()
		makeAnimatedLuaSprite('animatedicon', 'iconxml/eclipse', getProperty('iconP2.x'), getProperty('iconP2.y'))
		addAnimationByPrefix('animatedicon', 'normal', 'idle', 24, true)
		addAnimationByPrefix('animatedicon', 'losing', 'lose', 24, true)
		setScrollFactor('animatedicon', 0, 0)
		setObjectCamera('animatedicon', 'hud')
                setObjectOrder('animatedicon', getObjectOrder("iconP2"))
		addLuaSprite('animatedicon', true)
		objectPlayAnimation('animatedicon', 'normal', false)
		setProperty('animatedicon.alpha', 0)
    makeLuaSprite('bg', 'bg/baker/back', -150, -300)
    scaleObject('bg', 0.75, 0.75);
    setScrollFactor('bg', 0.8, 0.8);
    addLuaSprite('bg')

    makeLuaSprite('fg', 'bg/baker/front', 0, -300)
    scaleObject('fg', 0.75, 0.75);
    addLuaSprite('fg', true)

    makeLuaSprite('overlayerino2', nil, -600, -300)
	makeGraphic('overlayerino2', 3000, 2000, '000000')
	addLuaSprite('overlayerino2', true)
    setBlendMode('overlayerino2', 'difference')
    setProperty('overlayerino2.alpha', 0)

	makeLuaSprite('black', 'Black', -200, -100);
	setObjectCamera('black', 'other');
	setScrollFactor('black', 0, 0);
	scaleObject('black', 1.4, 1.4)
	addLuaSprite('black', true);
        setProperty('black.alpha', 0.0);
	makeLuaSprite('vig', 'vignette', -200, -100);
setScrollFactor('vig',0,0);
	setProperty('vig.alpha', 0.0);
	setObjectCamera('vig', 'other');
	addLuaSprite('vig', true);
    scaleObject('vig', 1.2 , 1.2)
    setProperty('vig.color', '000000')
        setProperty('vig.alpha', 0.0);
makeLuaSprite('red','RedFlash',-100,-100)
setScrollFactor('red',0,0);
	setProperty('red.alpha', 0.0);
	setObjectCamera('red', 'other');
	addLuaSprite('red', true);
end

function opponentNoteHit(id, direction, noteType, isSustainNote)  
if shake == 1 then
    cameraShake('game', 0.01, 0.1)
    health = getProperty('health')
    if getProperty('health') > 0.05 then
        setProperty('health', health- 0.02);
    end
end
end
function onUpdatePost()
if shake == 1 then
setProperty('dad.healthColorArray', {75, 0, 0}) --pink hex color
triggerEvent('Change Character', 'dad', getProperty('dad.curCharacter'))
end

end

function onUpdate(elapsed)
    if shake == 1 then
	setProperty('iconP2.alpha', 0)
	setProperty('animatedicon.alpha', 1)
	else
	setProperty('iconP2.alpha', 1)
	setProperty('iconP1.alpha', 1)
	end
		if getProperty('health') > 1.6 then
			objectPlayAnimation('animatedicon', 'losing', false)
                else 
			objectPlayAnimation('animatedicon', 'normal', false)
		end
	setProperty('camOther.zoom', getProperty('camHUD.zoom'))
	setProperty('animatedicon.x', getProperty('iconP2.x'))
	setProperty('animatedicon.angle', getProperty('iconP2.angle'))
	setProperty('animatedicon.y', getProperty('iconP2.y') + -15)
	setProperty('animatedicon.scale.x', getProperty('iconP2.scale.x'))
	setProperty('animatedicon.scale.y', getProperty('iconP2.scale.y'))
end

function onBeatHit()
    if curBeat == 70 then
shake = 1
        setProperty('black.alpha', 1.0);
	   setProperty('red.alpha', 1.0);
	   setProperty('vig.alpha', 1.0);
           doTweenAlpha('dothetweenvg', 'red', 0, 0.6, 'quadOut');
end
   if curBeat == 72 then
        
        setProperty('black.alpha', 0.0);
end
    if curBeat == 488 then
        setProperty('black.alpha', 1.0);
	   setProperty('red.alpha', 1.0);
	   setProperty('vig.alpha', 1.0);
           doTweenAlpha('dothetweenvg', 'red', 0, 0.6, 'quadOut');
end
end