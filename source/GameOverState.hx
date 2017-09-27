package;

import flixel.FlxG;
import flixel.FlxObject;
import flixel.FlxState;
import flixel.group.FlxGroup;
import flixel.util.FlxSpriteUtil;
import flixel.FlxSprite;
import flixel.util.FlxColor;
import flixel.system.FlxAssets.FlxGraphicAsset;

class GameOverState extends FlxState
{

	private var gameOver:GameOver;
	
	override public function create() : Void {
		super.create();
		
		var gameOver = new GameOver( 0, 0);
	 
		add(gameOver);
		
	}
	
}