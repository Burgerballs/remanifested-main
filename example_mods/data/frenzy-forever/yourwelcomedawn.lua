particlesExist = false
radius = 500
danced = false

function onCreatePost()
    makeLuaSprite('silo', nil, -800, -600)
	makeGraphic('silo', 3000, 2500, 'FF00FF')
    setScrollFactor('silo', 0, 0);
    setProperty('silo.alpha', 0.4)
    setProperty('silo.visible', false)

    originx = getProperty('gf.x')
    originy = getProperty('gf.y') + 300

    makeLuaSprite('gfsa', 'shine', originx, originy - 110)
    addLuaSprite('gfsa')
    setProperty('gfsa.visible', false)


    addLuaSprite('silo', false)

    setObjectOrder('gfsa', getObjectOrder('bg8') - 1)
    setObjectOrder('silo', getObjectOrder('bg8') + 1)

    makeAnimatedLuaSprite('gfs', 'SpeakersOnly', originx + 20, originy - 200)
    addAnimationByIndices('gfs', 'dan', 'GF Dancing Beat', '30,0,1,2,3,4,5,6,7,8,9,10,11,12,13,14', 24)
    addLuaSprite('gfs')

    makeLuaSprite('stickers', 'silly/funny image', originx - 590, originy - 200)
    addLuaSprite('stickers')
    setProperty('stickers.visible', false)
end

function onUpdatePost(e)
    setProperty('gfsa.angle', getProperty('gfsa.angle') + (e * 8))
    songPos = getSongPosition()
	local currentBeat = (songPos/1000)
    setProperty('stickers.angle', 5*math.sin((currentBeat)/2))
end

function onBeatHit()
    objectPlayAnimation('gfs', 'dan', true)
    
    if curBeat == 288 then
        activateSillyMode(true, true)
    end

    if curBeat == 356 then
        activateSillyMode(false, false)
    end

    if curBeat == 644 then
        activateSillyMode(true)
    end
    if curBeat == 652 then
        activateSillyMode(true, true)
        setProperty('stickers.visible', true)
    end
    if curBeat == 704 then
        setProperty('stickers.visible', false)
        cameraFlash('hud', 'FFFFFF', 1)
    end
end

function activateSillyMode(active, silliness)
    if active == true then
        cameraFlash('hud', 'FFFFFF', 1)
        setProperty('silo.visible', true)
        setProperty('gfsa.visible', true)
        if silliness == true then
            particlesExist = true;
            spawnParticles();
        end
    else
        cameraFlash('hud', 'FFFFFF', 1)
        particlesExist = false;
        setProperty('silo.visible', false)
        setProperty('gfsa.visible', false)
        if silliness == true then
            for i = 1,particleLimit do
                setProperty('flamesParticle' .. i .. 'visible', false)
            end
        end
    end
end

function onTimerCompleted(tag, loops, loopsLeft)
	if tag == 'particleSpawn' then
		particleTimer();
    end
end

-- particle logic
particleCount = 0;
particleLimit = 1600;
particleTime = 10;
colors = {'FF0000', '00FF00', '0000FF'}
function spawnParticles()
    if lowQuality then
        particleLimit = 800
    end
	for i = 1, particleLimit do
        local randcolor = getRandomInt(-1,3)
        local color = colors[randcolor]
		tag = ('flamesParticle'..i);
		makeLuaSprite(tag, nil, -10000, -10000);
		makeGraphic(tag, 15, 15, color);
		addLuaSprite(tag, true);
	end
	runTimer('particleSpawn', 0.1, 0);
end

function particleTimer()
	particleCount = particleCount + 1;
	if particleCount > particleLimit then
		particleCount = 1;
	end
	tag = ('flamesParticle'..particleCount);
	setProperty(tag..'.scale.x', getRandomFloat(1000, 1500) / 1000);
	setProperty(tag..'.x', getRandomFloat(-800, 1900));
	velX = getRandomFloat(-50, 50);
	setProperty(tag..'.velocity.x', velX);
	setProperty(tag..'.scale.y', getRandomFloat(1000, 1500) / 1000);
	setProperty(tag..'.y', getRandomFloat(-800, 700));
	setProperty(tag..'.velocity.y', getRandomFloat(100, 190));

	doTweenAlpha(tag..'AlphaTween', tag, 0, particleTime, 'linear');
	doTweenX(tag..'ScaleX', tag..'.scale', 0, particleTime, 'linear');
	doTweenY(tag..'ScaleY', tag..'.scale', 0, particleTime, 'linear');
	doTweenX(tag..'SpeedY', tag..'.velocity', velX * 0.75, particleTime/2, 'linear');
end

function onUpdate()
        if particlesExist == false then
                particleTime = 0.01;
        else
                particleTime = 10;
        end
end