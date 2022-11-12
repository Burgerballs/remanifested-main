fearval=0;
percent=0;
shaking=false;

function onCreate()
makeAnimatedLuaSprite('fearbar', 'Manifest_Bar', 640-(281/2), 161);
makeLuaSprite('totallyrealbar', nil, 640-(281/2) + 14, 162 + 66);
makeGraphic('totallyrealbar', fearval, 110-65, '530000');
addLuaSprite('totallyrealbar');
setObjectCamera('fearbar', 'hud');
setObjectCamera('totallyrealbar', 'hud');
	addAnimationByPrefix('fearbar', 'idle', 'Manifest bar instance 1', 24, true)
	objectPlayAnimation('fearbar', 'idle', false)
addLuaSprite('fearbar');
end

function noteMiss(id, direction, noteType, isSustainNote)
local minushealth=0.0475;
local health=getProperty('health');
local minusfearval=0;

percent = percent + 20;
fearval = percent * 2.2;

if percent > 100 then
    percent = 100;
end

minusfearval=percent/327.86885;

makeGraphic('totallyrealbar', fearval, 110-62, '530000');
setProperty('health', health - minushealth - minusfearval)
end
function onBeatHit()
if curBeat == 16 then
makeGraphic('totallyrealbar', fearval + 1, 110-62, '530000');
end
end