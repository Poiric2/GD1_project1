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


class  Cutscene extends FlxSprite
{
	private var _sceneInterval : Float = 2;
	private var _sceneTimer : Float;
	private var loc: Int;
	
	
	var images = new Array();
	var sounds = new Array();
	
	public function new(?x: Float = 0, ?y: Float = 0, loc:Int = 0 ) {
		super(x, y);
		this.loc = loc;

        var image = Assets.getBitmapData("assets/images/f00.png");
		images.push(image);
		image = Assets.getBitmapData("assets/images/f01.png");
		images.push(image);
		image = Assets.getBitmapData("assets/images/f02.png");
		images.push(image);
		image = Assets.getBitmapData("assets/images/f03.png");
		images.push(image);
		image = Assets.getBitmapData("assets/images/005.png");
		images.push(image);		
        
		loadGraphic(images[loc], true, 480, 640);
		
		
		var woosh = Assets.getMusic("assets/music/cutsceneWoosh.ogg");
		sounds.push(woosh);
		var woosh = Assets.getMusic("assets/music/cutsceneWoosh.ogg");
		sounds.push(woosh);
		var woosh = Assets.getMusic("assets/music/cutsceneWoosh.ogg");
		sounds.push(woosh);
		var vaccum= Assets.getMusic("assets/music/vaccumTurnOn.ogg");
		sounds.push(vaccum);
		var run = Assets.getMusic("assets/music/cutsceneRun.ogg");
		sounds.push(run);
		FlxG.sound.play(sounds[loc]);
		
	}
	
	override public function update( elapsed : Float ) : Void {

		super.update( elapsed );
	}
	
}