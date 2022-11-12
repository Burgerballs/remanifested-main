dadada = 0
function onCreatePost()
	makeLuaSprite('white', 'White', -200, -100);
	setScrollFactor('white', 0, 0);
	scaleObject('white', 1.4, 1.4)
	addLuaSprite('white', true);
        setProperty('white.alpha', 0.0);
	makeLuaSprite('black', 'Black', -200, -100);
	setScrollFactor('black', 0, 0);
	scaleObject('black', 1.4, 1.4)
	addLuaSprite('black', true);
if difficulty == 1 then
    forceDownScroll()
end
end

function forceDownScroll()
    for i = 0,7 do
        setPropertyFromGroup('strumLineNotes', i, 'y', 720 - 150)
        setPropertyFromGroup('strumLineNotes', i, 'downScroll', true)
        setProperty('timeTxt.y', 720 - 44)
        setProperty('timeBar.y', 720 - 30)
        setProperty('healthBar.y', 0.11 * 720)
        setProperty('iconP1.y', getProperty('healthBar.y') - 75)
        setProperty('iconP2.y', getProperty('healthBar.y') - 75)
        setProperty('scoreTxt.y', getProperty('healthBar.y') + 36)
    end
end

function onUpdatePost()
if difficulty == 1 then
    songPos = getSongPosition()
    local currentBeat = (songPos/1000)
    dadada = 15*math.cos((currentBeat)*2) + 90
    for i = 0,7 do
        setPropertyFromGroup('strumLineNotes', i, 'direction', dadada)
    end
end
end
function onSongStart()
        setProperty('black.alpha', 0);
           setProperty('white.alpha', 1);
           doTweenAlpha('hudFunne', 'white', 0, 0.75, 'quadIn')
end