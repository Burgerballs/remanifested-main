local turnvalue = 20

bitchhoe = 39

function onBeatHit()

    doDaBeat()

end

turnvalue = 10
function doDaBeat()
if songName ~= 'obscurity' then
    if curBeat % 1 == 0 then
        turnvalue = -turnvalue
        for i = 1,2 do
            setProperty('iconP' .. i ..'.angle',turnvalue)
            setProperty('iconP' .. i ..'.scale.y',0.3)
        
            doTweenAngle('iconTween' .. i,'iconP' .. i,0,crochet/1000,'circOut')
            doTweenY('iconTweena' .. i,'iconP' .. i .. '.scale',1,crochet/1000,'circOut')
        end
    end
end
end