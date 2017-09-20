package;

import flixel.FlxState;
import flixel.util.FlxSpriteUtil;

class PlayState extends FlxState {
	private var _player : Player;

	private var _testObstacle : Obstacle;

	override public function create() : Void {
		super.create();

		_player = new Player( 280, 400 );
		add( _player );

		_testObstacle = new Obstacle( 0, 0 );
		add( _testObstacle );
	}

	override public function update( elapsed : Float ) : Void	{
		super.update( elapsed );

		var playerSpeed = _player.movement();
		_player.update( elapsed );
		_testObstacle.movement( playerSpeed );
		_testObstacle.update( elapsed );
	}
}