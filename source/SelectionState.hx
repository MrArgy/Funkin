package;

import Options.PcOption;
import extension.admob.AdMob;
import fmf.songs.*;

import ui.FlxVirtualPad.FlxActionMode;
import ui.FlxVirtualPad.FlxDPadMode;
import ui.Controller;
import flixel.FlxG;
import flixel.FlxSprite;
import flixel.addons.transition.FlxTransitionableState;
import flixel.graphics.frames.FlxAtlasFrames;
import flixel.group.FlxGroup.FlxTypedGroup;
import flixel.group.FlxGroup;
import flixel.math.FlxMath;
import flixel.text.FlxText;
import flixel.tweens.FlxTween;
import flixel.util.FlxColor;
import flixel.util.FlxTimer;
import lime.net.curl.CURLCode;

#if windows
import Discord.DiscordClient;
#end

using StringTools;

class SelectionState extends MusicBeatState
{
	var storeLabel:FlxText;

	var options:Array<String> = ['Play', 'Characters', "Effects"];

	var curWeek:Int = 0;

	var txtTracklist:FlxText;

	var grpWeekText:FlxTypedGroup<SelectionItem>;

	var grpCharacters:FlxTypedGroup<PcItem>;


	var grpWeekCharacters:FlxTypedGroup<MenuCharacter>;

	var grpLocks:FlxTypedGroup<FlxSprite>;
	
	var yellowBG:FlxSprite;

	public static var pcData(get, never):Array<Int>;
	static inline function get_pcData():Array<Int>
	{
		return FlxG.save.data.pcData;
	} 


	override function create()
	{

		AdMob.hideBanner();

		#if windows
		// Updating Discord Rich Presence
		DiscordClient.changePresence("In the Story Mode Menu", null);
		#end

		transIn = FlxTransitionableState.defaultTransIn;
		transOut = FlxTransitionableState.defaultTransOut;

		if (FlxG.sound.music != null)
		{
			if (!FlxG.sound.music.playing)
				FlxG.sound.playMusic(Paths.music('freakyMenu'));
		}

		persistentUpdate = persistentDraw = true;

		storeLabel = new FlxText(10, 10, 0, "CUSTOMIZATION", 36);
		storeLabel.setFormat("VCR OSD Mono", 32);

		storeLabel.screenCenter(X);
		

		//load data babe
		currentPc = FlxG.save.data.pcId;

		

		var rankText:FlxText = new FlxText(0, 10);
		rankText.text = 'RANK: GREAT';
		rankText.setFormat(Paths.font("vcr.ttf"), 32);
		rankText.size = storeLabel.size;
		rankText.screenCenter(X);

		var ui_tex = Paths.getSparrowAtlas('campaign_menu_UI_assets');
		yellowBG = new FlxSprite(0, 56);

		loadWeekBG(0);

		// .makeGraphic(FlxG.width, 400, 0xFFF9CF51);


		grpWeekText = new FlxTypedGroup<SelectionItem>();
		add(grpWeekText);

		var blackBarThingie:FlxSprite = new FlxSprite().makeGraphic(FlxG.width, 56, FlxColor.BLACK);
		add(blackBarThingie);

		grpWeekCharacters = new FlxTypedGroup<MenuCharacter>();

		grpCharacters = new FlxTypedGroup<PcItem>();

		grpLocks = new FlxTypedGroup<FlxSprite>();
		add(grpLocks);


		trace("Line 70");

		for (i in 0...options.length)
		{
			var weekThing:SelectionItem = new SelectionItem(0, yellowBG.y + yellowBG.height + 10, options[i]);
			weekThing.y += ((weekThing.height + 20) * i);
			weekThing.targetY = i;
			grpWeekText.add(weekThing);

			weekThing.screenCenter(X);
			weekThing.x -= 25;
			weekThing.antialiasing = true;
			// weekThing.updateHitbox();
		}

		for (i in 0...PcManager.pcList.length)
		{
			var unlocked = pcData[i] >= PcManager.pcList[i].cost;
			var weekThing:PcItem = new PcItem(i, yellowBG.x + yellowBG.width + 100 * i, 0);

			weekThing.y = yellowBG.y + 175;

			grpCharacters.add(weekThing);
			weekThing.antialiasing = true;
			// weekThing.updateHitbox();
		}
	


		add(yellowBG);
		// add(bgShit);

		txtTracklist = new FlxText(FlxG.width * 0.05, yellowBG.x + yellowBG.height - 325, 0, "Tracks", 32);
		txtTracklist.alignment = CENTER;
		txtTracklist.font = rankText.font;
		txtTracklist.color = FlxColor.BLACK;

		txtTracklist.alpha = 0;
		txtTracklist.setFormat(Paths.font("vcr.ttf"), 35, FlxColor.WHITE, CENTER);

		txtTracklist.setBorderStyle(OUTLINE, 0xFF000000, 3, 1);

		add(txtTracklist);
		// add(rankText);
		add(storeLabel);

		add(grpWeekCharacters);
		add(grpCharacters);


		changeDifficulty(0);

		Controller.init(this, FULL, A_B);


		super.create();
	}

