package fmf.songs;

import MenuCharacter.CharacterSetting;
import flixel.FlxSprite;
import fmf.characters.*;

class PlayableCharacter extends Character
{

	public function getTex():Void
	{
		var tex = Paths.getSparrowAtlas('characters/BoyFriend_Assets');
		frames = tex;
	}

	// create animation for BF
	public function createAnimations():Void
	{
		animation.addByPrefix('idle', 'BF idle dance', 24, false);
		animation.addByPrefix('singUP', 'BF NOTE UP0', 24, false);
		animation.addByPrefix('singLEFT', 'BF NOTE LEFT0', 24, false);
		animation.addByPrefix('singRIGHT', 'BF NOTE RIGHT0', 24, false);
		animation.addByPrefix('singDOWN', 'BF NOTE DOWN0', 24, false);
		animation.addByPrefix('singUPmiss', 'BF NOTE UP MISS', 24, false);
		animation.addByPrefix('singLEFTmiss', 'BF NOTE LEFT MISS', 24, false);
		animation.addByPrefix('singRIGHTmiss', 'BF NOTE RIGHT MISS', 24, false);
		animation.addByPrefix('singDOWNmiss', 'BF NOTE DOWN MISS', 24, false);
		animation.addByPrefix('hey', 'BF HEY', 24, false);
		animation.addByPrefix('scared', 'BF idle shaking', 24);
	}

	// create animation offset for BF
	public function createAnimationOffsets():Void
	{
		addOffset('idle', -5);
		addOffset("singUP", -39, 26);
		addOffset("singRIGHT", -18, -7);
		addOffset("singLEFT", -28, 6);
		addOffset("singDOWN", -20, -50);

		addOffset("singUPmiss", -43, 28);
		addOffset("singRIGHTmiss", -20, 16);
		addOffset("singLEFTmiss", -22, -17);
		addOffset("singDOWNmiss", -15, -23);
		addOffset("hey", -3, 4);
		addOffset('scared', -4);

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

	// create BF
	public function createCharacter():Void
	{
		getTex();
		createAnimations();
		createAnimationOffsets();
	}
}