function onUpdatePost()
if curBeat < 8 then
     if keyJustPressed('up') then
                playSound('greaterdog',1)
                checknum = 1
     end
     if keyJustPressed('down') then
          if checknum == 1 then
                playSound('greaterdog',1)
                checknum = 2
          end
     end
     if keyJustPressed('left') then
          if checknum == 2 then
                playSound('greaterdog',1)
                checknum = 3
          end
     end
     if keyJustPressed('right') then
          if checknum == 3 then
                playSound('greaterdog',1)
                checknum = 4
          end
     end
     if keyJustPressed('space') then
          if checknum == 4 then
                playSound('dogtrill',1)
                loadSong('nuzzles', normal)
          end
     end
end
end