package;

import haxe.rtti.CType.Path;
import flixel.group.FlxSpriteGroup;
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
	static public var instance:SelectionState;

	var selectedItem:Item;

	var storeLabel:FlxText;

	var options:Array<String> = ['Play', 'Characters', "Notes", "Effects"];

	var curSelection:Int = 0;
	
	public var curPc:Int;
	public var curVfx:Int;
	public var curSkin:Int;



	var txtTracklist:FlxText;

	var txtTapToStart:FlxText;


	var grpWeekText:FlxTypedGroup<SelectionItem>;

	public var grpPcs:FlxTypedGroup<PcItem>;

	public var grpVfxs:FlxTypedGroup<VfxItem>;

	public var grpSkins:FlxTypedGroup<SkinItem>;


	var grpLocks:FlxTypedGroup<FlxSprite>;
	
	var yellowBG:FlxSprite;

	var selectedPc:PcItem;
	var selectedVfx:VfxItem;
	var selectedSkin:SkinItem;

	public static var pcData(get, never):Array<Int>;
	static inline function get_pcData():Array<Int>
	{
		return FlxG.save.data.pcData;
	} 

	public static var skinData(get, never):Array<Int>;
	static inline function get_skinData():Array<Int>
	{
		return FlxG.save.data.skinData;
	} 

	public static var vfxData(get, never):Array<Int>;
	static inline function get_vfxData():Array<Int>
	{
		return FlxG.save.data.vfxData;
	} 

	override function create()
	{

		instance = this;

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
		

		//load datas babe

		curPc = FlxG.save.data.pcId;
		curVfx = FlxG.save.data.vfxId;
		curSkin  = FlxG.save.data.skinId;


		var rankText:FlxText = new FlxText(0, 10);
		rankText.text = 'RANK: GREAT';
		rankText.setFormat(Paths.font("vcr.ttf"), 32);
		rankText.size = storeLabel.size;
		rankText.screenCenter(X);

		var ui_tex = Paths.getSparrowAtlas('campaign_menu_UI_assets');
		yellowBG = new FlxSprite(0, 56);

		loadWeekBG(0);

		grpWeekText = new FlxTypedGroup<SelectionItem>();
		add(grpWeekText);

		var blackBarThingie:FlxSprite = new FlxSprite().makeGraphic(FlxG.width, 56, FlxColor.BLACK);
		add(blackBarThingie);

		grpPcs = new FlxTypedGroup<PcItem>();
		grpVfxs = new FlxTypedGroup<VfxItem>();
		grpSkins = new FlxTypedGroup<SkinItem>();

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
			var weekThing:PcItem = new PcItem(i, yellowBG.x + yellowBG.width + 100 * i, 0);

			weekThing.y = yellowBG.y + 175;

			grpPcs.add(weekThing);
			weekThing.antialiasing = true;
			// weekThing.updateHitbox();
		}

		// create skin
		for (i in 0...SkinManager.skinList.length)
		{
			var weekThing:SkinItem = new SkinItem(i, yellowBG.x + yellowBG.width + 100 * i, 0);

			weekThing.y = yellowBG.y + 175;

			grpSkins.add(weekThing);
			weekThing.antialiasing = true;
			// weekThing.updateHitbox();
		}

		//create vfx
		for (i in 0...VfxManager.vfxList.length)
		{
			var weekThing:VfxItem = new VfxItem(i, yellowBG.x + yellowBG.width + 100 * i, 0);

			weekThing.y = yellowBG.y + 175;

			grpVfxs.add(weekThing);
			weekThing.antialiasing = true;
			// weekThing.updateHitbox();
		}
		


		selectedPc = new PcItem(curPc, yellowBG.x + yellowBG.width - 200, 0);
		selectedPc.y = yellowBG.y + 175;
		selectedPc.antialiasing = true;

		selectedSkin = new SkinItem(curSkin, yellowBG.x + yellowBG.width - 100, 0);
		selectedSkin.y = yellowBG.y + 175;
		selectedSkin.antialiasing = true;

		selectedVfx = new VfxItem(curVfx, yellowBG.x + yellowBG.width, 0);
		selectedVfx.y = yellowBG.y + 175;
		selectedVfx.antialiasing = true;



		selectedPc.deactiveTexts();
		selectedVfx.deactiveTexts();
		selectedSkin.deactiveTexts();

		// gd(selectedVfx);



		add(yellowBG);
		// add(bgShit);

		txtTracklist = new FlxText(FlxG.width * 0.05, yellowBG.x + yellowBG.height - 325, 0, "Tracks", 32);
		txtTracklist.alignment = CENTER;
		txtTracklist.font = rankText.font;
		txtTracklist.color = FlxColor.BLACK;

		txtTracklist.alpha = 0;
		txtTracklist.setFormat(Paths.font("vcr.ttf"), 35, FlxColor.WHITE, CENTER);

		txtTracklist.setBorderStyle(OUTLINE, 0xFF000000, 3, 1);

		txtTapToStart = new FlxText(-50, 0, 0, "Press 'A' to start!");
		txtTapToStart.setFormat(Paths.font("vcr.ttf"), 30, FlxColor.WHITE, CENTER);



		add(txtTracklist);
		// add(rankText);
		add(storeLabel);

		add(grpPcs);
		add(grpVfxs);
		add(grpSkins);

		add(selectedPc);
		add(selectedSkin);
		add(selectedVfx);


		add(txtTapToStart);

		updateVfxReview();
		updatePcReview();	
		updateSkinReview();

		changeSelection(0);
		changeItem(0);

		
		Controller.init(this, FULL, A_B);

        AdMob.onInterstitialEvent = onRewarded;

		super.create();
	}

	function loadWeekBG(curSelection:Int)
	{
		yellowBG.loadGraphic(Paths.image('configuration')); 
	}

	override function update(elapsed:Float)
	{
		updateOverview();

		if (!movedBack)
		{
			if (!selectedWeek)
			{
				if (Controller.UP_P)
				{
					changeSelection(-1);
				}

				if (Controller.DOWN_P)
				{
					changeSelection(1);
				}


				if (Controller.RIGHT_P)
					changeItem(1);
				if (Controller.LEFT_P)
					changeItem(-1);


				
			}

			if (Controller.ACCEPT)
			{
				select();
			}
		}

		if (Controller.BACK && !movedBack && !selectedWeek)
		{
			FlxG.sound.play(Paths.sound('cancelMenu'));
			movedBack = true;
			if (PlayState.isStoryMode)
			{
				FlxG.switchState(new StoryMenuState());
			}
			else
			{
				FlxG.switchState(new FreeplayState());
			}
		}

		super.update(elapsed);
	}

	var movedBack:Bool = false;
	var selectedWeek:Bool = false;
	var stopspamming:Bool = false;

	function select()
	{
		if (options[curSelection].toLowerCase() == 'play')
		{
			//go babe
			FlxG.sound.play(Paths.sound('confirmMenu'));
			new FlxTimer().start(1, function(tmr:FlxTimer)
			{
				LoadingState.loadAndSwitchState(new PlayState(), true);
			});
		}
		else
		{
			selectedItem = null;
			switch (curSelection)
			{
				case 1:
					selectedItem = grpPcs.members[curPc];
				
				case 2:
					selectedItem = grpSkins.members[curSkin];

				case 3:
					selectedItem = grpVfxs.members[curVfx];
			}

			trace('ah: ' + selectedItem);

			if (selectedItem == null || selectedItem.isUnlocked)
			{
				// chamge it to play menu
				FlxG.sound.play(Paths.sound('scrollMenu'));
				curSelection = 0;
				changeSelection(0);
			}
			else
			{
				FlxG.sound.play(Paths.sound('scrollMenu'));

				// try unlock it babe
				AdMob.showRewardVideo();
				#if !mobile
				onRewarded("shit");
				#end

			}
		}

	
	}

	function onRewarded(shitReward)
	{
		if(selectedItem != null)
			selectedItem.unlock();
	}
	
