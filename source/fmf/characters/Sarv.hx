package fmf.characters;

import fmf.songs.PlayableCharacter;
import flixel.FlxG;
import flixel.FlxSprite;
import flixel.graphics.frames.FlxAtlasFrames;
import flixel.util.FlxTimer;

using StringTools;

class Sarv extends Boyfriend
{
	
	public override function getTex():Void
	{
		var tex = Paths.getSparrowAtlas('pc/sarv/sarv', 'mods');
		frames = tex;
	}

	// create animation for BF
	public override function createAnimations():Void
	{
		animation.addByPrefix('idle', 'BF idle dance', 24, false);
		animation.addByPrefix('singUP', 'BF NOTE UP0', 24, false);
		animation.addByPrefix('singRIGHT', 'BF NOTE LEFT0', 24, false);
		animation.addByPrefix('singLEFT', 'BF NOTE RIGHT0', 24, false);
		animation.addByPrefix('singDOWN', 'BF NOTE DOWN0', 24, false);

		
		animation.addByPrefix('singUPmiss', 'BF NOTE UP miss', 1, false);
		animation.addByPrefix('singLEFTmiss', 'BF NOTE LEFT miss', 1, false);
		animation.addByPrefix('singRIGHTmiss', 'BF NOTE RIGHT miss', 1, false);
		animation.addByPrefix('singDOWNmiss', 'BF NOTE DOWN miss', 1, false);

	}

	// create animation offset for BF
	public override function createAnimationOffsets():Void
	{
		addOffset('idle', -6, 0);
		addOffset("singUP", 54, 0);
		addOffset("singRIGHT", -61, 0);
		addOffset("singLEFT", 1, 0);
		addOffset("singDOWN", -87, 0);

		addOffset("singUPmiss", 32, 0);
		addOffset("singRIGHTmiss", -8, 0);
		addOffset("singLEFTmiss", -82, 0);
		addOffset("singDOWNmiss", -113, 0);

		playAnim('idle');
		flipX = true;

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
