package;

import flixel.text.FlxText;
import flixel.FlxG;
import flixel.FlxSprite;
import flixel.graphics.frames.FlxAtlasFrames;
import flixel.group.FlxSpriteGroup;
import flixel.math.FlxMath;
import flixel.util.FlxColor;

class VfxItem extends Item
{

	override function getItemData():ItemData
	{
		return VfxManager.vfxList[id];
	}

	override function getUnlockedTime():Int
	{
		return SelectionState.vfxData[id];
	}

	override function isSelected():Bool
	{
		return FlxG.save.data.vfxId == id;
	}

	override function getFolder():String
	{
		return "effects";
	}

	override function unlock()
	{
		var vfxData = SelectionState.vfxData;
		vfxData[id]++;

		FlxG.save.data.vfxData = vfxData;
	}

	override function createItemReview()
	{
		itemReview = new FlxSprite().loadGraphic(Paths.image('configuration/' + getFolder() + '/' + getItemData().name));
		itemReview.y -= 250;
		itemReview.x -= 100;

		itemReview.setGraphicSize(Std.int(0.5 * itemReview.width));
		itemReview.antialiasing = true;

		add(itemReview);
	}
		


}
