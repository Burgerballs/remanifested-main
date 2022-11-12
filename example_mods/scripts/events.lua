local defaultNotePos = {};



IntroTextSize = 25	--Size of the text for the Now Playing thing.
IntroSubTextSize = 30 --size of the text for the Song Name.
IntroTagColor = '8300c3'	--Color of the tag at the end of the box.
IntroTagWidth = 15	--Width of the box's tag thingy.
function onCreate()
    --code from SongIntro.lua by SirTopHat

	--the tag at the end of the box
	makeLuaSprite('JukeBoxTag', 'empty', -305-IntroTagWidth, 15)
	makeGraphic('JukeBoxTag', 300+IntroTagWidth, 100, IntroTagColor)
	setObjectCamera('JukeBoxTag', 'other')
	addLuaSprite('JukeBoxTag', true)

	--the box
	makeLuaSprite('JukeBox', 'empty', -305-IntroTagWidth, 15)
	makeGraphic('JukeBox', 300, 100, '000000')
	setObjectCamera('JukeBox', 'other')
	addLuaSprite('JukeBox', true)
	
	--the text for the "Now Playing" bit
	makeLuaText('JukeBoxText', 'Now Playing:', 300, -305-IntroTagWidth, 60)
	setTextAlignment('JukeBoxText', 'left')
	setObjectCamera('JukeBoxText', 'other')
	setTextSize('JukeBoxText', IntroTextSize)
	addLuaText('JukeBoxText')
	
	--text for the song name
	makeLuaText('JukeBoxSubText', songName, 300, -305-IntroTagWidth, 30)
	setTextAlignment('JukeBoxSubText', 'left')
	setObjectCamera('JukeBoxSubText', 'other')
	setTextSize('JukeBoxSubText', IntroSubTextSize)
	addLuaText('JukeBoxSubText')
end


function onSongStart()
    for i = 0,7 do
        --lunarclient made this
        x = getPropertyFromGroup('strumLineNotes', i, 'x')
 
        y = getPropertyFromGroup('strumLineNotes', i, 'y')
 
        table.insert(defaultNotePos, {x,y})
    end
    makeLuaText("dghdghdscore", "", 1280, 0, 360)
    setTextAlignment("dghdghdscore", 'center')
    setTextSize('dghdghdscore', 40)
    setTextBorder('dghdghdscore', 3, '000000')
    addLuaText("dghdghdscore")

    setObjectCamera('dghdghdscore', 'other')

    makeLuaSprite('dghdghghdhdgoverlay', nil, -400, -800)
	makeGraphic('dghdghghdhdgoverlay', 2000, 3000, '000000')
	addLuaSprite('dghdghghdhdgoverlay', true)
    setScrollFactor('dghdghghdhdgoverlay', 0, 0);
    setProperty('dghdghghdhdgoverlay.alpha', 0)
end

function onEvent(name, value1, value2)
	if name == "message" then
		setProperty('dghdghdscore.text', value1)
	end
    if name == "goingdark" then
        doTweenAlpha('ooo dark','dghdghghdhdgoverlay', value1, value2, 'sineInOut')
    end
    if name == "Speed Bounce" then
		speedBounce(value1 / 1.5, value2 / (stepCrochet / 10))
	end
    if name == "Reverse Notes" then
		reverseStrums()
	end
    if name == "Reset Notes" then
		resetStrums()
	end
    if name == "Bounce Notes" then
		noteBounce(value1, value2, stepCrochet / 100, 360)
	end
    if name == "Middlescrollin" then
		middleScroll()
	end
    if name == "Arrow Speen" then
		speen(value1, value2)
	end
    if name == 'Intro' then
        --code from SongIntro.lua by SirTopHat
		setTextString('JukeBoxSubText',value1)
		setTextString('JukeBoxText',value2)
		-- Inst and Vocals start playing, songPosition = 0
		doTweenX('MoveInOne', 'JukeBoxTag', 0, 1, 'CircInOut')
		doTweenX('MoveInTwo', 'JukeBox', 0, 1, 'CircInOut')
		doTweenX('MoveInThree', 'JukeBoxText', 10, 1, 'CircInOut')
		doTweenX('MoveInFour', 'JukeBoxSubText', 10, 1, 'CircInOut')
		
		runTimer('JukeBoxWait', 3, 1)
	end
end

function speedBounce(target, duration)
    triggerEvent('Change Scroll Speed', target, 0)
    triggerEvent('Change Scroll Speed', 1, duration)
end
function speen(target, duration)
    for i = 0,7 do
        setPropertyFromGroup('strumLineNotes', i, 'angle', getPropertyFromGroup('strumLineNotes', i, 'angle') + target)
        noteTweenAngle(i .. 'bouncerotatedgfhdghdgh', i, 0, duration / 4, 'expoOut')
    end
end

function resetStrums()
    for i = 0,7 do
        setPropertyFromGroup('strumLineNotes', i, 'x', defaultNotePos[i + 1][1])
        setPropertyFromGroup('strumLineNotes', i, 'y', defaultNotePos[i + 1][2])
        setPropertyFromGroup('strumLineNotes', i, 'alpha', 1)
        setPropertyFromGroup('strumLineNotes', i, 'angle', 0)
    end
end

function middleScroll()
    for i = 0, 3 do
        noteTweenX(i .. 'b', i + 4, 415 + 115 * i, 1, 'backOut')
        noteTweenAlpha(i .. 'c', i, 0.2, 1, 'backOut')
        noteTweenX(i .. 'd', i, 415 + 115 * i, 1, 'backOut')
    end
end

function reverseStrums()
    for i = 0,3 do
        setPropertyFromGroup('opponentStrums', i, 'x', defaultNotePos[i + 5][1])
        setPropertyFromGroup('playerStrums', i, 'x', defaultNotePos[i + 1][1])
    end
end

function onTimerCompleted(tag, loops, loopsLeft)
	-- A loop from a timer you called has been completed, value "tag" is it's tag
	-- loops = how many loops it will have done when it ends completely
	-- loopsLeft = how many are remaining

    --code from SongIntro.lua by SirTopHat
	if tag == 'JukeBoxWait' then
		doTweenX('MoveOutOne', 'JukeBoxTag', -450, 1.5, 'CircInOut')
		doTweenX('MoveOutTwo', 'JukeBox', -450, 1.5, 'CircInOut')
		doTweenX('MoveOutThree', 'JukeBoxText', -450, 1.5, 'CircInOut')
		doTweenX('MoveOutFour', 'JukeBoxSubText', -450, 1.5, 'CircInOut')
	end
end

function noteBounce(x, y, duration, rotatoitio)
    for i = 0,7 do
        if x ~= nil then
            setPropertyFromGroup('strumLineNotes', i, 'x', getPropertyFromGroup('strumLineNotes', i, 'x') + x)
            noteTweenX(i .. 'bounce', i, defaultNotePos[i + 1][1], duration, 'sineOut')
        end
        if y ~= nil then
            setPropertyFromGroup('strumLineNotes', i, 'y', getPropertyFromGroup('strumLineNotes', i, 'y') + y)
            noteTweenY(i .. 'bounce1', i, defaultNotePos[i + 1][2], duration, 'sineOut')
        end
        if rotatoitio ~= nil then
            setPropertyFromGroup('strumLineNotes', i, 'angle', getPropertyFromGroup('strumLineNotes', i, 'angle') + rotatoitio)
            noteTweenAngle(i .. 'bouncerotate', i, 0, duration / 4, 'sineOut')
        end
    end
end