innoteanim = false
folder = 'backgrounds/skyweek/wife4ever/'
function onCreate()
    if songName == 'Wife-Forever' then
        makeLuaSprite("shift", folder.."bg", -388.05 - 130, -202);
        addLuaSprite("shift", false);
        makeLuaSprite("shift2", folder.."bg1", -388.05 - 130, -202);
        addLuaSprite("shift2", false);
        setProperty('shift2.alpha', 0)
    else
        folder = 'backgrounds/skyweek/sky/'
        makeLuaSprite("shift", folder.."bg", -388.05 - 130, -202);
        addLuaSprite("shift", false);
        makeLuaSprite("shiftblue", folder.."bgblue", -388.05 - 130, -202);
        addLuaSprite("shiftblue", false);
        setProperty('shiftblue.alpha', 0)
        makeLuaSprite("shiftgreen", folder.."bggreen", -388.05 - 130, -202);
        addLuaSprite("shiftgreen", false);
        setProperty('shiftgreen.alpha', 0)
        makeLuaSprite("shiftred", folder.."bgred", -388.05 - 130, -202);
        addLuaSprite("shiftred", false);
        setProperty('shiftred.alpha', 0)
        makeLuaSprite("shiftpink", folder.."bgpink", -388.05 - 130, -202);
        addLuaSprite("shiftpink", false);
        setProperty('shiftpink.alpha', 0)
    end
end

function onBeatHit()
    if curBeat % 2 == 0 then
        if songName == 'Wife-Forever' then
            setProperty('shift2.alpha', 100)
            doTweenAlpha('shtw', 'shift2', 0, crochet/2000)
        end
        if songName == 'Sky' and innoteanim == false then
            setProperty('shiftpink.alpha', 100)
            doTweenAlpha('shtw', 'shiftpink', 0, crochet/2000)
        end
    end
end

function opponentNoteHit(id, direction, noteType, isSustainNote)
    innoteanim = true
    if isSustainNote == false then
    if direction == 0 then
        setProperty('shiftpink.alpha', 0.75)
        doTweenAlpha('weh1', 'shiftpink', 0, crochet/2000)
    end
    if direction == 1 then
        setProperty('shiftblue.alpha', 0.75)
        doTweenAlpha('weh2', 'shiftblue', 0, crochet/2000)
    end
    if direction == 2 then
        setProperty('shiftgreen.alpha', 0.75)
        doTweenAlpha('weh3', 'shiftgreen', 0, crochet/2000)
    end
    if direction == 3 then
        setProperty('shiftred.alpha', 0.75)
        doTweenAlpha('weh4', 'shiftred', 0, crochet/2000)
    end
end
end

function onTweenCompleted(tag)
    for i = 1, 4 do
        if tag == 'weh' .. i then
            innoteanim = false
        end
    end
end