package;

import flixel.FlxSprite;
import flixel.util.FlxColor;

class Obstacle extends FlxSprite {
	private var _distanceScalingFactor : Float;

	public function new( ?x : Float = 0, ?y : Float = 0 ) {
		super( x, y );
		makeGraphic( 32, 32, FlxColor.BLUE );
	}

	public function movement( playerSpeed : Float ) : Bool {
		velocity.y = playerSpeed;

		// TODO: Return true if offscreen
		return false;
	}

	override public function update( elapsed : Float ) : Void {

		// TODO: Change sprite scale based on distance from horizon

		super.update( elapsed );
	}
}