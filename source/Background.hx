package;

import flixel.FlxSprite;

class Background extends FlxSprite {
    public function new( ?x : Float = 0, ?y : Float = 0 ) {
        super( x, y );
        loadGraphic( "assets/images/BackgroundSheet.png", true, 480, 600 );
        scale.set( 1, 1.133 );
        animation.add( "go", [ 0, 1, 2, 3, 4, 5 ], 4, true );
        animation.play( "go" );
    }

    override public function update( elpaso : Float ) : Void {

        super.update( elpaso );
    }
	
	public function movement( playerSpeed : Float ):Void
	{
		var newRate:Float = playerSpeed / 30;
		var newInt:Int = Std.int(newRate);
		animation.getByName("go").frameRate = newInt;
	}
}