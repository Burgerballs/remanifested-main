package meta.states;

#if desktop
import Discord.DiscordClient;
#end
import meta.states.*;
import meta.playerdata.ClientPrefs;
import meta.options.OptionsState;
import sys.io.File;
import sys.FileSystem;
import flixel.FlxG;
import flixel.FlxObject;
import flixel.FlxSprite;
import flixel.util.FlxTimer;
import flixel.addons.transition.FlxTransitionableState;
import flixel.effects.FlxFlicker;
import flixel.graphics.frames.FlxAtlasFrames;
import flixel.group.FlxGroup.FlxTypedGroup;
import flixel.text.FlxText;
import flixel.math.FlxMath;
import flixel.group.FlxGroup.FlxTypedGroup;
import flixel.group.FlxGroup;
import flixel.tweens.FlxEase;
import flixel.tweens.FlxTween;
import flixel.util.FlxColor;
import flixel.graphics.FlxGraphic;
import flixel.util.FlxGradient;
import lime.app.Application;
import Achievements;
import meta.editors.MasterEditorMenu;
import flixel.input.keyboard.FlxKey;
import flixel.addons.display.FlxBackdrop;
import haxe.Json;

using StringTools;

typedef BoobiesFile =
{
	// JSON variables
	var image:Array<SusImg>;
	var x:Float;
	var ydiff:Float;
	var diffx:Float;
	var diffy:Float;
}
typedef SusImg =
{
	var path:String;
	var x:Float;
	var y:Float;
}

class MainMenuState extends MusicBeatState
{
	public static var psychEngineVersion:String = '0.6.2'; // This is also used for Discord RPC
	public static var curSelected:Int = 0;

	var menuItems:FlxTypedGroup<FlxSprite>;
	var weeweewoowoo:FlxTypedGroup<FlxSprite>;
	var curDifficulty:Int = 1;
	var sprDifficulty:FlxSprite;
	var leftArrow:FlxSprite;
	var rightArrow:FlxSprite;

	var optionShit:Array<String> = ['VsSky', 'Freeplay', 'Credits', 'Options'];

	var magenta:FlxSprite;
	var camFollow:FlxObject;
	var camFollowPos:FlxObject;
	var debugKeys:Array<FlxKey>;
	var difficultySelectors:FlxGroup;
	var menuJSON:BoobiesFile;

	function loadweek()
	{
		var songArray:Array<String> = ['Wife-Forever', 'Sky', 'Manifest'];

		// Nevermind that's stupid lmao
		PlayState.storyPlaylist = songArray;
		PlayState.isStoryMode = true;

		var diffic = CoolUtil.getDifficultyFilePath(curDifficulty);
		if (diffic == null)
			diffic = '';
		PlayState.storyDifficulty = curDifficulty;

		PlayState.SONG = Song.loadFromJson(PlayState.storyPlaylist[0].toLowerCase() + diffic, PlayState.storyPlaylist[0].toLowerCase());
		PlayState.campaignScore = 0;
		PlayState.campaignMisses = 0;
		new FlxTimer().start(1, function(tmr:FlxTimer)
		{
			LoadingState.loadAndSwitchState(new PlayState(), true);
			FreeplayState.destroyFreeplayVocals();
		});
	}

