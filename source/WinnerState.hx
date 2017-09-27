package;

import flixel.FlxG;
import flixel.FlxObject;
import flixel.FlxState;
import flixel.group.FlxGroup;
import flixel.util.FlxSpriteUtil;
import flixel.FlxSprite;
import flixel.util.FlxColor;
import flixel.system.FlxAssets.FlxGraphicAsset;

class WinnerState extends FlxState
{

	
	override public function create() : Void {
		super.create();
		
		var winner = new Winner( 0, 0);
	 
		add(winner);
		
	}
	
}