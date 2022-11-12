

function onCreate()

    makeAnimatedLuaSprite("shift", "bg_manifest", -388.05, -232);
    addAnimationByIndices("shift", "idle", "bg_manifest", "5", 24);
    addAnimationByPrefix('shift', 'bop', 'bg_manifest', 24, false);
	objectPlayAnimation('shift', 'idle');
    makeAnimatedLuaSprite("floor", "floorManifest", -1053.1, -464.7);
    addAnimationByIndices("floor", "idle", "floorManifest", "5", 24);
    addAnimationByPrefix('floor', 'bop', 'floorManifest', 24, false);
	objectPlayAnimation('floor', 'idle');
    addLuaSprite("shift", false);
    addLuaSprite("floor", false);
end

function onBeatHit()
    local gfspd = getProperty("gfSpeed");
	    if curBeat % gfspd == 0 then
        objectPlayAnimation('shift', 'bop');
        objectPlayAnimation('floor', 'bop');
        end
end