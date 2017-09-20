package;

import flixel.FlxG;
import flixel.FlxState;
import flixel.util.FlxSpriteUtil;

class PlayState extends FlxState {
	private var _player : Player;

	private var _testObstacle : Obstacle;
	private var _obstacles = new Array();

	override public function create() : Void {
		super.create();

		_player = new Player( 280, 400 );
		add( _player );

		addObstacle();
		addObstacle();
		addObstacle();
	}

	override public function update( elapsed : Float ) : Void	{
		super.update( elapsed );

		var playerSpeed = _player.movement();
		_player.update( elapsed );

		for ( o in _obstacles ) {

			// Delete obstacle if it's offscreen
			if ( o.movement( playerSpeed )) {
				remove( o );
				_obstacles.remove( o );
				continue;
			}
			o.update( elapsed );
		}
	}

	private function addObstacle() : Void {
		var x : Float = FlxG.random.int( 0, 400 );
		var o = new Obstacle( x, 0 );
		add( o );
		_obstacles.push( o );
	}
}