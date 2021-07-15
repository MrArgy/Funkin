package fmf.songs;

import flixel.util.FlxColor;
import flixel.FlxG;
import flixel.FlxSprite;
import MenuCharacter.CharacterSetting;
import fmf.characters.*;

class TrickyBen extends TrickyHell
{

    override function getDadTex()
	{
		var frames = Paths.getSparrowAtlas('clown/tikyben', 'mods');
		dad.frames = frames;
	}

	override function loadMap()
	{
		playState.defaultCamZoom = 0.25;
		var bg:FlxSprite = new FlxSprite(-400, -200).loadGraphic(Paths.image('clown/red', 'mods'));
		bg.antialiasing = true;

		bg.scale.y = 3.5;
		bg.scale.x = 3.5;

		bg.x -= 250;

		playState.add(bg);

		var stageFront:FlxSprite = new FlxSprite(0, 0).loadGraphic(Paths.image('clown/rb/island_but_red', 'mods'));

		stageFront.x -= 500;
		stageFront.y = 200;

		stageFront.scale.x = 3;
		stageFront.scale.y = 3;
		playState.add(stageFront);

	}

	override function createDadAnimations():Void
	{
		var animation = dad.animation;
		animation.addByPrefix('idle', 'Phase 3 Tricky Idle', 18, false);
		animation.addByPrefix('singUP', 'Proper Up', 24, false);
		animation.addByPrefix('singRIGHT', 'Proper Right', 24, false);
		animation.addByPrefix('singLEFT', 'Proper Left', 24, false);
		animation.addByPrefix('singDOWN', 'Proper Down', 24, false);
		dad.animation = animation;
	}

	override function createDadAnimationOffsets():Void
	{
		dad.addOffset('idle', 0, 226);
		dad.addOffset('singUP', 148, 233);
		dad.addOffset('singRIGHT', 452, -194);
		dad.addOffset('singLEFT', -70, 339);
		dad.addOffset('singDOWN', 500, -30);

		dad.dance();

		dad.dance();

		dad.scale.x = 4;
		dad.scale.y = 4;
	}

	public override function createCharacters()
	{
		super.createCharacters();

		dad.y -= 150;
		dad.x -= 700;
	}

	public override function getDadIcon(icon:HealthIcon)
	{
		icon.loadGraphic(Paths.image('clown/ben', 'mods'), true, 172, 126);
		icon.animation.add('dad', [0, 1], 0, false, false);
		icon.animation.play("dad");
		icon.scale.x = 0.5;
		icon.scale.y = 0.5;
		icon.y -= 25;
	}
}