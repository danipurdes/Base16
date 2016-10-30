package
{
	/**
	 * ...
	 * @author Spiggly
	 */

	import org.flixel.system.*;
	import org.flixel.*;
	
	[SWF(width = "640", height = "360", backgroundColor = "#000000")]
	//[Frame(factoryClass = "Preloader")]
	
	public class GameEngine extends FlxGame
	{
		public function GameEngine()
		{
			super(320, 180, StateMainMenu, 2);
		}
	}
}