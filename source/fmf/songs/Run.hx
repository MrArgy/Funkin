package fmf.songs;

import flixel.FlxG;
import flixel.util.FlxColor;
import flixel.FlxSprite;
import fmf.characters.*;
import Song.SwagSong;

class Run extends Incident
{

	override function getDadTex()
	{
		var tex = Paths.getSparrowAtlas('trueform/bob/GF', 'mods');
		dad.frames = tex;
	}

	override function loadMap()
	{
		super.loadMap();

		playState.defaultCamZoom = 0.9;

		hole = new FlxSprite(-650, 600);
		hole.loadGraphic(Paths.image('trueform/trollge/gfshit', 'mods'), true, 512, 512);
		hole.scrollFactor.set(0.9, 0.9);

		hole.animation.add('shit', getArray(5, 16), 16, true);
		hole.animation.play('shit', true);

		
		var bg:FlxSprite = new FlxSprite(-600, -200).loadGraphic(Paths.image('trueform/bob/bg', 'mods'));
		bg.antialiasing = true;
		bg.scrollFactor.set(0.9, 0.9);

		bg.y -= 250;
		playState.add(bg);



		var bg1:FlxSprite = new FlxSprite(-600, -300).loadGraphic(Paths.image('trueform/bob/fg', 'mods'));
		bg1.antialiasing = true;
		bg1.scrollFactor.set(0.9, 0.9);

		bg1.y -= 250;
		playState.add(bg1);


	}

	private override function createDadAnimations()
	{
		var animation = dad.animation;
		animation.addByIndices('singLEFT', 'GF Dancing Beat instance 1', [15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25, 26, 27, 28, 29],"", 24, false);
		animation.addByPrefix('singRIGHT', 'GF Right Note instance 1', 24, false);
		animation.addByPrefix('singUP', 'GF Up Note instance 1', 24, false);
		animation.addByPrefix('singDOWN', 'GF Down Note instance 1', 24, false);
		animation.addByIndices('danceLeft', 'GF Dancing Beat instance 1', [30, 0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14], "", 24, false);
		animation.addByIndices('danceRight', 'GF Dancing Beat instance 1',[30, 0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14], "", 24, false);
		dad.animation = animation;
	}

	// create dad animation offsets
	private override function createDadAnimationOffsets()
	{
		dad.addOffset('danceLeft', -20, -9);
		dad.addOffset("singRIGHT", -15, -17);
		dad.addOffset("singLEFT", -23, -20);
		dad.addOffset("singDOWN", -29, -19);
		dad.addOffset('scared', -2, -17);

		dad.playAnim('danceRight');
		dad.dance();
	}


	override function createCharacters()
	{
		super.createCharacters();
		bf.alpha = 0.85;
		dad.alpha = 1;
	}
}