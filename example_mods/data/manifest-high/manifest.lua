fearval=0;
percent=0;
shaking=false;

function onCreate()
	makeLuaSprite('black', 'Black', -200, -100);
	setScrollFactor('black', 0, 0);
	scaleObject('black', 1.4, 1.4)
        setObjectCamera('black', 'hud');
	addLuaSprite('black', true);
        setProperty('black.alpha', 0.0);
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