package fmf.songs;

import flixel.util.FlxColor;
import flixel.FlxG;
import flixel.FlxSprite;
import MenuCharacter.CharacterSetting;
import fmf.characters.*;

class TrickyHell extends SongPlayer
{

    override function getDadTex()
	{
		var frames = Paths.getSparrowAtlas('clown/tiky', 'mods');
		dad.frames = frames;
	}

	override function loadMap()
	{
		playState.defaultCamZoom = 0.5;
		var bg:FlxSprite = new FlxSprite(-400, -200).loadGraphic(Paths.image('clown/red', 'mods'));
		bg.antialiasing = true;


		bg.scale.y = 2.5;
		bg.scale.x = 2.5;
		playState.add(bg);
		
		var stageFront:FlxSprite = new FlxSprite(0, 0).loadGraphic(Paths.image('clown/hellclown/island_but_red', 'mods'));

		stageFront.x -= 500;
		stageFront.y = 200; 

		stageFront.scale.x = 3;
		stageFront.scale.y = 3;
		playState.add(stageFront);

	}

	override function createDadAnimations():Void
	{
		var animation = dad.animation;
		animation.addByPrefix('idle', 'Idle', 24, false);
		animation.addByPrefix('singUP', 'Proper Up', 24, false);
		animation.addByPrefix('singRIGHT', 'Proper Right', 24, false);
		animation.addByPrefix('singLEFT', 'Proper Left', 24, false);
		animation.addByPrefix('singDOWN', 'Proper Down', 24, false);
		dad.animation = animation;
	}

	override function createDadAnimationOffsets():Void
	{
		dad.addOffset('idle', 0, 0);
		dad.addOffset('singUP', 108, 0);
		dad.addOffset('singRIGHT', 12, 0);
		dad.addOffset('singLEFT', -50, 0);
		dad.addOffset('singDOWN', 10, 0);

		dad.dance();

		dad.scale.x = 4;
		dad.scale.y = 4;

		dad.x -= 500;
		dad.y += 400;
	}

	public override function createCharacters()
	{
		super.createCharacters();
		bf.x += 100;
		bf.y += 50;

		dad.x -= 650;
		dad.y += 150;
	}

	public override function getDadIcon(icon:HealthIcon)
	{
		icon.loadGraphic(Paths.image('iconGrid'), true, 150, 150);
		icon.animation.add('dad', [56, 57], 0, false, false);
		icon.animation.play("dad");
	}

	override function updateCamFollowDad()
	{
		super.updateCamFollowDad();
		playState.camFollow.y = dad.getMidpoint().y - 250;
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