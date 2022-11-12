zoomshit = 0

function onCreate()
    makeLuaSprite('beanDis', 'bk_2', -600, -200)
    scaleObject('beanDis', 2.5, 2.5)
    setScrollFactor('beanDis', 0.5, 0.5);
    addLuaSprite("beanDis", false);
    makeLuaSprite('beanDis1', 'bk_1', -600, -200)
    scaleObject('beanDis1', 2.5, 2.5)
    setScrollFactor('beanDis1', 0.5, 0.5);
    addLuaSprite("beanDis1", false);
    setProperty("beanDis1.visible", false);
end
function opponentNoteHit(id, direction, noteType, isSustainNote)  
if shake == 1 then
    cameraShake('game', 0.01, 0.1)
    health = getProperty('health')
    setProperty("beanDis1.visible", true);
    if getProperty('health') > 0.05 then
        setProperty('health', health- 0.02);
    end
else
    setProperty("beanDis1.visible", false);
end
end
function onBeatHit()
    if curBeat == 128 then
shake = 1
end
    if curBeat == 192 then
shake = 0
end
end