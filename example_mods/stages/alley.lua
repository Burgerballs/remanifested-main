function onCreate()

	makeLuaSprite('white', null, 0, 0)
	makeGraphic('white', 1280, 720, 'FFFFFF')
	addLuaSprite('white', false)
	setScrollFactor('white', 0,0)

makeLuaSprite('ally','ally',-623,-383)
setProperty('ally.antialiasing',false)
addLuaSprite('ally')

makeLuaSprite('smoke1','libido_smoke',-153,74)
setProperty('smoke1.antialiasing',false)
addLuaSprite('smoke1',true)
setProperty('smoke1.alpha',0)

makeLuaSprite('smoke2','libido_smoke',143.2,74)
setProperty('smoke2.antialiasing',false)
setProperty('smoke2.flipX',true)
setProperty('smoke2.alpha',0)
addLuaSprite('smoke2',true)



end
frames = 0

function onUpdate(elapsed)
laps = elapsed/0.016 --to get that constant speed regardless of fps
frames = frames + 1
t = math.sin(frames/100)*8
tt = math.sin((frames+50)/100)*8
setProperty('smoke1.x',t-153)
setProperty('smoke2.x',tt+143.2)


end


function onBeatHit()

if curBeat == 223 then doTweenAlpha('4','smoke1',0.5,4,'linear') end
if curBeat == 284 then doTweenAlpha('5','smoke2',0.5,4,'linear') end


end