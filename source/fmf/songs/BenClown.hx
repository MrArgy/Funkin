package fmf.songs;

import fmf.songs.Clown;
import flixel.system.FlxSound;
import flixel.text.FlxText;
import flixel.util.FlxColor;
import flixel.FlxG;
import flixel.FlxSprite;
import MenuCharacter.CharacterSetting;
import fmf.characters.*;

class BenClown extends  Clown
{

	public var BenTrickyLinesSing:Array<String> = ["REALITY", "FAKE", "TIME MACHINE???", "TO THE MOON", "BORN TO DIE!!!", "BLACK HOLE", "STUCK IN TIME", "WHAT'S TIME IS IT?", "WHERE AM I??"];


	public override function createText(x:Float, y:Float)
	{
		var text:String = BenTrickyLinesSing[FlxG.random.int(0, BenTrickyLinesSing.length - 1)];
		createSpookyText(text, x, y);
	}
			
}