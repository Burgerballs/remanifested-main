package meta.states;

import Controls.Control;
import flixel.FlxG;
import flixel.FlxSprite;
import flixel.FlxSubState;
import flixel.addons.transition.FlxTransitionableState;
import flixel.group.FlxGroup.FlxTypedGroup;
import flixel.input.keyboard.FlxKey;
import flixel.system.FlxSound;
import flixel.text.FlxText;
import flixel.group.FlxGroup;
import flixel.util.FlxTimer;
import flixel.tweens.FlxEase;
import flixel.tweens.FlxTween;
import flixel.util.FlxGradient;
import meta.playerdata.*;
import flixel.util.FlxColor;
import flixel.FlxCamera;
import flixel.util.FlxStringUtil;
import meta.states.*;

class DiffSelectSubstate extends MusicBeatSubstate
{
	var sprDifficulty:FlxSprite;
	var leftArrow:FlxSprite;
	var difficultySelectors:FlxGroup;
	var rightArrow:FlxSprite;
	var difficultyChoices = [];
	var curSelected:Int = 0;
	var infoText:FlxText;
	var pauseMusic:FlxSound;
	var practiceText:FlxText;
	var skipTimeText:FlxText;
	var curDifficulty:Int = 1;
	var skipTimeTracker:Alphabet;
	var curTime:Float = Math.max(0, Conductor.songPosition);

	// var botplayText:FlxText;
	public static var songName:String = '';

	public function new()
	{
		super();
		CoolUtil.difficulties = ['Easy', 'Normal', 'Hard', 'High'];

		var coolGradient = FlxGradient.createGradientFlxSprite(FlxG.width, Std.int(FlxG.height),
		FlxColor.gradient(0x66000000, FlxColor.TRANSPARENT, 32));
		coolGradient.scrollFactor.set(0, 0);
		add(coolGradient);

		var bg:FlxSprite = new FlxSprite().makeGraphic(FlxG.width, FlxG.height, FlxColor.BLACK);
		bg.scrollFactor.set();
		add(bg);
		bg.alpha = 0.7;

		var ui_tex = Paths.getSparrowAtlas('RemanMenuAssets');

		difficultySelectors = new FlxGroup();
		add(difficultySelectors);

		sprDifficulty = new FlxSprite(610, 320);
		sprDifficulty.frames = ui_tex;
		sprDifficulty.antialiasing = ClientPrefs.globalAntialiasing;
		difficultySelectors.add(sprDifficulty);
		sprDifficulty.scrollFactor.set(0, 0);

		leftArrow = new FlxSprite(sprDifficulty.x - 140, sprDifficulty.y);
		leftArrow.frames = ui_tex;
		leftArrow.animation.addByPrefix('idle', "LeftArrow");
		leftArrow.animation.play('idle');
		leftArrow.scrollFactor.set(0, 0);
		leftArrow.antialiasing = ClientPrefs.globalAntialiasing;
		difficultySelectors.add(leftArrow);

		rightArrow = new FlxSprite(leftArrow.x + 376, leftArrow.y);
		rightArrow.frames = ui_tex;
		rightArrow.animation.addByPrefix('idle', 'RightArrow');
		rightArrow.animation.addByPrefix('press', "arrow push right", 24, false);
		rightArrow.animation.play('idle');
		rightArrow.antialiasing = ClientPrefs.globalAntialiasing;
		rightArrow.scrollFactor.set(0, 0);
		difficultySelectors.add(rightArrow);
		changeDifficulty();
	}

	override function update(elapsed:Float)
	{
		super.update(elapsed);

		var upP = controls.UI_UP_P;
		var downP = controls.UI_DOWN_P;
		var accepted = controls.ACCEPT;


		if (controls.UI_LEFT_P)
			{
				FlxG.sound.play(Paths.sound('scrollMenu'), 0.4);
				changeDifficulty(-1);
			}
			if (controls.UI_RIGHT_P)
			{
				FlxG.sound.play(Paths.sound('scrollMenu'), 0.4);
				changeDifficulty(1);
			}
		if (accepted) {
			loadweek();
		}
	}

	var tweenDifficulty:FlxTween;

	function changeDifficulty(change:Int = 0):Void
	{
		curDifficulty += change;

		if (curDifficulty < 0)
			curDifficulty = CoolUtil.difficulties.length - 1;
		if (curDifficulty >= CoolUtil.difficulties.length)
			curDifficulty = 0;

		var diff:String = CoolUtil.difficulties[curDifficulty];
		sprDifficulty.animation.addByPrefix(diff, diff, 1);
		sprDifficulty.animation.play(diff, true);
		// trace(Paths.currentModDirectory + ', menudifficulties/' + Paths.formatToSongPath(diff));

		sprDifficulty.x = leftArrow.x + 110;
		sprDifficulty.x += (308 - sprDifficulty.width) / 3;
		sprDifficulty.alpha = 0;
		sprDifficulty.y = leftArrow.y - 15;

		if (tweenDifficulty != null)
			tweenDifficulty.cancel();
		tweenDifficulty = FlxTween.tween(sprDifficulty, {y: leftArrow.y + 15, alpha: 1}, 0.07, {
			onComplete: function(twn:FlxTween)
			{
				tweenDifficulty = null;
			}
		});
	}

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

	override function destroy()
	{

		super.destroy();
	}
}
