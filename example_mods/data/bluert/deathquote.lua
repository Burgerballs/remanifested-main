local played = 0
local quote = 0
function onUpdate(elapsed)
      if played ~= 1 and getProperty('boyfriend.animation.curAnim.name') == 'deathLoop' then
            quote = getRandomInt(1,5);
            playSound('mikoQuote'..quote, 1)
            played = 1
      end
end