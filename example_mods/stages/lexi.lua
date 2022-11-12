function onCreatePost()
    makeLuaSprite('bg', 'LexiSky',  -800, -800)
    addLuaSprite('bg')
    makeLuaSprite('bg4', 'LexiSky3',  -800, -800)
    addLuaSprite('bg4')
    makeLuaSprite('bg3', 'LexiSky2',  -800, -800)
    addLuaSprite('bg3')
    makeLuaSprite('bg2', 'LexiBuildings', -800, -800)
    addLuaSprite('bg2')
    makeLuaSprite('bg5', 'LexiBuildings2', -800, -800)
    addLuaSprite('bg5')
    makeLuaSprite('bg6', 'LexiBuildings3', -800, -800)
    addLuaSprite('bg6')
    makeLuaSprite('bg7', 'LexiFloor', -800, 820)
    addLuaSprite('bg7')
    makeLuaSprite('bg8', 'LexiFloor2', -800, 820)
    addLuaSprite('bg8')
    makeLuaSprite('bg9', 'LexiFloor3', -800, 820)
    addLuaSprite('bg9')
    setScrollFactor('bg', 0.8, 1)
    setScrollFactor('bg3', 0.8, 1)
    setScrollFactor('bg4', 0.8, 1)

        setProperty('bg3.alpha', 0)
        setProperty('bg4.alpha', 0)
        setProperty('bg5.alpha', 0)
        setProperty('bg6.alpha', 0)
        setProperty('bg8.alpha', 0)
        setProperty('bg9.alpha', 0)
    setProperty('gf.visible', false)

    makeLuaSprite('black', 'Black', -200, -100);
    setScrollFactor('black', 0, 0);
    scaleObject('black', 1.4, 1.4)
    addLuaSprite('black', true);
    setProperty('black.alpha', 0.0);
    setObjectCamera('black', 'hud');

    setObjectOrder('black', back)
end
function onBeatHit()
   if curBeat == 288 then
        setProperty('bg2.alpha', 0)
        setProperty('bg4.alpha', 1)
        setProperty('bg5.alpha', 1)
        setProperty('bg7.alpha', 0)
        setProperty('bg8.alpha', 1)
   end
   if curBeat == 420 then
        doTweenAlpha('tonight', 'bg3', 1, 21.33, 'linear')
        doTweenAlpha('tonight3', 'bg6', 1, 21.33, 'linear')
        doTweenAlpha('tonight5', 'bg9', 1, 21.33, 'linear')
   end
   if curBeat == 644 then
    setObjectOrder('gfsa', getObjectOrder('bg9') - 1)
    setObjectOrder('silo', getObjectOrder('bg9') + 1)
   end
   if curBeat == 652 then
    setObjectOrder('gfsa', getObjectOrder('bg7') - 1)
    setObjectOrder('silo', getObjectOrder('bg7') + 1)
        setProperty('bg2.alpha', 1)
        setProperty('bg3.alpha', 0)
        setProperty('bg4.alpha', 0)
        setProperty('bg5.alpha', 0)
        setProperty('bg6.alpha', 0)
        setProperty('bg7.alpha', 1)
        setProperty('bg8.alpha', 0)
        setProperty('bg9.alpha', 0)
   end
   if curBeat == 716 then
        doTweenAlpha('hudFunne', 'black', 1, 1, 'quadIn')
   end
end