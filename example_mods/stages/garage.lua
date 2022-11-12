local endstops = 0
local endrand = 0
function onUpdatePost()
setProperty('bg.alpha',0.8)
if getRandomInt(0,40) == 1 then
setProperty('bg.alpha',0.3)
end
if getRandomInt(0,40) == 5 then
setProperty('bg.alpha',1)
end
if curBeat < 24 then
setProperty('intro.animation.curAnim.curFrame',math.floor((getSongPosition()/1000)*24))
end


setProperty('bg.angle',2*math.sin((getSongPosition()/crochet)))


end
function onCreate()
        addCharacterToList('woman', 'bf')
        addCharacterToList('whitewoman', 'bf')
        addCharacterToList('realosky', 'dad')
        addCharacterToList('sansundertale', 'dad')
        addCharacterToList('realbfos', 'gf')
        addCharacterToList('ness', 'gf')
	makeLuaSprite('6', 'Fram6', 0, 0);
	setObjectCamera('6', 'hud');
	setScrollFactor('6', 0, 0);
	addLuaSprite('6', true);
	makeLuaSprite('5', 'Fram5', 0, 0);
	setObjectCamera('5', 'other');
	setScrollFactor('5', 0, 0);
	addLuaSprite('5', true);
	makeLuaSprite('4', 'Fram4', 0, 0);
	setObjectCamera('4', 'other');
	setScrollFactor('4', 0, 0);
	addLuaSprite('4', true);
	makeLuaSprite('3', 'Fram3', 0, 0);
	setObjectCamera('3', 'other');
	setScrollFactor('3', 0, 0);
	addLuaSprite('3', true);
	makeLuaSprite('2', 'Fram2', 0, 0);
	setObjectCamera('2', 'other');
	setScrollFactor('2', 0, 0);
	addLuaSprite('2', true);
	makeLuaSprite('1', 'Fram1', 0, 0);
	setObjectCamera('1', 'other');
	setScrollFactor('1', 0, 0);
	addLuaSprite('1', true);

	makeLuaSprite('flip', 'Flipaclip', 0, 550);
	setScrollFactor('flip', 0, 0);
	scaleObject('flip', 0.5, 0.5)
	addLuaSprite('flip', true);
	setObjectCamera('flip', 'other');

	makeLuaSprite('bg','bg',-361.35,-267.7)
	setProperty('bg.origin.x',907)
	setProperty('bg.origin.y',185)
	addLuaSprite('bg')

	makeLuaSprite('someBoard','someBoard',296,257)
	addLuaSprite('someBoard')

	makeLuaSprite('screenoverlay','screenoverlay',0,0)
	addLuaSprite('screenoverlay')
	setObjectCamera('screenoverlay','hud')
	makeAnimatedLuaSprite('Static', 'staticBACKGROUND2', 0, 0);
	setObjectCamera('Static', 'other');

	makeLuaSprite('black3', 'Black', -200, -100);
	setScrollFactor('black3', 0, 0);
	scaleObject('black3', 1.4, 1.4)
	addLuaSprite('black3', false);
        setProperty('black3.alpha', 0.0);

	makeLuaSprite('black', 'Black', -200, -100);
	setScrollFactor('black', 0, 0);
	scaleObject('black', 1.4, 1.4)
	addLuaSprite('black', true);
        setProperty('black.alpha', 0.0);

	makeLuaSprite('black2', 'Black', -200, -100);
	setScrollFactor('black2', 0, 0);
	scaleObject('black2', 1.4, 1.4)
	addLuaSprite('black2', true);
	setProperty('black2.alpha', 0)
	setObjectCamera('black2','hud')

	makeLuaSprite('robot','robot',477,150);
	addLuaSprite('robot')
	setProperty('robot.alpha', 0)
	setObjectCamera('robot', 'other');

	makeLuaSprite('turn','TIU',377,150);
	addLuaSprite('turn')
        setProperty('turn.visible', false);
	setObjectCamera('turn', 'hud');

	makeLuaSprite('hi','HI',477,300);
	addLuaSprite('hi')
        setProperty('hi.visible', false);
	setObjectCamera('hi', 'hud');

	makeAnimatedLuaSprite('ski', 'characters/skiBlue', 300, 800);
	addAnimationByPrefix('ski', 'idle', 'Lol0', 24, true)
	setScrollFactor('ski', 0, 0);
	addLuaSprite('ski', true);

	objectPlayAnimation('Heart', 'Heart', true)
	makeAnimatedLuaSprite('Heart', 'HeartWhenever', 490, 300);
	addAnimationByPrefix('Heart', 'Flash', 'HeartFlash', 24, true)
	addAnimationByPrefix('Heart', 'Heart', 'Heart', 24, false)
	setScrollFactor('Heart', 0, 0);
	setProperty('Heart.alpha', 0);
	addLuaSprite('Heart', true);
	setObjectCamera('Heart','hud')
	objectPlayAnimation('Heart', 'Heart', true)
