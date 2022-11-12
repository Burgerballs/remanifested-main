function onCreatePost()
	makeLuaSprite('black', 'Black', -200, -100);
	setObjectCamera('black', 'other');
	setScrollFactor('black', 0, 0);
	scaleObject('black', 1.4, 1.4)
	addLuaSprite('black', true);

        setProperty('gf.visible', false)
        setProperty('bf.visible', false)
    for i = 0,3 do
        setPropertyFromGroup('strumLineNotes', i, "x", getPropertyFromGroup('strumLineNotes', i, "x") - 775)
    end
    for i = 3,7 do
        setPropertyFromGroup('strumLineNotes', i, "x", getPropertyFromGroup('strumLineNotes', i, "x") - 80)
        setPropertyFromGroup('strumLineNotes', i, "y", getPropertyFromGroup('strumLineNotes', i, "y") + thing)
    end
end

function onUpdate()
    if curBeat == 1 then
           doTweenAlpha('dothetweenvg', 'black', 0, 2, 'quadIn');
    end
    if curBeat == 52 then
           doTweenAlpha('dothetweenvg', 'black', 1, 1, 'quadIn');
    end
    if curBeat == 60 then
           doTweenAlpha('dothetweenvg', 'black', 0, 1, 'quadIn');
    end
    if curBeat == 736 then
           doTweenAlpha('dothetweenvg', 'black', 1, 1, 'quadIn');
    end
end