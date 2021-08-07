package fmf.characters;

import fmf.songs.PlayableCharacter;
import flixel.FlxG;
import flixel.FlxSprite;
import flixel.graphics.frames.FlxAtlasFrames;
import flixel.util.FlxTimer;

using StringTools;

class Miku extends Boyfriend
{
	
	public override function getTex():Void
	{
		var tex = Paths.getSparrowAtlas('pc/miku/miku', 'mods');
		frames = tex;
	}

	// create animation for BF
	public override function createAnimations():Void
	
	{
		animation.addByPrefix('idle', 'BF idle dance', 24, false);
		animation.addByPrefix('singUP', 'BF NOTE UP0', 24, false);
		animation.addByPrefix('singLEFT', 'BF NOTE LEFT0', 24, false);
		animation.addByPrefix('singRIGHT', 'BF NOTE RIGHT0', 24, false);
		animation.addByPrefix('singDOWN', 'BF NOTE DOWN0', 24, false);


		animation.addByPrefix('singUPmiss', 'BF NOTE UP MISS', 48, false);
		animation.addByPrefix('singLEFTmiss', 'BF NOTE LEFT MISS', 48, false);
		animation.addByPrefix('singRIGHTmiss', 'BF NOTE RIGHT MISS', 48, false);
		animation.addByPrefix('singDOWNmiss', 'BF NOTE DOWN MISS', 48, false);
		animation.addByPrefix('hey', 'BF HEY', 24, false);
		animation.addByPrefix('scared', 'BF idle shaking', 24);
	}

	// create animation offset for BF
	public override function createAnimationOffsets():Void
	{
		addOffset('idle', -5, -2);
		addOffset("singUP", -19, -1);
		addOffset("singRIGHT", 32, -1);
		addOffset("singLEFT", -30, 0);
		addOffset("singDOWN", 17, 1);

		addOffset("singUPmiss", -16, 1);
		addOffset("singRIGHTmiss", 31, -1);
		addOffset("singLEFTmiss", 17, 0);
		addOffset("singDOWNmiss", 15, 2);
		addOffset("hey", 4, 0);
		addOffset('scared', -4, -1);

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
