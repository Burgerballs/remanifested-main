function onCreatePost() 
    setProperty('healthBar.visible', false)
    setProperty('healthBarBG.visible', false)
    setProperty('iconP1.visible', false)
    setProperty('iconP2.visible', false)
    setProperty('scoreTxt.visible', false)
    for i = 0,7 do
        setPropertyFromGroup('strumLineNotes', i, 'visible', false)
    end
end

function onBeatHit()
    if curBeat == 64 then
        setProperty('healthBar.visible', true)
        setProperty('healthBarBG.visible', true)
        setProperty('iconP1.visible', true)
        setProperty('iconP2.visible', true)
        setProperty('scoreTxt.visible', true)
        for i = 0,7 do
            setPropertyFromGroup('strumLineNotes', i, 'visible',true)
        end
    end
end