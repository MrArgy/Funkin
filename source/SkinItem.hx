package;

import flixel.text.FlxText;
import flixel.FlxG;
import flixel.FlxSprite;
import flixel.graphics.frames.FlxAtlasFrames;
import flixel.group.FlxSpriteGroup;
import flixel.math.FlxMath;
import flixel.util.FlxColor;

class SkinItem extends Item
{
	
	override function getItemData():ItemData
	{
		return SkinManager.skinList[id];
	}

	override function getUnlockedTime():Int
	{
		return SelectionState.skinData[id];
	}

	override function isSelected():Bool
	{
		return FlxG.save.data.skinId == id;
	}

	override function getFolder():String
	{
		return "arrows";
	}

	override function createItemReview()
	{
		itemReview = new FlxSprite().loadGraphic(Paths.image('configuration/' + getFolder() + '/' + getItemData().name));
		itemReview.y -= 100;
		itemReview.x -= 75;
		itemReview.setGraphicSize(Std.int(0.35 * itemReview.width));
		itemReview.antialiasing = true;

		add(itemReview);
	}

	override function unlock()
	{
		var skinData = SelectionState.skinData;
		skinData[id]++;

		FlxG.save.data.skinData = skinData;
	}	

}
