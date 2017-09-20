package;

import flixel.FlxG;
import flixel.FlxSprite;
import flixel.util.FlxColor;
import flixel.system.FlxAssets.FlxGraphicAsset;

class Player extends FlxSprite {
	private var _xSpeed : Float = 100;
	private var _ySpeed : Float = 100;

	public function new( ?x: Float = 0, ?y: Float = 0 ) {
		super( x, y );
		makeGraphic( 64, 64, FlxColor.RED );
	}

	public function movement() : Float {
		if ( FlxG.keys.anyPressed([ LEFT, A ])) {
			velocity.x = -_xSpeed;
		} else if ( FlxG.keys.anyPressed([ RIGHT, D ])) {
			velocity.x = _xSpeed;
		} else {
			velocity.x = 0;
		}

		return _ySpeed;
	}

	override public function update( elapsed : Float ) : Void {

		super.update( elapsed );
	}
}