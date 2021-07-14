package fmf.songs;

import flixel.util.FlxColor;
import flixel.FlxG;
import flixel.FlxSprite;
import MenuCharacter.CharacterSetting;
import fmf.characters.*;

class TrickyMask extends SongPlayer
{

    override function getDadTex()
	{
		var tex = Paths.getSparrowAtlas('clown/TrickyMask', 'mods');
		dad.frames = tex;
	}


	override function loadMap()
	{
		var bg:FlxSprite = new FlxSprite(-400, -200).loadGraphic(Paths.image('clown/red', 'mods'));
		bg.antialiasing = true;
		bg.scale.y = 1;
		bg.scale.x = 1;
		playState.add(bg);

		var fg:FlxSprite = new FlxSprite();
		fg.frames =  Paths.getSparrowAtlas('clown/tricky_floor', 'mods');
		fg.animation.addByPrefix('idle', 'Symbol 1');
		fg.antialiasing = true;

		fg.y = 600;
		fg.x = 150;
		fg.scale.y = 1.75;
		fg.scale.x = 1.75;
		playState.add(fg);

	}

	override function createDadAnimations():Void
	{
		var animation = dad.animation;
		animation.addByPrefix('idle', 'Idle', 18, false);
		animation.addByPrefix('singUP', 'Sing Up', 24, false);
		animation.addByPrefix('singRIGHT', 'Sing Right', 24, false);
		animation.addByPrefix('singLEFT', 'Sing Left', 24, false);
		animation.addByPrefix('singDOWN', 'Sing Down', 24, false);
		dad.animation = animation;
	}

	override function createDadAnimationOffsets():Void
	{
		dad.addOffset('idle', -7, -1);
		dad.addOffset('singUP', 44, 24);
		dad.addOffset('singRIGHT', -3, -38); 
		dad.addOffset('singLEFT', 130, 23);
		dad.addOffset('singDOWN', 9, -26);
		
		dad.x += 3;
		dad.y -= 4;
		dad.scale.x = 1.5;
		dad.scale.y = 1.5;

		dad.dance();

	}

	public override function createCharacters()
	{
		super.createCharacters();
		bf.x += 100;
		bf.y += 50;

		dad.y += 175;
		dad.x -= 200;
	}

	public override function getDadIcon(icon:HealthIcon)
	{
		icon.loadGraphic(Paths.image('iconGrid'), true, 150, 150);
		icon.animation.add('dad', [44, 45], 0, false, false);
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