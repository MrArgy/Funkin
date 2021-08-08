package fmf.characters;

import flixel.util.FlxColor;
import flixel.addons.effects.FlxTrail;
import fmf.songs.PlayableCharacter;
import flixel.FlxG;
import flixel.FlxSprite;
import flixel.graphics.frames.FlxAtlasFrames;
import flixel.util.FlxTimer;

using StringTools;

class TikyEx extends Boyfriend
{
	public override function getTex():Void
	{
		var tex = Paths.getSparrowAtlas('clown/extiky', 'mods');
		frames = tex;
	}

	// create animation for BF
	public override function createAnimations():Void
	{
		animation.addByPrefix('idle', 'Idle', 18, false);
		animation.addByPrefix('singUP', 'Sing Up0', 24, false);
		animation.addByPrefix('singRIGHT', 'Sing Right0', 24, false);
		animation.addByPrefix('singLEFT', 'Sing Left0', 24, false);
		animation.addByPrefix('singDOWN', 'Sing Down0', 24, false);

		animation.addByPrefix('singUPmiss', 'Sing Up MISS', 1, false);
		animation.addByPrefix('singRIGHTmiss', 'Sing Right MISS', 1, false);
		animation.addByPrefix('singLEFTmiss', 'Sing Left MISS', 1, false);
		animation.addByPrefix('singDOWNmiss', 'Sing Down MISS', 1, false);
	}

	// create animation offset for BF
	public override function createAnimationOffsets():Void
	{
	
		addOffset('idle', 0, 0);
		addOffset('singUP', 0, 0);
		addOffset('singRIGHT', 0, 0); 
		addOffset('singLEFT', 0, 0);
		addOffset('singDOWN', 0, 0);


		addOffset('singUPmiss', 0, 0);
		addOffset('singRIGHTmiss', 0, 0); 
		addOffset('singLEFTmiss', 0, 0);
		addOffset('singDOWNmiss', 0, 0);

		playAnim('idle');
		flipX = false;


		this.scale.x = 1.5;
		this.scale.y = 1.5;

		// i dunno why i should do this, LOl
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
