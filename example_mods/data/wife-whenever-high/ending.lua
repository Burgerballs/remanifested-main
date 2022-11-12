local endstops = 0

function onUpdatePost()
    if endstops == 1 and getProperty('endingSong') then 
      if keyJustPressed('accept') or keyJustPressed('back') then
		endSong()
		end  
    end
end
    
function onEndSong()
	endstops = endstops + 1
		if endstops == 1 then
			rank = 'good'
			if ratingFC == 'Odd' then
			rank = 'bad'
                        elseif rating == 1 or rating == 0 then
			rank = 'epic' 
			end
			makeLuaSprite('ending','whenever-endings/'..rank,0,0)
            cameraFlash('other','000000', 0.5)
			addLuaSprite('ending',false)
			screenCenter('ending')
			setProperty('ending.antialiasing',false)
			setProperty('flip.visible',false)
			setObjectCamera('ending','other')
		return Function_Stop;
		end
return Function_Continue
end