local HD = 1

function opponentNoteHit()
if HD == 1 then
    health = getProperty('health')
    if getProperty('health') > 0.05 then
        setProperty('health', health- 0.02);
    end
end
end

function onBeatHit()
    if curBeat == 292 then
HD = 0
    end
    if curBeat == 426 then
HD = 1
    end
    if curBeat == 560 then
HD = 0
    end
end