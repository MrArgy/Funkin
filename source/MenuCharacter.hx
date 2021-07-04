package;

import flixel.FlxSprite;
import flixel.graphics.frames.FlxAtlasFrames;

class CharacterSetting
{
	public var x(default, null):Int;
	public var y(default, null):Int;
	public var scale(default, null):Float;
	public var flipped(default, null):Bool;

	public function new(x:Int = 0, y:Int = 0, scale:Float = 1.0, flipped:Bool = false)
	{
		this.x = x;
		this.y = y;
		this.scale = scale;
		this.flipped = flipped;
	}
}

class MenuCharacter extends FlxSprite
{
	public var flipped:Bool = false;

	public function new(x:Int, y:Int, scale:Float, flipped:Bool)
	{
		super(x, y);
		this.flipped = flipped;

		antialiasing = true;


		// animation.addByPrefix('bf', "BF idle dance white", 24);
		// animation.addByPrefix('bfConfirm', 'BF HEY!!', 24, false);
		// animation.addByPrefix('gf', "GF Dancing Beat WHITE", 24);
		// animation.addByPrefix('dad', "Dad idle dance BLACK LINE", 24);
		// animation.addByPrefix('spooky', "spooky dance idle BLACK LINES", 24);
		// animation.addByPrefix('pico', "Pico Idle Dance", 24);
		// animation.addByPrefix('mom', "Mom Idle BLACK LINES", 24);
		// animation.addByPrefix('parents-christmas', "Parent Christmas Idle", 24);
		// animation.addByPrefix('senpai', "SENPAI idle Black Lines", 24);

	}


}
