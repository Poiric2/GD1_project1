package;

import flixel.FlxG;
import flixel.FlxSprite;
import flixel.util.FlxColor;

class Obstacle extends FlxSprite {
	private var _distanceScalingFactor : Float;

	public function new( ?x : Float = 0, ?y : Float = 0 ) {
		super( x, y );
		loadGraphic( "assets/images/ButtonObstacle.png", false );
	}

	public function movement( playerSpeed : Float ) : Bool {
		velocity.y = playerSpeed;

		// Return true if offscreen
		if ( y > FlxG.height ) {
			return true;
		}
		return false;
	}

	override public function update( elapsed : Float ) : Void {

		// TODO: Change sprite scale based on distance from horizon

		super.update( elapsed );
	}
}