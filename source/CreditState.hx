package;

import flixel.FlxState;
import flixel.FlxG;
import flixel.ui.FlxButton;

class CreditState extends FlxState
{
	override public function create():Void
	{
		super.create();
		
		var menuButton:FlxButton = new FlxButton(50, 50, "Menu", goToMenu);
		
		add(menuButton);
	}

	override public function update(elapsed:Float):Void
	{
		super.update(elapsed);
	}
	
	function goToMenu():Void
	{
		FlxG.switchState(new MenuState());
	}
}