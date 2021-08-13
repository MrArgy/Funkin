package;

import flixel.text.FlxText;
import flixel.FlxG;
import flixel.FlxSprite;
import flixel.graphics.frames.FlxAtlasFrames;
import flixel.group.FlxSpriteGroup;
import flixel.math.FlxMath;
import flixel.util.FlxColor;

class PcItem extends Item
{
	
	override function getItemData():ItemData
	{
		return PcManager.pcList[id];
	}

	override function getUnlockedTime():Int
	{
		return SelectionState.pcData[id];
	}

	override function isSelected():Bool
	{
		return FlxG.save.data.pcId == id;
	}

	override function getFolder():String
	{
		return "characters";
	}

	override function unlock()
	{
		var skinData = SelectionState.skinData;
		skinData[id] ++;

		FlxG.save.data.skinData = skinData;
	}
}
