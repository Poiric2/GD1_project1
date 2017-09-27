package;

import flixel.FlxG;
import flixel.FlxSprite;
import flixel.math.FlxPoint;
import flixel.FlxObject;
import openfl.display.Bitmap;
import openfl.display.Sprite;
import openfl.Assets;
import flixel.system.FlxSound;
import openfl.media.Sound;

class GameOver extends FlxSprite
{

	public function new(?x: Float = 0, ?y: Float = 0) 
	{
		super(x, y);
		
		var image = Assets.getBitmapData("assets/images/Game over.png");
		loadGraphic(image, true, 480, 640);
		
		var gameOver = Assets.getMusic("assets/music/gameOver.ogg");
		FlxG.sound.play(gameOver);
	}
	
}