package fmf.songs;

import flixel.util.FlxColor;
import flixel.FlxG;
import flixel.FlxSprite;
import MenuCharacter.CharacterSetting;
import fmf.characters.*;

class GarcelloDead extends Garcello
{

    override function getDadTex()
	{
		var tex = Paths.getSparrowAtlas('garcello/garcello_tired', 'mods');
		dad.frames = tex;
	}

	override function createDadAnimations():Void
	{
		var animation = dad.animation;
		animation.addByPrefix('idle', 'Garcellotired idle dance', 18, false);
		animation.addByPrefix('cough', 'Garcellotired cough', 24, false);
		animation.addByPrefix('singUP', 'Garcellotired Sing Note UP', 24, false);
		animation.addByPrefix('singRIGHT', 'Garcellotired Sing Note RIGHT', 24, false);
		animation.addByPrefix('singLEFT', 'Garcellotired Sing Note LEFT', 24, false);
		animation.addByPrefix('singDOWN', 'Garcellotired Sing Note DOWN', 24, false);

		animation.addByPrefix('singUP-alt', 'Garcellotired Sing Note UP', 24, false);
		animation.addByPrefix('singRIGHT-alt', 'Garcellotired Sing Note RIGHT', 24, false);
		animation.addByPrefix('singLEFT-alt', 'Garcellotired Sing Note LEFT', 24, false);
		animation.addByPrefix('singDOWN-alt', 'Garcellotired Sing Note DOWN', 24, false);

		dad.animation = animation;
	}

	override function createDadAnimationOffsets():Void
	{
		dad.addOffset('idle',-2, -38);
		dad.addOffset('singUP', -4, -38);
		dad.addOffset('singRIGHT', -10 , -38);
		dad.addOffset('singLEFT',33, -41);
		dad.addOffset('singDOWN', -11, -42);

		dad.addOffset('singUP-alt', -4, -38);
		dad.addOffset('singRIGHT-alt', -10 , -38);
		dad.addOffset('singLEFT-alt',33, -41);
		dad.addOffset('singDOWN-alt', -11, -42);
		dad.dance();
	}

	public override function getDadIcon(icon:HealthIcon)
	{
		icon.loadGraphic(Paths.image('iconGrid'), true, 150, 150);
		icon.animation.add('dad', [44, 45], 0, false, false);
		icon.animation.play("dad");
	}

}