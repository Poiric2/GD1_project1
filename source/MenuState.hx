package;

import flixel.FlxState;
import flixel.FlxG;
import flixel.ui.FlxButton;

class MenuState extends FlxState
{
	override public function create():Void
	{
		super.create();
		
		var playButton:FlxButton = new FlxButton(50, 50, "Play", goToPlay);
		var creditButton:FlxButton = new FlxButton(50, 100, "Credits", goToCredits);
		
		add(playButton);
		add(creditButton);
	}

	override public function update(elapsed:Float):Void
	{
		super.update(elapsed);
	}
	
	function goToPlay():Void
	{
		FlxG.switchState(new PlayState());
	}
	
	function goToCredits():Void
	{
		FlxG.switchState(new CreditState());
	}
}