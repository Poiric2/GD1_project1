package;

import flixel.FlxG;
import flixel.FlxSprite;

class SmolBunny extends FlxSprite {
    public function new( ?x: Float = 0, ?y: Float = 0 ) {
        super( x, y );
        loadGraphic( "assets/images/DustBunnySheet.png", true, 95, 126 );
        scale.set( 0.5, 0.5 );
        updateHitbox();
        animation.add( "forward", [ 0, 1, 2 ], 4, true );
        animation.play( "forward" );
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

		super.update( elapsed );
	}
}