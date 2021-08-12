package;

import flixel.text.FlxText;
import flixel.FlxG;
import flixel.FlxSprite;
import flixel.graphics.frames.FlxAtlasFrames;
import flixel.group.FlxSpriteGroup;
import flixel.math.FlxMath;
import flixel.util.FlxColor;

class CharacterSelectionItem extends FlxSpriteGroup
{
	public var targetX:Float = 0;
	public var character:FlxSprite;
	public var flashingInt:Int = 0;


	public var unlockText:FlxText;
	public var selectedText:FlxText;


	public function new(x:Float, y:Float, option:String)
	{
		super(x, y);
		character = new FlxSprite().loadGraphic(Paths.image('inventory/characters/' + option.toLowerCase()));
		character.y -= 200;
		character.setGraphicSize(Std.int(0.5 * character.width));
		add(character);
	}

	private var isFlashing:Bool = false;

	public function startFlashing():Void
	{
		isFlashing = true;
	}

	// if it runs at 60fps, fake framerate will be 6
	// if it runs at 144 fps, fake framerate will be like 14, and will update the graphic every 0.016666 * 3 seconds still???
	// so it runs basically every so many seconds, not dependant on framerate??
	// I'm still learning how math works thanks whoever is reading this lol
	var fakeFramerate:Int = Math.round((1 / FlxG.elapsed) / 10);

	override function update(elapsed:Float)
	{
		super.update(elapsed);
		x = FlxMath.lerp(x, (targetX * 250) + 480, 0.17 * (60 / FlxG.save.data.fpsCap));

		if (isFlashing)
			flashingInt += 1;
	
		if (flashingInt % fakeFramerate >= Math.floor(fakeFramerate / 2))
			character.color = 0xFF33ffff;
		else if (FlxG.save.data.flashing)
			character.color = FlxColor.WHITE;
	}
}
