package;

import flixel.FlxG;
import flixel.FlxObject;
import flixel.FlxState;
import flixel.group.FlxGroup;
import flixel.util.FlxSpriteUtil;

class PlayState extends FlxState {
	private var _player : Player;

	private var _testObstacle : Obstacle;
	private var _obstacles : Array< Obstacle > = new Array< Obstacle >();

	// TODO: Real poolsize
	private var _obstacleGroup = new FlxTypedGroup< Obstacle >( 25 );

	private var _bunnies : Array< SmolBunny > = new Array< SmolBunny >();
	private var _bunnyGroup = new FlxTypedGroup< SmolBunny >( 25 );

	private var _obstacleInterval : Float = 2;
	private var _obstacleTimer : Float;
	
	private var _bunnyInterval : Float = 3;
	private var _bunnyTimer : Float;

	override public function create() : Void {
		super.create();

		_player = new Player( 280, 400 );
		add( _player );
		// _player.scale.set(.2, .2);
		// _player.updateHitbox();

		add( _obstacleGroup );
		add( _bunnyGroup );

		_obstacleTimer = _obstacleInterval;
		_bunnyTimer = _bunnyInterval;
	}

	override public function update( elapsed : Float ) : Void {
		super.update( elapsed );

		var playerSpeed = _player.movement();
		_player.update( elapsed );

		// Spawn obstacles every interval
		_obstacleTimer -= FlxG.elapsed;
		if ( _obstacleTimer <= 0 ) {
			addObstacle();
			_obstacleTimer = _obstacleInterval;
		}

		// Update existing obstacles
		for ( o in _obstacles ) {

			// Delete obstacle if it's offscreen
			if ( o.movement( playerSpeed )) {
				_obstacleGroup.remove( o );
				_obstacles.remove( o );
				continue;
			}
			o.update( elapsed );
		}

		// Spawn bunnies every interval
		_bunnyTimer -= FlxG.elapsed;
		if ( _bunnyTimer <= 0 ) {
			addBunny();
			_bunnyTimer = _bunnyInterval;
		}

		// Update existing bunnies
		// XXX: This should totally be merged with the above as a helper
		for ( b in _bunnies ) {

			// Delete obstacle if it's offscreen
			if ( b.movement( playerSpeed )) {
				_bunnyGroup.remove( b );
				_bunnies.remove( b );
				continue;
			}
			b.update( elapsed );
		}

		FlxG.overlap( _player, _obstacleGroup, obstacleCollision );
		FlxG.overlap( _player, _bunnyGroup, bunnyCollision );
	}

	private function addObstacle() : Void {
		var x : Float = FlxG.random.int( 0, 400 );
		var o = new Obstacle( x, 0 );
		_obstacleGroup.add( o );
		_obstacles.push( o );
	}

	private function addBunny() : Void {
		var x : Float = FlxG.random.int( 0, 400 );
		var b = new SmolBunny( x, 0 );
		_bunnyGroup.add( b );
		_bunnies.push( b );
	}

	private function obstacleCollision( first : FlxObject, second : FlxObject ) : Void {

		// DEBUG: Kill the player when they hit an obstacle
		remove( _player );
	}

	private function bunnyCollision( first : FlxObject, second : FlxObject ) : Void {

		// TODO: Absorb the bunny, increase size and speed of player
	}
}