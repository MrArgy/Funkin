package fmf.songs;

import flixel.animation.FlxAnimationController;
import flixel.graphics.atlas.FlxAtlas;
import flixel.FlxSprite;
import MenuCharacter.CharacterSetting;
import fmf.characters.*;

class Remorse extends SongPlayer
{

    override function getDadTex()
	{
		var tex = Paths.getSparrowAtlas('whitty/remorse/updike_assets', 'mods');
		dad.frames = tex;
	}


	override function loadMap()
	{
		var bg:FlxSprite = new FlxSprite(-600, -448).loadGraphic(Paths.image('whitty/remorse/wall', 'mods'));
		bg.antialiasing = true;
		bg.scale.x = 1;
		bg.scale.y = 1;
		bg.scrollFactor.set(0.9, 0.9);
		playState.add(bg);

		var stageFront:FlxSprite = new FlxSprite(-650, 600).loadGraphic(Paths.image('whitty/remorse/light', "mods"));
		stageFront.setGraphicSize(Std.int(stageFront.width * 1.1));
		stageFront.updateHitbox();
		stageFront.antialiasing = true;
		stageFront.scrollFactor.set(0.9, 0.9);
		stageFront.active = false;
		stageFront.alpha = 0.35;

		playState.add(stageFront);

	}


	private function turnDadRemorse()
	{
		var animation = dad.animation;

		animation.destroyAnimations();

		animation.addByPrefix('idle', 'updingdong idle0', 24, false);
		animation.addByPrefix('singUP', 'updingdong up note0', 24, false);
		animation.addByPrefix('singRIGHT', 'updingdong right note0', 24, false);
		animation.addByPrefix('singLEFT', 'updingdong left note0', 24, false);
		animation.addByPrefix('singDOWN', 'updingdong down note0', 24, false);

		animation.play('idle');
	}

	private function turnDadNormal()
	{
		var animation = dad.animation;
		animation.addByPrefix('idle', 'updingdong idle', 24, false);
		animation.addByPrefix('singUP', 'updingdong up note', 24, false);
		animation.addByPrefix('singRIGHT', 'updingdong right note', 24, false);
		animation.addByPrefix('singLEFT', 'updingdong left note', 24, false);
		animation.addByPrefix('singDOWN', 'updingdong down note', 24, false);

		animation.play('idle');
	}

	override function createDadAnimations():Void
	{
		var animation = dad.animation;

		animation.addByPrefix('idle', 'updingdong idle0', 24, false);
		animation.addByPrefix('singUP', 'updingdong up note0', 24, false);
		animation.addByPrefix('singRIGHT', 'updingdong right note0', 24, false);
		animation.addByPrefix('singLEFT', 'updingdong left note0', 24, false);
		animation.addByPrefix('singDOWN', 'updingdong down note0', 24, false);

	
		dad.animation = animation;
	}

	override function createDadAnimationOffsets():Void
	{
		dad.addOffset('idle', -63, 1);
		dad.addOffset('singUP', 13, 48);
		dad.addOffset('singRIGHT', -81, 37);
		dad.addOffset('singLEFT', -46, -20);
		dad.addOffset('singDOWN', -80, -40);

		dad.dance();

	}

	override function getGFTex():Void
	{
		var tex = Paths.getSparrowAtlas('whitty/remorse/gf_but_spicy', 'mods');
		gf.frames = tex;

	}

	override function createGFAnimations()
	{
		var animation = gf.animation;
		animation.addByPrefix('sad', 'Sad', 24, false);
		animation.addByPrefix('danceLeft', 'GF Dancing Beat 0', 24, false);
		animation.addByPrefix('danceRight', 'GF Dancing Beat 0', 24, false);
		gf.animation = animation;
	}

	override function createGFAnimationOffsets()
	{
  
		gf.addOffset('sad', -140, -153);
		gf.addOffset('danceLeft', -140, -153);
		gf.addOffset('danceRight', -140, -153);

		gf.playAnim('danceRight');
		gf.dance();

		gf.x -= 150;
		gf.y -= 100;

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