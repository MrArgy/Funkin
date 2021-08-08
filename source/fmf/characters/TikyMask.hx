package fmf.characters;

import fmf.songs.Clown;
import flixel.util.FlxColor;
import flixel.addons.effects.FlxTrail;
import fmf.songs.PlayableCharacter;
import flixel.FlxG;
import flixel.FlxSprite;
import flixel.graphics.frames.FlxAtlasFrames;
import flixel.util.FlxTimer;

using StringTools;

class TikyMask extends Boyfriend
{

	public var clown:Clown;

	public override function getTex():Void
	{
		var tex = Paths.getSparrowAtlas('clown/tikymask', 'mods');
		var tex2 = Paths.getSparrowAtlas('clown/tikymask_miss', 'mods');

		for (frame in tex2.frames){
			tex.pushFrame(frame);
		}
		frames = tex;
	}

	override function midSongStepUpdate()
	{
		clown.midSongStepUpdate();
	}

	override function update(elapsed:Float)
	{
		super.update(elapsed);
		clown.update(elapsed);	
	}

	override function noteEventBF(noteData:Note)
	{
		clown.noteEvent(noteData, x - 200, y);
	}

	// create animation for BF
	public override function createAnimations():Void
	{
		animation.addByPrefix('idle', 'Idle instance 1', 24, false);

		animation.addByPrefix('singUP', 'Sing Up instance 10', 24, false);
		animation.addByPrefix('singRIGHT', 'Sing Right instance 10', 24, false);
		animation.addByPrefix('singLEFT', 'Sing Left instance 10', 24, false);
		animation.addByPrefix('singDOWN', 'Sing Down instance 10', 24, false);

		animation.addByPrefix('singUPmiss', 'Sing Up instance MISS', 1, false);
		animation.addByPrefix('singRIGHTmiss', 'Sing Right instance MISS', 1, false);
		animation.addByPrefix('singLEFTmiss', 'Sing Left instance MISS', 1, false);
		animation.addByPrefix('singDOWNmiss', 'Sing Down instance MISS', 1, false);
	}

	// create animation offset for BF
	public override function createAnimationOffsets():Void
	{
	
		flipX = true;

		addOffset('idle', 0, 0);
		addOffset('singUP', -64	, 17);
		addOffset('singRIGHT', 212, -48); 
		addOffset('singLEFT', -10, 25);
		addOffset('singDOWN', 67, -35);

		addOffset('singUPmiss', -64, 17);
		addOffset('singRIGHTmiss', 212, -65); 
		addOffset('singLEFTmiss', -10, 15);
		addOffset('singDOWNmiss', 60, -45);

		playAnim('idle');

		clown = new Clown();
		clown.createStaticBG();
		
		// i dunno why i should do this, LOl
	
	}


	
}
