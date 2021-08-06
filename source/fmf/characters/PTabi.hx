package fmf.characters;

import fmf.songs.PlayableCharacter;
import flixel.FlxG;
import flixel.FlxSprite;
import flixel.graphics.frames.FlxAtlasFrames;
import flixel.util.FlxTimer;

using StringTools;

class PTabi extends Boyfriend
{
	
	public override function getTex():Void
	{
		var tex = Paths.getSparrowAtlas('tabi/TABI', 'mods');
		frames = tex;
	}

	// create animation for BF
	public override function createAnimations():Void
	{
		animation.addByPrefix('idle', 'Dad idle dance', 24, false);
		animation.addByPrefix('singUP', 'Dad Sing Note UP0', 24, false);
		animation.addByPrefix('singRIGHT', 'Dad Sing Note LEFT0', 24, false);
		animation.addByPrefix('singLEFT', 'Dad Sing Note RIGHT0', 24, false);
		animation.addByPrefix('singDOWN', 'Dad Sing Note DOWN0', 24, false);

		animation.addByPrefix('singUPmiss', 'Dad Sing Note UP MISS', 1, false);
		animation.addByPrefix('singLEFTmiss', 'Dad Sing Note LEFT MISS', 1, false);
		animation.addByPrefix('singRIGHTmiss', 'Dad Sing Note RIGHT MISS', 1, false);
		animation.addByPrefix('singDOWNmiss', 'Dad Sing Note DOWN MISS', 1, false);
	}

	// create animation offset for BF
	public override function createAnimationOffsets():Void
	{
	
		addOffset('idle', 2, -14);

		addOffset("singUP", 32, -19);
		addOffset("singRIGHT", -4, -13);
		addOffset("singLEFT", 60, -19);
		addOffset("singDOWN", -30, -25);
		
		addOffset("singUPmiss", 32, -19);
		addOffset("singRIGHTmiss", -4, -13);
		addOffset("singLEFTmiss", 60, -19);
		addOffset("singDOWNmiss", -30, -25);

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
