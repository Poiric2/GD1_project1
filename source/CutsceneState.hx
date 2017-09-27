package;

import flixel.FlxG;
import flixel.FlxObject;
import flixel.FlxState;
import flixel.group.FlxGroup;
import flixel.util.FlxSpriteUtil;
import flixel.FlxSprite;
import flixel.util.FlxColor;
import flixel.system.FlxAssets.FlxGraphicAsset;


class CutsceneState extends FlxState {


	private var _sceneInterval : Float = 0;
	private var _sceneTimer : Float;	
	private var count:Int = 0;
	private var _backGroup = new FlxTypedGroup< Cutscene >( 5 );
	var cutScene = new Array();
	var times = [1, 1, 2, 1, 1];	
	
	override public function create() : Void {
		super.create();
		changeCutscene();
		
		add( _backGroup);
		
		_sceneTimer = times[count];
		
	}

	override public function update( elapsed : Float ) : Void {
		super.update( elapsed );
		
		
		// Spawn obstacles every interval
		_sceneTimer -= FlxG.elapsed;
		
		if ( _sceneTimer <= 0 && count < 5) 
		{
			count++;
			changeCutscene();
			
			_sceneTimer = times[count];
			
		}
		
		if (count == 5)
		{
			goToPlay();
		}

	}
	
	private function changeCutscene() : Void 
	{
		var o = new Cutscene( 0, 0, count );
		_backGroup.add( o );
		cutScene.push( o );
	}
	
	function goToPlay():Void
	{
		FlxG.switchState(new PlayState());
	}

}