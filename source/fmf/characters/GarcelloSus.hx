package fmf.characters;

import flixel.util.FlxColor;
import flixel.addons.effects.FlxTrail;
import fmf.songs.PlayableCharacter;
import flixel.FlxG;
import flixel.FlxSprite;
import flixel.graphics.frames.FlxAtlasFrames;
import flixel.util.FlxTimer;

using StringTools;

class GarcelloSus extends Boyfriend
{

	public override function getTex():Void
	{
		var tex = Paths.getSparrowAtlas('garcello/garcello', 'mods');
		frames = tex;
	}

	// create animation for BF
	public override function createAnimations():Void
	{
		animation.addByPrefix('idle', 'Garcello idle', 24, false);
		animation.addByPrefix('singUP', 'Garcello Sing Note UP0', 24, false);
		animation.addByPrefix('singRIGHT', 'Garcello Sing Note RIGHT0', 24, false);
		animation.addByPrefix('singLEFT', 'Garcello Sing Note LEFT0', 24, false);
		animation.addByPrefix('singDOWN', 'Garcello Sing Note DOWN0', 24, false);

		animation.addByPrefix('singUPmiss', 'Garcello Sing Note UP MISS', 1, false);
		animation.addByPrefix('singLEFTmiss', 'Garcello Sing Note LEFT MISS', 1, false);
		animation.addByPrefix('singRIGHTmiss', 'Garcello Sing Note RIGHT MISS', 1, false);
		animation.addByPrefix('singDOWNmiss', 'Garcello Sing Note DOWN MISS', 1, false);
	}

	// create animation offset for BF
	public override function createAnimationOffsets():Void
	{
	

		addOffset('idle',-2, -38);
		addOffset('singUP', -4, -38);
		addOffset('singRIGHT', -10 , -38);
		addOffset('singLEFT',33, -41);
		addOffset('singDOWN', -11, -42);
		
		addOffset('singUPmiss', -4, -38);
		addOffset('singRIGHTmiss', -10 , -38);
		addOffset('singLEFTmiss',33, -41);
		addOffset('singDOWNmiss', -11, -42);


		playAnim('idle');
		flipX = false;

		// i dunno why i should do this, LOl
		dance();
		flipX = !flipX;

		// Doesn't flip for BF, since his are already in the right place???		{
		var oldRight = animation.getByName('singRIGHT').frames;
		animation.getByName('singRIGHT').frames = animation.getByName('singLEFT').frames;
		animation.getByName('singLEFT').frames = oldRight;

		// IF THEY HAVE MISS ANIMATIONS??
		if (animation.getByName('singRIGHTmiss') != null)
		{
			var oldMiss = animation.getByName('singRIGHTmiss').frames;
			animation.getByName('singRIGHTmiss').frames = animation.getByName('singLEFTmiss').frames;
			animation.getByName('singLEFTmiss').frames = oldMiss;
		}
	}	

	
}
