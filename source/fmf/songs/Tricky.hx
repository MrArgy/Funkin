package fmf.songs;

import flixel.util.FlxColor;
import flixel.FlxG;
import flixel.FlxSprite;
import MenuCharacter.CharacterSetting;
import fmf.characters.*;

class Tricky extends TrickyMask
{

    override function getDadTex()
	{
		var tex = Paths.getSparrowAtlas('clown/tricky', 'mods');
		dad.frames = tex;
	}


	override function createDadAnimations():Void
	{
		var animation = dad.animation;
		animation.addByPrefix('idle', 'Idle', 18, false);
		animation.addByPrefix('singUP', 'Sing Up', 24, false);
		animation.addByPrefix('singRIGHT', 'Sing Right', 24, false);
		animation.addByPrefix('singLEFT', 'Sing Left', 24, false);
		animation.addByPrefix('singDOWN', 'Sing Down', 24, false);
		dad.animation = animation;
	}

	override function createDadAnimationOffsets():Void
	{
			
	
		dad.addOffset('idle', -10, 3);
		dad.addOffset('singRIGHT', 0, -71);
		dad.addOffset('singLEFT', 98, -1);
		dad.addOffset('singUP', 52, 7);
		dad.addOffset('singDOWN', 9, -23);

		dad.dance();

		dad.x += 10;
		dad.y -= 4;

		dad.scale.x = 1.5;
		dad.scale.y = 1.5;


	}

	public override function getDadIcon(icon:HealthIcon)
	{
		icon.loadGraphic(Paths.image('iconGrid'), true, 150, 150);
		icon.animation.add('dad', [17, 18], 0, false, false);
		icon.animation.play("dad");
	}

	public override function setDadMenuCharacter(dad:MenuCharacter)
	{
		super.setDadMenuCharacter(dad);

		var frames = Paths.getSparrowAtlas('whitty/whitty', 'mods');
		dad.frames = frames;

		dad.animation.addByPrefix('dad', "Whitty idle dance BLACK LINE", 24);
		dad.animation.play('dad');
		setMenuCharacter(dad, new CharacterSetting(-200, 25, 1));
	}
}