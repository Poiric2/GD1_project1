package;

import flixel.FlxG;
import flixel.FlxSprite;

class Vaccuum extends FlxSprite {
    public function new( ?x: Float = 24, ?y: Float = 536 ) {
        super( x, y );
        loadGraphic( "assets/images/VaccumSheet.png", true, 432, 104 );
        animation.add( "running", [ 0, 1, 2, 3 ], 6, true );
		animation.play("running");

    }



	override public function update( elapsed : Float ) : Void {

		super.update( elapsed );
	}
	
	//public function collected() : Void {
	//	remove(this);
	//}
}