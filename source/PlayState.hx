package;

import flixel.FlxG;
import flixel.FlxObject;
import flixel.FlxState;
import flixel.group.FlxGroup;
import flixel.util.FlxSpriteUtil;
import openfl.Assets;
import flixel.system.FlxSound;
import openfl.media.Sound;

class PlayState extends FlxState {
	private var _background : Background;
	private var _player : Player;
	private var _vaccuum : Vaccuum;

	private var _testObstacle : Obstacle;
	private var _obstacles : Array< Obstacle > = new Array< Obstacle >();

	// TODO: Real poolsize
	private var _obstacleGroup = new FlxTypedGroup< Obstacle >( 25 );

	private var _bunnies : Array< SmolBunny > = new Array< SmolBunny >();
	private var _bunnyGroup = new FlxTypedGroup< SmolBunny >( 25 );

	private var _obstacleInterval : Float = 2;
	private var _obstacleTimer : Float;
	
	private var _invulnFrames : Float = .06;
	private var _invulnTimer : Float;
	private var _canHit : Bool = true;
	
	private var _bunnyInterval : Float = 3;
	private var _bunnyTimer : Float;
	private var _bunnySize : Float = 1;
	
	private var _deathCounter : Float = 2.5;
	private var _deathTimer : Float = 2.5;
	private var _vaccuumExists : Bool = false;
	
	
	private var run = Assets.getMusic("assets/music/runningSong.ogg");
	private var bunnyLost = Assets.getMusic("assets/music/bunnyLost.ogg");
	private var playerHit = Assets.getMusic("assets/music/playerHit.ogg");
	private var playerPickup = Assets.getMusic("assets/music/playerPickup.ogg");
	private var vaccumTurnOn = Assets.getMusic("assets/music/vaccumTurnOn.ogg");


	override public function create() : Void {
		super.create();

		_background = new Background();
		add( _background );
		
		FlxG.sound.play(run,1.5,true);
		

		_player = new Player( 280, 400 );
		_vaccuum = new Vaccuum(24, 536);
		add( _vaccuum);
		_vaccuum.scale.set(0, 0);
		add( _player );
		// _player.scale.set(.2, .2);
		// _player.updateHitbox();

		add( _obstacleGroup );
		add( _bunnyGroup );

		_obstacleTimer = _obstacleInterval;
		_bunnyTimer = _bunnyInterval;
		_invulnTimer = _invulnFrames;
	}

	override public function update( elapsed : Float ) : Void {
		super.update( elapsed );

		_background.update( elapsed );

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
		
		_invulnTimer -= FlxG.elapsed;
		if ( _invulnTimer <= 0 ) {
			_canHit = true;
			_invulnTimer = _invulnFrames;
		}
		
		if (_bunnySize > 1.9){
			goToWin();
		}
		
		if (_bunnySize <= .5){
			if (!_vaccuumExists){
				_vaccuum.scale.set(1, 1);
				FlxG.sound.play(vaccumTurnOn);
				_vaccuumExists = true;
			}
			_deathTimer -= FlxG.elapsed;
			if ( _deathTimer <= 0 ) {
				//_canHit = true;
				goToLose();
				_deathTimer = _deathCounter;
			}
		}
		else{
			if (_vaccuumExists){
				_vaccuum.scale.set(0, 0);
				_vaccuumExists = false;
			}
		}
		
		// Update existing bunnies
		// XXX: This should totally be merged with the above as a helper
		for ( b in _bunnies ) {
			
			// Delete obstacle if it's offscreen
			if ( b.movement( playerSpeed )) {
				_bunnyGroup.remove( b );
				_bunnies.remove( b );
				FlxG.sound.play(bunnyLost);
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
	
	private function addVaccuum() : Void {
		var v = new Vaccuum(24,FlxG.height - 104);
		
	}

	private function obstacleCollision( first : FlxObject, second : FlxObject ) : Void {

		// DEBUG: Kill the player when they hit an obstacle
		if (Type.getClassName(Type.getClass(second)) == "Obstacle"){
			//remove( _player );
			_obstacleGroup.remove(cast(second,Obstacle));
			_obstacles.remove(cast(second,Obstacle));
			
		}
		if (Type.getClassName(Type.getClass(first)) == "Obstacle"){
			//remove( _player );
			_obstacleGroup.remove(cast(first,Obstacle));
			_obstacles.remove(cast(first,Obstacle));
			
		}
		
		if (_canHit == true){
			FlxG.sound.play(playerHit);
			_canHit = false;
			_bunnySize -= .5;
			_player.scale.set(_bunnySize, _bunnySize);
			_player.updateHitbox();
			var b : SmolBunny = new SmolBunny( _player.x, _player.y + _player.height );
			_bunnyGroup.add( b );
			_bunnies.push( b );
		}
		if (_bunnySize <= 0){
			remove( _player );
		}
		
	}

	private function bunnyCollision( first : FlxObject, second : FlxObject ) : Void {

		// TODO: Absorb the bunny, increase size and speed of player
		if (Type.getClassName(Type.getClass(second)) == "SmolBunny"){
			//remove( _player );
			_bunnyGroup.remove(cast(second,SmolBunny));
			_bunnies.remove(cast(second,SmolBunny));
			
		}
		if (Type.getClassName(Type.getClass(first)) == "SmolBunny"){
			//remove( _player );
			_bunnyGroup.remove(cast(first,SmolBunny));
			_bunnies.remove(cast(first,SmolBunny));
			
		}
		if (_canHit){
			FlxG.sound.play(playerPickup);
			_canHit = false;
			_bunnySize += .2;
			_player.scale.set(_bunnySize, _bunnySize);
			_player.updateHitbox();
		}
	}
	
	function goToWin():Void
	{
		FlxG.switchState(new WinnerState());
	}
	
	function goToLose():Void
	{
		FlxG.switchState(new GameOverState());
	}
}