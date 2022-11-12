function onCreatePost()
    makeLuaSprite('bg', 'skysays_bg', -300, -30)
    scaleObject('bg', 1.3, 1.3)
    addLuaSprite('bg')
    makeAnimatedLuaSprite('ski', 'ssBG_ski', 500, 400)
    addAnimationByPrefix('ski', 'idle', 'ski instancia 1', 24, true)
    objectPlayAnimation('ski', 'idle')
    addLuaSprite('ski')

    setProperty('gf.visible', false)
end