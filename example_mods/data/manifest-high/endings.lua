local endstops = 0

function onUpdatePost()
    if endstops == 1 and getProperty('endingSong') then 
      if keyJustPressed('accept') or keyJustPressed('back') then
		endSong()
		end  
    end
end
    
function onEndSong()
	if isStoryMode then
	endstops = endstops + 1
		if endstops == 1 then
			rank = 'good'
			if ratingFC == 'Odd' then
			rank = 'bad'
			end
			makeAnimatedLuaSprite('ending','manifestex-endings/'..rank,0,0)
	addAnimationByPrefix('ending', 'idle', 'Anim', 24, true)
	objectPlayAnimation('ending', 'idle', false)
            cameraFlash('other','000000', 0.5)
        setProperty('black.alpha', 1);
        playMusic(rank..'manifest', 1, true)
			addLuaSprite('ending',false)
			screenCenter('ending')
			setProperty('ending.antialiasing',false)
			setProperty('flip.visible',false)
			setObjectCamera('ending','other')
		return Function_Stop;
		end
return Function_Continue
end
end