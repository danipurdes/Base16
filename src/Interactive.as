package
{
	/**
	 * ...
	 * @author puedes
	 */
	
	import org.flixel.*;
	
	public class Interactive extends FlxSprite
	{
		public var gravity:Number;
		
		public function Interactive()
		{
			super();
			
			gravity = 2;
			
			loadGraphic(AssetManager.imageSuitBasic, true, true, 16, 16);
			width = 8;
			height = 12;
			offset.x = 4;
			offset.y = 4;
		}
		
		override public function update():void
		{
			super.update();
			
			velocity.y += gravity;
		}
		
		public function collidePlayer():void
		{
			if (touching == FlxObject.UP)
			{
				velocity.y = -4;
			}
			if (touching == FlxObject.LEFT)
			{
				x += 4;
			}
			if (touching == FlxObject.RIGHT)
			{
				x -= 4;
			}
			if (touching == FlxObject.NONE)
			{
				velocity.x = 0;
				velocity.y = 0;
			}
		}
	}
}