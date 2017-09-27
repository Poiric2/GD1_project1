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

class Winner extends FlxSprite
{

	public function new(?x: Float = 0, ?y: Float = 0) 
	{
		super(x, y);
		
		var image = Assets.getBitmapData("assets/images/Win screen.png");
		loadGraphic(image, true, 480, 640);
		
		var winner = Assets.getMusic("assets/music/gameOver.ogg");
		FlxG.sound.play(winner);
	}
	
}