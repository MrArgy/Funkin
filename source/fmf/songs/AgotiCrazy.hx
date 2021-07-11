package fmf.songs;

import flixel.util.FlxColor;
import flixel.FlxG;
import flixel.FlxSprite;
import MenuCharacter.CharacterSetting;
import fmf.characters.*;

class AgotiCrazy extends Agoti
{

    override function getDadTex()
	{
		var tex = Paths.getSparrowAtlas('agoti/Alt_Agoti_Sprites_B', 'mods');
		dad.frames = tex;
	}


	override function loadMap()
	{
		var dumbShit = new FlxSprite(-1000, -300).makeGraphic(Std.int(FlxG.width * 3), Std.int(FlxG.height * 3), FlxColor.WHITE);
		dumbShit.scrollFactor.set(1, 1);
		dumbShit.cameras = [playState.camGame];
		playState.add(dumbShit);

		playState.defaultCamZoom = 0.6;
		
		var bg:FlxSprite = new FlxSprite(-400, -200).loadGraphic(Paths.image('agoti/Pillar_1'));
		bg.antialiasing = true;


		var fx = bg.width / 2;
		bg.x -= fx;
		bg.y += -400;
		
		bg.antialiasing = true;
		bg.y += 500;
		bg.x += 650;

		bg.scrollFactor.set(0.9, 0.9);



		bg.x -= 150;
		bg.y += 0;
		playState.add(bg);


		var stageFront:FlxSprite = new FlxSprite(0, 0).loadGraphic(Paths.image('agoti/Void_Front'));

		stageFront.x -= 500;
		stageFront.y -= 200; 

		stageFront.scale.x = 1.5;
		stageFront.scale.y = 1.5;
		playState.add(stageFront);


	}

	override function createDadAnimations():Void
	{
		var animation = dad.animation;
		animation.addByPrefix('idle', 'Angry_Agoti_Idle', 18, false);
		animation.addByPrefix('singUP', 'Angry_Agoti_Up', 24, false);
		animation.addByPrefix('singRIGHT', 'Angry_Agoti_Right', 24, false);
		animation.addByPrefix('singLEFT', 'Angry_Agoti_Left', 24, false);
		animation.addByPrefix('singDOWN', 'Angry_Agoti_Down', 24, false);
		dad.animation = animation;
	}

	override function createDadAnimationOffsets():Void
	{
	
		dad.addOffset('idle',0, 16);
		dad.addOffset('singUP', 32, 157);
		dad.addOffset('singRIGHT', 122, 8);
		dad.addOffset('singLEFT', 41, -32);
		dad.addOffset('singDOWN', 1, -104);

		dad.dance();
		dad.scale.x = 2;
		dad.scale.y = 2;
		dad.y += 250;
		
	}

	override function getGFVersion()
	{
		return new GFAgotiCrazy(400, 0);
	}

	override function createDad()
	{
        dad = new Dad(0, 125);
		getDadTex();
		createDadAnimations();
		createDadAnimationOffsets();
		dad.dance();

    }

	public override function getDadIcon(icon:HealthIcon)
	{
		icon.loadGraphic(Paths.image('iconGrid'), true, 150, 150);
		icon.animation.add('dad', [17, 18], 0, false, false);
		icon.animation.play("dad");
	}

	public override function setDadMenuCharacter(dad:MenuCharacter)
	{
		super.setDadMenuCharacter(dad);

		var frames = Paths.getSparrowAtlas('whitty/whitty', 'mods');
		dad.frames = frames;

		dad.animation.addByPrefix('dad', "Whitty idle dance BLACK LINE", 24);
		dad.animation.play('dad');
		setMenuCharacter(dad, new CharacterSetting(-200, 25, 1));
	}
}