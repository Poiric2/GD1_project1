package;

import flixel.FlxG;
import flixel.FlxObject;
import flixel.FlxState;
import flixel.group.FlxGroup;
import flixel.util.FlxSpriteUtil;

class CutsceneState extends FlxState {


	private var _sceneInterval : Float = 2;
	private var _sceneTimer : Float;

	override public function create() : Void {
		super.create();

		_sceneTimer = _sceneInterval;
	}

	override public function update( elapsed : Float ) : Void {
		super.update( elapsed );

		// Spawn obstacles every interval
		_sceneTimer -= FlxG.elapsed;
		if ( _sceneTimer <= 0 ) {
			
			_sceneTimer = _sceneInterval;
		}



	}

}