package fmf.songs;

import MenuCharacter.CharacterSetting;
import flixel.FlxSprite;
import fmf.characters.*;

using StringTools;

class PlayableCharacter extends Character
{
	public var playState(get, never):PlayState;
	public inline function get_playState()
		return PlayState.instance;

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
		animation.addByPrefix('singRIGHT', 'BF NOTE LEFT0', 24, false);
		animation.addByPrefix('singLEFT', 'BF NOTE RIGHT0', 24, false);
		animation.addByPrefix('singDOWN', 'BF NOTE DOWN0', 24, false);
		animation.addByPrefix('singUPmiss', 'BF NOTE UP MISS', 24, false);
		animation.addByPrefix('singLEFTmiss', 'BF NOTE LEFT MISS', 24, false);
		animation.addByPrefix('singRIGHTmiss', 'BF NOTE RIGHT MISS', 24, false);
		animation.addByPrefix('singDOWNmiss', 'BF NOTE DOWN MISS', 24, false);
		animation.addByPrefix('hey', 'BF HEY', 24, false);
		animation.addByPrefix('scared', 'BF idle shaking', 24);
	}


	//note event shit for BF
	public function noteEventBF(noteData:Note){}
	public function noteEventDad(noteData:Note){}
	public function midSongStepUpdate(){}
	public function characterCreatedEvent(){}



	override function update(elapsed:Float)
	{
		if (animation.curAnim.name.startsWith('sing'))
		{
			holdTimer += elapsed;
		}
		else
			holdTimer = 0;

		if (animation.curAnim.name.endsWith('miss') && animation.curAnim.finished && !debugMode)
		{
			playAnim('idle', true, false, 10);
		}

		if (animation.curAnim.name.startsWith('sing'))
		{
			holdTimer += elapsed;
		}
		super.update(elapsed);
	}

	// create animation offset for BF
	public function createAnimationOffsets():Void
	{
		addOffset('idle', -6, -1);
		addOffset("singUP", -56, 30);
		addOffset("singRIGHT", -51, -8);
		addOffset("singLEFT", 1, -7);
		addOffset("singDOWN", -17, -53);

		addOffset("singUPmiss", -48, 29);
		addOffset("singRIGHTmiss", -8, 24);
		addOffset("singLEFTmiss", -48, -18);
		addOffset("singDOWNmiss", -13, -27);
		addOffset("hey", -6, 4);
		addOffset('scared', -7, 0);

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