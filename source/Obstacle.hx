package;

import flixel.FlxSprite;
import flixel.util.FlxColor;

class Obstacle extends FlxSprite {
    public function new( ?x : Float = 0, ?y : Float = 0 ) {
        super( x, y );
        makeGraphic( 32, 32, FlxColor.BLUE );
    }

    public function movement( playerSpeed : Float ) : Void {
        velocity.y = playerSpeed;
    }

    override public function update( elapsed : Float ) : Void {

        super.update( elapsed );
    }
}