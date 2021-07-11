package fmf.songs;

import flixel.FlxG;
import flixel.util.FlxColor;
import flixel.FlxSprite;
import fmf.characters.*;
import Song.SwagSong;

class Trueform extends Tutorial
{

	var hole:FlxSprite;

	override function loadMap()
	{

		var dumbShit = new FlxSprite(-1000, -300).makeGraphic(Std.int(FlxG.width * 3), Std.int(FlxG.height * 3), FlxColor.WHITE);
		dumbShit.scrollFactor.set(1, 1);
		dumbShit.cameras = [playState.camGame];
		playState.add(dumbShit);


		var stageFront:FlxSprite = new FlxSprite(-650, 600).loadGraphic(Paths.image('stagefront'));
		stageFront.setGraphicSize(Std.int(stageFront.width * 1.1));
		stageFront.updateHitbox();
		stageFront.antialiasing = true;
		stageFront.scrollFactor.set(0.9, 0.9);
		stageFront.active = false;
		playState.add(stageFront);


		hole = new FlxSprite(-650, 600);
		hole.loadGraphic(Paths.image('trueform/gfshit', 'mods'), true, 512, 512);
		hole.scrollFactor.set(0.9, 0.9);

		hole.animation.add('shit', getArray(0, 16), 16, true);
		hole.animation.play('shit', true);





	}

	override function getDadTex()
	{
		var tex = Paths.getSparrowAtlas('trueform/GF', 'mods');
		dad.frames = tex;
	}

	private override function createDadAnimations()
	{
		var animation = dad.animation;
		animation.addByPrefix('cheer', 'GF Cheer instance 1', 24, false);
		animation.addByPrefix('singLEFT', 'GF left note instance 1', 24, false);
		animation.addByPrefix('singRIGHT', 'GF Right Note instance 1', 24, false);
		animation.addByPrefix('singUP', 'GF Up Note instance 1', 24, false);
		animation.addByPrefix('singDOWN', 'GF Down Note instance 1', 24, false);
		animation.addByIndices('sad', 'gf sad instance 1', [0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12], "", 24, false);
		animation.addByIndices('danceLeft', 'GF Dancing Beat instance 1', [30, 0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14], "", 24, false);
		animation.addByIndices('danceRight', 'GF Dancing Beat instance 1', [15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25, 26, 27, 28, 29], "", 24, false);
		animation.addByPrefix('scared', 'GF FEAR', 24);
		dad.animation = animation;
	}

	// create dad animation offsets
	private override function createDadAnimationOffsets()
	{
		dad.addOffset('cheer');
		dad.addOffset('sad', -2, -2);
		dad.addOffset('danceLeft', 0, -9);
		dad.addOffset("singRIGHT", 0, -20);
		dad.addOffset("singLEFT", 0, -19);
		dad.addOffset("singDOWN", 0, -20);
		dad.addOffset('scared', -2, -17);

		dad.playAnim('danceRight');
		dad.dance();
	}


	// what character should we create
	private override function createCharacters():Void
	{
		createGF();
		createBF();
		createDad();

		gf.scrollFactor.set(0.95, 0.95);

		bf.y -= 50;

		dad.y -= 100;
		dad.x -= 100;


		hole.x = dad.getGraphicMidpoint().x - 275;
		hole.y = dad.getGraphicMidpoint().y - 100;

		hole.setGraphicSize(Std.int(hole.width * 1.25));

		playState.add(gf);
		playState.add(dad);
		playState.add(hole);

			
		dad.y -= 100;
		hole.y -= 225;




		playState.add(bf);

		gf.alpha = 0;
        dad.scrollFactor.set(0.95, 0.95);
	}




}