	function loadWeekBG(curWeek:Int)
	{
		yellowBG.loadGraphic(Paths.image('configuration')); 
	}

	override function update(elapsed:Float)
	{

		// FlxG.watch.addQuick('font', storeLabel.font);

		grpLocks.forEach(function(lock:FlxSprite)
		{
			lock.y = grpWeekText.members[lock.ID].y;
		});

		if (!movedBack)
		{
			if (!selectedWeek)
			{
				if (Controller.UP_P)
				{
					changeWeek(-1);
				}

				if (Controller.DOWN_P)
				{
					changeWeek(1);
				}


				if (Controller.RIGHT_P)
					changeDifficulty(1);
				if (Controller.LEFT_P)
					changeDifficulty(-1);


				
			}

			if (Controller.ACCEPT)
			{
				selectWeek();
			}
		}

		if (Controller.BACK && !movedBack && !selectedWeek)
		{
			FlxG.sound.play(Paths.sound('cancelMenu'));
			movedBack = true;
			FlxG.switchState(new MainMenuState());
		}

		super.update(elapsed);
	}

	var movedBack:Bool = false;
	var selectedWeek:Bool = false;
	var stopspamming:Bool = false;

	function selectWeek()
	{
		if (stopspamming == false)
		{
			FlxG.sound.play(Paths.sound('confirmMenu'));

			grpWeekText.members[curWeek].startFlashing();
			grpWeekCharacters.members[1].animation.play('bfConfirm');
			stopspamming = true;
		}

		PlayState.storyPlaylist = SongManager.songs[curWeek].copySongList;
		PlayState.playingSong = SongManager.songs[curWeek];

		PlayState.isStoryMode = true;
		selectedWeek = true;

		var diffic = "";

		new FlxTimer().start(1, function(tmr:FlxTimer)
		{
			LoadingState.loadAndSwitchState(new PlayState(), true);
		});
	}

	function changeWeek(change:Int = 0):Void
	{
		curWeek += change;

		if (curWeek >= options.length)
			curWeek = 0;
		if (curWeek < 0)
			curWeek = options.length - 1;

		var bullShit:Int = 0;

		for (item in grpWeekText.members)
		{
			item.targetY = bullShit - curWeek;
			if (item.targetY == Std.int(0))
				item.alpha = 1;
			else
				item.alpha = 0.6;
			bullShit++;
		}

		// get first song in the selected week
		FlxG.sound.play(Paths.sound('scrollMenu'));
	}

	var currentPc:Int;
	function changeDifficulty(change:Int = 0):Void
	{
		currentPc += change;

		if (currentPc < 0)
			currentPc = PcManager.pcList.length - 1;
		if (currentPc > PcManager.pcList.length - 1)
			currentPc = 0;

		var bullShit:Int = 0;

		for (item in grpCharacters.members)
		{
			item.targetX = bullShit - currentPc;
			if (item.targetX == Std.int(0))
			{
				item.color = item.isUnlocked ? FlxColor.GREEN :  FlxColor.WHITE;
				item.alpha = 1;
			}
			else
			{
				item.color = FlxColor.BLACK;
				item.alpha = 0.1;
			}

			bullShit++;
		}

		FlxG.sound.play(Paths.sound('scrollMenu'));

	}
}
