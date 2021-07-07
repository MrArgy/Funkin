package fmf.characters;

import fmf.songs.PlayableCharacter;
import flixel.FlxG;
import flixel.FlxSprite;
import flixel.graphics.frames.FlxAtlasFrames;
import flixel.util.FlxTimer;

using StringTools;

class Pico extends Boyfriend
{
	
	public override function getTex():Void
	{
		var tex = Paths.getSparrowAtlas('pc/pico/pico', 'mods');
		frames = tex;
	}

	// create animation for BF
	public override function createAnimations():Void
	{
		animation.addByPrefix('idle', 'Pico Idle Dance', 24, false);//

		animation.addByPrefix('singUP', 'pico Up note0', 24, false);//
		animation.addByPrefix('singLEFT', 'Pico NOTE LEFT0', 24, false);//
		animation.addByPrefix('singRIGHT', 'Pico Note Right0', 24, false);//
		animation.addByPrefix('singDOWN', 'Pico Down Note0', 24, false);//

		animation.addByPrefix('singUPmiss', 'pico Up note miss', 24, false);//
		animation.addByPrefix('singLEFTmiss', 'Pico NOTE LEFT miss', 24, false);//
		animation.addByPrefix('singRIGHTmiss', 'Pico Note Right Miss', 24, false);//
		animation.addByPrefix('singDOWNmiss', 'Pico Down Note MISS', 24, false);//
	
		animation.addByPrefix('hey', 'Pico Idle Dance', 24, false);
		animation.addByPrefix('scared', 'Pico Idle Dance', 24);
	}

	// create animation offset for BF
	public override function createAnimationOffsets():Void
	{
		addOffset('idle', -5, -2);
		addOffset("singUP", 4, 16);
		addOffset("singRIGHT", 76, -15);
		addOffset("singLEFT", -55, -5);
		addOffset("singDOWN", 102, -88);

		addOffset("singUPmiss", 8, 49);
		addOffset("singRIGHTmiss", 73, 17);
		addOffset("singLEFTmiss", -56, 42);
		addOffset("singDOWNmiss", 95, -48);
		addOffset("hey", -5, -2);
		addOffset('scared', -5, -2);

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
