function onCreatePost()
    makeLuaSprite('bg', 'LexiSky',  -800, -800)
    addLuaSprite('bg')
    makeLuaSprite('bg2', 'LexiBuildings', -800, -800)
    addLuaSprite('bg2')
    setScrollFactor('bg', 0.6, 1)
    setScrollFactor('bg', 0.8, 1)

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
   if curBeat == 716 then
        doTweenAlpha('hudFunne', 'black', 1, 1, 'quadIn')
   end
end