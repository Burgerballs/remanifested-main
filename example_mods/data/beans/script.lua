function onCreatePost()
	setPropertyFromClass('GameOverSubstate', 'characterName', 'sk2')
end

function onBeatHit()
    if curBeat == 2 then
        setProperty('cameraSpeed', 2)
    end
end