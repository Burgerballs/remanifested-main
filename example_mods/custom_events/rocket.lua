function onEvent(name, value1)
    if name == 'rocket' then
        makeAnimatedLuaSprite('rocket', 'notes/Rocket Note',0,720)
        addAnimationByPrefix('rocket', 'wow', 'Rocket!!!!', 24, true)
        objectPlayAnimation('rocket', 'wow', true)
        addLuaSprite('rocket', true)
        setObjectCamera('rocket', 'hud')
        scaleObject('rocket', 0.75,0.75)
        if downscroll then
            setProperty('rocket.flipY', true)
            setProperty('rocket.y', -100)
            doTweenY('rocketTween', 'rocket', 820, 0.372, 'linear')
        else
            doTweenY('rocketTween', 'rocket', -100, 0.282, 'linear')
        end
        setProperty('rocket.x', getPropertyFromGroup('strumLineNotes', value1, 'x'))
    end
end

function goodNoteHit(id, direction, noteType, isSustainNote)
    if noteType == 'Rocket Note' then
        removeLuaSprite('rocket', false)
    end
end
