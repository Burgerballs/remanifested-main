function onCreate()
    setProperty('bf.visible', false)
    for i = 0,3 do
        setPropertyFromGroup('strumLineNotes', i, "x", getPropertyFromGroup('strumLineNotes', i, "x") - 775)
    end
    for i = 3,7 do
        setPropertyFromGroup('strumLineNotes', i, "x", getPropertyFromGroup('strumLineNotes', i, "x") - 80)
        setPropertyFromGroup('strumLineNotes', i, "y", getPropertyFromGroup('strumLineNotes', i, "y") + thing)
    end
end