//---------------------------------------- DETECT OPTION -----------------------------------

	private function isOverview():Bool
	{
		return curSelection == 0;
	}

	private function isPc():Bool
	{
		return curSelection == 1;
	}

	private function isSkin():Bool
	{
		return curSelection == 2;
	}

	private function isVfx():Bool
	{
		return curSelection == 3;
	}

//--------------------------------------------------------------------------------------------

	function updateRender()
	{
		grpPcs.visible = isPc();
		grpSkins.visible = isSkin();
		grpVfxs.visible = isVfx();
	}

	function changeSelection(change:Int = 0):Void
	{
		curSelection += change;

		if (curSelection >= options.length)
			curSelection = 0;
		if (curSelection < 0)
			curSelection = options.length - 1;

		var bullShit:Int = 0;

		for (item in grpWeekText.members)
		{
			item.targetY = bullShit - curSelection;
			if (item.targetY == Std.int(0))
				item.alpha = 1;
			else
				item.alpha = 0.6;
			bullShit++;
		}

		// get first song in the selected week
		FlxG.sound.play(Paths.sound('scrollMenu'));
		
		changeItem(0);
		updateRender();

	}

	function changeItem(change:Int = 0):Void
	{
		switch (curSelection)
		{
			case 0:
				updateOverview();
			
			case 1:
				changePc(change);
			
			case 2:
				changeSkin(change);
			
			case 3:
				changeVfx(change);
		}


	}

	public function updatePcReview()
	{
		selectedPc.id = FlxG.save.data.pcId;
		selectedPc.updateUnlockStatus();
		selectedPc.createItemReview();
	}

	public function updateSkinReview()
	{
		selectedSkin.id = FlxG.save.data.skinId;
		selectedSkin.updateUnlockStatus();
		selectedSkin.createItemReview(0.35);
	}
	
	public function updateVfxReview()
	{
		selectedVfx.id = FlxG.save.data.vfxId;
		selectedVfx.updateUnlockStatus();
		selectedVfx.createItemReview(0.35);
	}
	
	private function updateOverview()
	{

		updateRender();

		selectedPc.itemReview.visible = isOverview();
		selectedSkin.itemReview.visible = isOverview();
		selectedVfx.itemReview.visible = isOverview();


		txtTapToStart.visible = isOverview();

		// hardcoding, ah shit here we go again

		selectedSkin.itemReview.y = selectedPc.y - 200;

		selectedVfx.itemReview.x = selectedPc.x - 105;
		selectedVfx.itemReview.y = selectedPc.y - 400;

		txtTapToStart.x = selectedPc.x + 5;
		txtTapToStart.y = selectedPc.y + 140;

	}

	private function changePc(change:Int)
	{
		curPc += change;

		if (curPc < 0)
			curPc = PcManager.pcList.length - 1;
		if (curPc > PcManager.pcList.length - 1)
			curPc = 0;

		FlxG.sound.play(Paths.sound('scrollMenu'));

		grpPcs.members[curPc].trySelect();

		updatePc();

	}
	private function changeSkin(change:Int)
	{
		curSkin += change;

		if (curSkin < 0)
			curSkin = SkinManager.skinList.length - 1;

		if (curSkin > SkinManager.skinList.length - 1)
			curSkin = 0;

		FlxG.sound.play(Paths.sound('scrollMenu'));

		grpSkins.members[curSkin].trySelect();

		updateSkin();
	}

	private function changeVfx(change:Int)
	{
		curVfx += change;

		if (curVfx < 0)
			curVfx = VfxManager.vfxList.length - 1;

		if (curVfx > VfxManager.vfxList.length - 1)
			curVfx = 0;

		FlxG.sound.play(Paths.sound('scrollMenu'));

		grpVfxs.members[curVfx].trySelect();

		updateVfx();
	}

	private function updatePc()
	{
		var bullShit:Int = 0;

		for (item in grpPcs.members)
		{
			item.targetX = bullShit - curPc;
			if (item.targetX == Std.int(0))
			{
				item.color = item.isUnlocked ? FlxColor.GREEN : FlxColor.WHITE;
				item.alpha = 1;
			}
			else
			{
				item.color = FlxColor.BLACK;
				item.alpha = 0.1;
			}

			bullShit++;
		}
	}

	private function updateSkin()
	{
		var bullShit:Int = 0;

		for (item in grpSkins.members)
		{
			item.targetX = bullShit - curSkin;
			if (item.targetX == Std.int(0))
			{
				item.color = item.isUnlocked ? FlxColor.GREEN : FlxColor.WHITE;
				item.alpha = 1;
			}
			else
			{
				item.color = FlxColor.BLACK;
				item.alpha = 0.1;
			}

			bullShit++;
		}
	}

	private function updateVfx()
	{
		var bullShit:Int = 0;

		for (item in grpVfxs.members)
		{
			item.targetX = bullShit - curVfx;
			if (item.targetX == Std.int(0))
			{
				item.color = item.isUnlocked ? FlxColor.GREEN : FlxColor.WHITE;
				item.alpha = 1;
			}
			else
			{
				item.color = FlxColor.BLACK;
				item.alpha = 0.1;
			}

			bullShit++;
		}
	}

}
