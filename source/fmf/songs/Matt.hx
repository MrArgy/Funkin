package fmf.songs;

import flixel.FlxSprite;
import fmf.characters.*;

class Matt extends SongPlayer
{


	override function loadMap()
	{
		playState.defaultCamZoom = 0.8;
		var bg:FlxSprite = new FlxSprite(-400, -200).loadGraphic(Paths.image('swordfight', "week_mods"));
		bg.antialiasing = true;
		bg.scrollFactor.set(0.9, 0.9);
		bg.active = true;
		playState.add(bg);
	}
    override function getDadTex()
	{
		var tex = Paths.getSparrowAtlas('characters/matt_assets');
		dad.frames = tex;
	}

	override function createDadAnimations():Void
	{
		var animation = dad.animation;
		animation.addByPrefix('idle', "matt idle", 24);
		animation.addByPrefix('singUP', 'matt up note', 24, false);
		animation.addByPrefix('singDOWN', 'matt down note', 24, false);
		animation.addByPrefix('singLEFT', 'matt left note', 24, false);
		animation.addByPrefix('singRIGHT', 'matt right note', 24, false);

		dad.animation = animation;
	}

	override function createDadAnimationOffsets():Void
	{
		dad.addOffset("singUP", 0, 20);
		dad.addOffset("singRIGHT", -15, -20);
		dad.addOffset("singLEFT", 30, -40);
		dad.addOffset("singDOWN", 0, -20);
		
		dad.dance();

	}

	override function createCharacters()
	{
		super.createCharacters();


		dad.x -= 250;
		dad.y += 150;
	}

	override function setCamPosition()
	{
		camPos.x += 400;
	}

	override function midSongEventUpdate(curBeat:Int):Void
	{
		
	}


}