	override function create()
	{
		#if MODS_ALLOWED
		Paths.pushGlobalMods();
		#end
		menuJSON = Json.parse(Paths.getTextFromFile("menuJson.json")); 


		WeekData.loadTheFirstEnabledMod();
		CoolUtil.difficulties = ['Easy', 'Normal', 'Hard', 'High'];

		#if desktop
		// Updating Discord Rich Presence
		DiscordClient.changePresence("In the Menus", null);
		#end
		debugKeys = ClientPrefs.copyKey(ClientPrefs.keyBinds.get('debug_1'));

		transIn = FlxTransitionableState.defaultTransIn;
		transOut = FlxTransitionableState.defaultTransOut;

		persistentUpdate = persistentDraw = true;

		var yScroll:Float = Math.max(0.25 - (0.05 * (optionShit.length - 4)), 0.1);
		var bg = new FlxBackdrop(Paths.image('freepbg'), 100, 0, true, false);
		bg.antialiasing = ClientPrefs.globalAntialiasing;
		add(bg);
		bg.velocity.x = 50;
		bg.screenCenter();
		bg.color = 0xFF36517F;

		
		var allCharacters:Array<String> = ['1', '2', '3', '4', '5', '6', '7'];
		var newCharacter:String = 'Menu' + allCharacters[FlxG.random.int(0, allCharacters.length - 1)];

		var menuSprite:FlxSprite = new FlxSprite();
		menuSprite.frames = Paths.getSparrowAtlas('magi/$newCharacter', 'shared');
		menuSprite.animation.addByPrefix('idle', '$newCharacter', 24, true);
		menuSprite.animation.play('idle');
		menuSprite.setPosition(FlxG.width, FlxG.height);
		menuSprite.setGraphicSize(Std.int(menuSprite.width * 0.9));
		menuSprite.updateHitbox();
		menuSprite.x -= menuSprite.width; 
		menuSprite.y -= menuSprite.height;
		menuSprite.antialiasing = true;
		add(menuSprite);

		camFollow = new FlxObject(0, 0, 1, 1);
		camFollowPos = new FlxObject(0, 0, 1, 1);
		add(camFollow);
		add(camFollowPos);

		// black people
		var coolGradient = FlxGradient.createGradientFlxSprite(FlxG.width, Std.int(FlxG.height / 2.0),
			FlxColor.gradient(FlxColor.BLACK, FlxColor.TRANSPARENT, 32));
		coolGradient.scrollFactor.set(0, 0);
		add(coolGradient);

		weeweewoowoo = new FlxTypedGroup<FlxSprite>();
		add(weeweewoowoo);

		if (menuJSON.image != null) {
			for (i in 0...menuJSON.image.length) {
				var weewee:FlxSprite = new FlxSprite(menuJSON.image[i].x, menuJSON.image[i].y).loadGraphic(Paths.image(menuJSON.image[i].path));
				bg.antialiasing = ClientPrefs.globalAntialiasing;
				weeweewoowoo.add(weewee);
			}
		}

		// magenta.scrollFactor.set();

		menuItems = new FlxTypedGroup<FlxSprite>();
		add(menuItems);

		difficultySelectors = new FlxGroup();
		add(difficultySelectors);
		var ui_tex = Paths.getSparrowAtlas('RemanMenuAssets');

		var scale:Float = 1;
		/*if(optionShit.length > 6) {
			scale = 6 / optionShit.length;
		}*/

		for (i in 0...optionShit.length)
		{
			var offset:Float = 108 - (Math.max(optionShit.length, 4) - 4) * 80;
			var menuItem:FlxSprite = new FlxSprite(0, (i * menuJSON.ydiff) + offset);
			menuItem.scale.x = scale;
			menuItem.scale.y = scale;
			menuItem.frames = ui_tex;
			menuItem.animation.addByPrefix('idle', optionShit[i], 24);
			menuItem.animation.addByPrefix('selected', 'Select' + optionShit[i], 24);
			menuItem.animation.play('idle');
			menuItem.ID = i;
			menuItem.screenCenter(X);
			menuItems.add(menuItem);
			var scr:Float = (optionShit.length - 4) * 0.135;
			if (optionShit.length < 6)
				scr = 0;
			menuItem.scrollFactor.set(0, scr);
			menuItem.antialiasing = ClientPrefs.globalAntialiasing;
			// menuItem.setGraphicSize(Std.int(menuItem.width * 0.58));
			menuItem.updateHitbox();
		}

		var versionShit:FlxText = new FlxText(12, FlxG.height - 16, 0, "Skych Engine v0.1.0 | Psych Engine v0.6.2 | Friday Night Funkin' v0.2.8", 12);
		versionShit.scrollFactor.set();
		versionShit.setFormat("VCR OSD Mono", 16, FlxColor.WHITE, CENTER, FlxTextBorderStyle.OUTLINE, FlxColor.BLACK);
		versionShit.screenCenter(X);
		add(versionShit);

		// NG.core.calls.event.logEvent('swag').send();

		changeItem();

		#if ACHIEVEMENTS_ALLOWED
		Achievements.loadAchievements();
		var leDate = Date.now();
		if (leDate.getDay() == 5 && leDate.getHours() >= 18)
		{
			var achieveID:Int = Achievements.getAchievementIndex('friday_night_play');
			if (!Achievements.isAchievementUnlocked(Achievements.achievementsStuff[achieveID][2]))
			{ // It's a friday night. WEEEEEEEEEEEEEEEEEE
				Achievements.achievementsMap.set(Achievements.achievementsStuff[achieveID][2], true);
				giveAchievement();
				ClientPrefs.saveSettings();
			}
		}
		#end

		super.create();
	}

