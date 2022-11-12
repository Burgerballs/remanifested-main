fearval=0;
percent=0;
shaking=false;

function onCreate()
makeLuaSprite('fearbar', 'FearFactorBar', 640-(281/2), 162);
makeLuaSprite('totallyrealbar', nil, 640-(281/2) + 14, 162 + 66);
makeGraphic('totallyrealbar', fearval, 110-65, '530000');
addLuaSprite('totallyrealbar');
setObjectCamera('fearbar', 'hud');
setObjectCamera('totallyrealbar', 'hud');
addLuaSprite('fearbar');
end

function noteMiss(id, direction, noteType, isSustainNote)
local minushealth=0.0475;
local health=getProperty('health');
local minusfearval=0;

percent = percent + 20;
fearval = percent * 2.1;

if percent > 100 then
    percent = 100;
end

minusfearval=percent/327.86885;

makeGraphic('totallyrealbar', fearval, 110-65, '530000');
setProperty('health', health - minushealth - minusfearval)
end