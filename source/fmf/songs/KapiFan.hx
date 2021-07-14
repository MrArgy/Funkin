package fmf.songs;

import flixel.util.FlxColor;
import flixel.FlxG;
import flixel.FlxSprite;
import MenuCharacter.CharacterSetting;
import fmf.characters.*;

class KapiFan extends Kapi
{

    override function getDadTex()
	{
		var tex = Paths.getSparrowAtlas('kapi/kapifan', 'mods');
		dad.frames = tex;
	}


	override function loadMap()
	{
		var bg:FlxSprite = new FlxSprite(-600, -100).loadGraphic(Paths.image('kapi/fanclub', 'mods'));
		bg.antialiasing = true;
		bg.scrollFactor.set(0.9, 0.9);
		bg.active = false;
		playState.add(bg);
	}

	override function createDadAnimations():Void
	{
		var animation = dad.animation;
		animation.addByPrefix('idle', 'spooky dance idle', 24);
		animation.addByPrefix('singUP', 'spooky UP NOTE', 24);
		animation.addByPrefix('singRIGHT', 'spooky sing right', 24);
		animation.addByPrefix('singDOWN', 'spooky DOWN note', 24);
		animation.addByPrefix('singLEFT', 'note sing left', 24);
		dad.animation = animation;
	}

	override function createDadAnimationOffsets():Void
	{
		dad.addOffset('idle');
		dad.addOffset("singUP", 2, 3);
		dad.addOffset("singRIGHT", 33, -4);
		dad.addOffset("singLEFT", -32, -1);
		dad.addOffset("singDOWN", -100, 2);

		dad.dance();
	}


	override function createCharacters()
	{
		super.createCharacters();

		dad.x += 125;

		gf.y += 75;
		bf.y += 75;
		dad.y += 25;

	}

}