	var selectedSomethin:Bool = false;

	override function update(elapsed:Float)
	{
		if (FlxG.sound.music.volume < 0.8)
		{
			FlxG.sound.music.volume += 0.5 * FlxG.elapsed;
			if (FreeplayState.vocals != null)
				FreeplayState.vocals.volume += 0.5 * elapsed;
		}

		var lerpVal:Float = CoolUtil.boundTo(elapsed * 7.5, 0, 1);
		camFollowPos.setPosition(FlxMath.lerp(camFollowPos.x, camFollow.x, lerpVal), FlxMath.lerp(camFollowPos.y, camFollow.y, lerpVal));

		if (!selectedSomethin)
		{
			if (controls.UI_UP_P)
			{
				FlxG.sound.play(Paths.sound('scrollMenu'));
				changeItem(-1);
			}
			if (controls.UI_DOWN_P)
			{
				FlxG.sound.play(Paths.sound('scrollMenu'));
				changeItem(1);
			}

			if (controls.BACK)
			{
				selectedSomethin = true;
				FlxG.sound.play(Paths.sound('cancelMenu'));
				MusicBeatState.switchState(new TitleState());
			}

			if (controls.ACCEPT)
			{
				{
					selectedSomethin = true;
					FlxG.sound.play(Paths.sound('confirmMenu'));

					menuItems.forEach(function(spr:FlxSprite)
					{
						if (curSelected != spr.ID)
						{
							FlxTween.tween(spr, {alpha: 0}, 0.4, {
								ease: FlxEase.quadOut,
								onComplete: function(twn:FlxTween)
								{
									spr.kill();
								}
							});
						}
						else
						{
							FlxFlicker.flicker(spr, 1, 0.06, false, false, function(flick:FlxFlicker)
							{
								var daChoice:String = optionShit[curSelected];

								switch (daChoice)
								{
									case 'VsSky':
										openSubState(new DiffSelectSubstate());
									case 'Freeplay':
										MusicBeatState.switchState(new FreeplayState());
									case 'Credits':
										MusicBeatState.switchState(new CreditsState());
									case 'Options':
										LoadingState.loadAndSwitchState(new meta.options.OptionsState());
								}
							});
						}
					});
				}
			}
			#if desktop
			else if (FlxG.keys.anyJustPressed(debugKeys))
			{
				selectedSomethin = true;
				MusicBeatState.switchState(new MasterEditorMenu());
			}
			else if (FlxG.keys.justPressed.EIGHT) {
				MusicBeatState.switchState(new ChangelogState());
			}
			#end

		}

		super.update(elapsed);

		menuItems.forEach(function(spr:FlxSprite)
		{
			spr.x = menuJSON.x;
		});
	}

	function changeItem(huh:Int = 0)
	{
		curSelected += huh;

		if (curSelected >= menuItems.length)
			curSelected = 0;
		if (curSelected < 0)
			curSelected = menuItems.length - 1;

		menuItems.forEach(function(spr:FlxSprite)
		{
			spr.animation.play('idle');
			spr.updateHitbox();

			if (spr.ID == curSelected)
			{
				spr.animation.play('selected');
				var add:Float = 0;
				if (menuItems.length > 4)
				{
					add = menuItems.length * 8;
				}
				camFollow.setPosition(spr.getGraphicMidpoint().x, spr.getGraphicMidpoint().y - add);
				spr.centerOffsets();
			}
		});
	}
}
