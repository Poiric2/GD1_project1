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

class MenuSprite extends FlxSprite
{

	public function new(?x: Float = 0, ?y: Float = 0) 
	{
		super(x, y);
		
		var image = Assets.getBitmapData("assets/images/Title.png");
		loadGraphic(image, true, 480, 640);
		
		var menu = Assets.getMusic("assets/music/menuSong.ogg");
		FlxG.sound.play(menu);
	}
	
}