end
function onStepHit()
if curStep == 78 then
        setProperty('black.alpha', 1);
        setProperty('1.visible', false);
end
if curStep == 109 then
        setProperty('2.visible', false);
end
if curStep == 114 then
        setProperty('3.visible', false);
end
if curStep == 127 then
        setProperty('4.visible', false);
end
if curStep == 128 then
		triggerEvent('Screen Shake','','3.5,0.01')
        setProperty('5.visible', false);
		doTweenAlpha('black','black2',1,3.5,'linear')
		doTweenAlpha('robot','robot',0.7,3.5,'linear')
end
if curStep == 192 then
        setProperty('6.visible', false);
        setProperty('black2.visible', false);
        setProperty('robot.visible', false);
        setProperty('black.alpha', 0);
end
if curStep == 424 then
        setProperty('turn.visible', true);
        setProperty('black.alpha', 1);
end
if curStep == 440 then
        setProperty('hi.visible', true);
end
if curStep == 448 then
        setProperty('hi.visible', false);
        setProperty('turn.visible', false);
        setProperty('black.alpha', 0);
end
if curStep == 1714 then
        setProperty('black.alpha', 1);
	setProperty('Heart.alpha', 1);
end
if curStep == 1715 then
	setProperty('Heart.alpha', 0);
end
if curStep == 1716 then
		setProperty('Heart.y', 280); 
		setProperty('Heart.x', 460); 
	scaleObject('Heart', 1.1, 1.1)
	setProperty('Heart.alpha', 1);
end
if curStep == 1717 then
	setProperty('Heart.alpha', 0);
end
if curStep == 1718 then
		setProperty('Heart.y', 260); 
		setProperty('Heart.x', 445); 
	scaleObject('Heart', 1.2, 1.2)
	setProperty('Heart.alpha', 1);
end
if curStep == 1719 then
	setProperty('Heart.alpha', 0);
end
if curStep == 1720 then
triggerEvent('Change Character', 'bf', 'whitewoman')
triggerEvent('Change Character', 'dad', 'sansundertale')
triggerEvent('Change Character', 'gf', 'ness')
	setProperty('black3.alpha', 1);
		setProperty('Heart.y', 240); 
		setProperty('Heart.x', 430); 
	scaleObject('Heart', 1.3, 1.3)
	setProperty('Heart.alpha', 1);
	objectPlayAnimation('Heart', 'Flash', true)
end
if curBeat == 432 then
        setProperty('black.alpha', 0);
	setProperty('Heart.alpha', 0);
end
if curBeat == 568 then

triggerEvent('Change Character', 'bf', 'woman')
triggerEvent('Change Character', 'dad', 'realosky')
triggerEvent('Change Character', 'gf', 'realbfos')
	setProperty('black3.alpha', 0);
end
end

function onEndSong()
    endstops = endstops + 1
    if isStoryMode then
        if endstops == 1 then
            
            
            runTimer('endshit',1)
            
            return Function_Stop;
            
        end
    end
    return Function_Continue;
end
function onTimerCompleted(tag, loops, loopsLeft)
	if tag == 'endshit' then
        setProperty('camHUD._fxFadeAlpha', 0);
        cameraFlash('hud','000000',1)
        endrand = math.random(1, 100)

        if endrand >= 30 then

            if rating >= 0.8 then
		    	makeLuaSprite('endcock','whenever-endings/good')
            elseif rating <= 0.8 then
		    	makeLuaSprite('endcock','whenever-endings/bad')
            end

        else
            makeLuaSprite('endcock','whenever-endings/ending3')
	    end
        addLuaSprite('endcock',true)
        setObjectCamera('endcock','camHUD')
    end
end