package;

import flixel.FlxState;
import flixel.FlxG;
import flixel.ui.FlxButton;
import flixel.system.FlxSound;

class MenuState extends FlxState
{
	override public function create():Void
	{
		super.create();
		var back = new MenuSprite( 0, 0);
	 
		add(back);
		
		var playButton:FlxButton = new FlxButton(110, 450, "", goToPlay);
		playButton.loadGraphic("assets/images/start.png");
	
		
		add(playButton);
		
		//FlxG.sound.play("assets/music/menuSong.ogg");

	}

	override public function update(elapsed:Float):Void
	{
		super.update(elapsed);
	}
	
	function goToPlay():Void
	{
		FlxG.switchState(new CutsceneState());
	}
	
	function winning():Void
	{
		FlxG.switchState(new WinnerState());
	}
	
	function gameOver() : Void
	{
		FlxG.switchState(new GameOverState());
	}
}