function onCreatePost()
	makeAnimatedLuaSprite('Hit', 'Hit', 1000, 340);
	setObjectCamera('Hit', 'other');
	addAnimationByPrefix('Hit', 'Hit', 'Hit', 24, false)
	addAnimationByPrefix('Hit', 'Inv', 'Invis', 24, false)
	objectPlayAnimation('Hit', 'Inv', false)
	addLuaSprite('Hit', true);
	scaleObject('Hit', 0.7, 0.7)
end
function noteMiss(id, direction, noteType, isSustainNote)
		doTweenX('DogTweenX', 'dad', 560, 0.1, 'quadIn');
end

function onTweenCompleted(tag) 
	if tag == 'DogTweenX' then
                playSound('dogcrash',1)
                cameraShake('game', 0.01, 0.1)
	        objectPlayAnimation('Hit', 'Hit', false)
		doTweenX('DogTweenX2', 'dad', 155, 3, 'quadOut');
	end
end