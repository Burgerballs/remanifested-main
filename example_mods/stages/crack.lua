function onCreatePost()
    setProperty('gf.visible', false)
    makeLuaSprite('the', nil, -400, -400)
    makeGraphic('the', 2000, 2000, 'FFFFFF')
    addLuaSprite('the')
    makeLuaSprite('bg', 'crack_bg', 0, 0)
    addLuaSprite('bg')
end