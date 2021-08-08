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
		playState.defaultCamZoom = 0.85;
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
		animation.addByPrefix('idle', 'Idle', 24, false);
		animation.addByPrefix('singUP', 'Sing Up0', 24, false);
		animation.addByPrefix('singRIGHT', 'Sing Right0', 24, false);
		animation.addByPrefix('singLEFT', 'Sing Left0', 24, false);
		animation.addByPrefix('singDOWN', 'Sing Down0', 24, false);
		dad.animation = animation;
	}

	override function createDadAnimationOffsets():Void
	{
		dad.addOffset('idle', 0, 0);
		dad.addOffset('singUP', 0, 0);
		dad.addOffset('singRIGHT', 0, 0); 
		dad.addOffset('singLEFT', 0, 0);
		dad.addOffset('singDOWN', 0, 0);
		
		dad.x += 3;
		dad.y -= 4;

		dad.scale.x = 1.5;
		dad.scale.y = 1.5;

		dad.playAnim('idle');


	}

	public override function createCharacters()
	{
		super.createCharacters();
		bf.x += 100;
		bf.y += 50;

		dad.y += 250;
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