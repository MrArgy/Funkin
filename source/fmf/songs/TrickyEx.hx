package fmf.songs;

import flixel.util.FlxColor;
import flixel.FlxG;
import flixel.FlxSprite;
import MenuCharacter.CharacterSetting;
import fmf.characters.*;

class TrickyEx extends SongPlayer
{

    override function getDadTex()
	{
		var frames = Paths.getSparrowAtlas('clown/extiky', 'mods');
		dad.frames = frames;
	}


	override function loadMap()
	{
		playState.defaultCamZoom = 0.8;

		var bg:FlxSprite = new FlxSprite(-400, -200).loadGraphic(Paths.image('clown/fourth/bg', 'mods'));
		bg.antialiasing = true;
		bg.scale.y = 3;
		bg.scale.x = 3;
		playState.add(bg);

		var fg:FlxSprite = new FlxSprite().loadGraphic(Paths.image('clown/fourth/daBackground', 'mods'));
		fg.antialiasing = true;
		fg.x = -900;
		fg.y = -175;
		fg.scale.y = 1;
		fg.scale.x = 1;
		playState.add(fg);
	}

	override function getGFVersion():Character
	{
		return new GFTricky(400, 250);
	}

	override function getGFTex()
	{
		var tex = Paths.getSparrowAtlas('clown/fourth/GF_tricky', 'mods');
		gf.frames = tex;
	}

	override function createGFAnimations()
	{
		gf.animation.addByPrefix('danceRight', 'GF Ex Tricky', 24, true);
	}

	override function createBFAnimationOffsets()
	{
		gf.addOffset('danceRight', -140, -153);
		gf.playAnim('danceRight');
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
		dad.addOffset('idle');
		dad.addOffset('idle', -5, -2);
		dad.addOffset('singUP', -73, 29);
		dad.addOffset('singRIGHT', -220, -20);
		dad.addOffset('singLEFT', -104, 0);
		dad.addOffset('singDOWN', -139, -130);

		dad.dance();
		
		dad.scale.x = 1.25;
		dad.scale.y = 1.25;

		dad.x -= 100;
		dad.y += 200;
	}

	public override function createCharacters()
	{
		super.createCharacters();
		dad.x -= 450;
		dad.y += 100;

		var hole = new FlxSprite(0, 0).loadGraphic(Paths.image('clown/fourth/Spawnhole_Ground_BACK', 'mods'));
		// fg.animation.play('idle');
		hole.antialiasing = true;
		// bg.active = false;
		hole.x = dad.x;
		hole.y = dad.y + 400;

		hole.scale.y = 1.5;
		hole.scale.x = 1;
		playState.add(hole);

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