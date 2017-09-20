package;

import flixel.FlxG;
import flixel.FlxObject;
import flixel.FlxState;
import flixel.group.FlxGroup;
import flixel.util.FlxSpriteUtil;

class PlayState extends FlxState {
	private var _player : Player;

	private var _testObstacle : Obstacle;
	private var _obstacles = new Array();
	// TODO: Real poolsize
	private var _obstacleGroup = new FlxTypedGroup< Obstacle >( 25 );

	override public function create() : Void {
		super.create();

		_player = new Player( 280, 400 );
		add( _player );

		add( _obstacleGroup );

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
				_obstacleGroup.remove( o );
				_obstacles.remove( o );
				continue;
			}
			o.update( elapsed );
		}

		FlxG.overlap( _player, _obstacleGroup, obstacleCollision );
	}

	private function addObstacle() : Void {
		var x : Float = FlxG.random.int( 0, 400 );
		var o = new Obstacle( x, 0 );
		_obstacleGroup.add( o );
		_obstacles.push( o );
	}

	private function obstacleCollision( first : FlxObject, second : FlxObject ) : Void {

		// DEBUG: Kill the player when they hit an obstacle
		remove( _player );
	}
}