package  
{
	/**
	 * ...
	 * @author Puedes
	 *
	 */
	
	import org.flixel.*;
	import org.flixel.plugin.photonstorm.*;
	
	public class StateMainMenu extends FlxState
	{
		private var titleText:FlxBitmapFont;
		private var playButton:FlxButton;
		
		override public function create():void
		{
			super.create();
			
			FlxG.bgColor = 0xFFA9A9A9;
			//FlxG.playMusic(AssetManager.musicBackgroundMusic, 1);
			FlxG.mouse.show(AssetManager.imageCursor, 2, -6, -6);
			
			titleText = new FlxBitmapFont(AssetManager.imageBitmapFontDanny, 7, 8, "ABCDEFGHIJKLMNOPQRSTUVWXYZ 0123456789@", 38, 1);
			titleText.text = "BASE 16 RED@X";
			titleText.x = (FlxG.width - titleText.width) / 2;
			titleText.y = 10;
			titleText.customSpacingX = 2;
			titleText.customSpacingY = 2;
			titleText.scrollFactor = new FlxPoint(0, 0);
			add(titleText);
			
			playButton = new FlxButton(0, 0, "Play", loadStatePlay);
			playButton.x = (FlxG.width - playButton.width) / 2;
			playButton.y = (FlxG.height - playButton.height) / 2;
			add(playButton);
		}
		
		override public function update():void
		{
			super.update();
		}
		
		public function loadStatePlay():void
		{
			FlxG.switchState(new StatePlay);
		}
	}
}