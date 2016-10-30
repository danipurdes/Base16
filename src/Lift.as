package  
{
	/**
	 * ...
	 * @author ...
	 */
	import org.flixel.*;
	
	public class Lift extends Interactive
	{
		public var lifespan:Number = 660;
		
		public function Lift(X:Number, Y:Number, IMAGE:Class) 
		{
			super(X, Y, AssetManager.Lift1);
			immovable = true;
			active = false;
		}
		override public function collidePlayer(PLAYER:Player):void 
		{
			active = true;
			if (touching == FlxObject.UP && PLAYER.touching != FlxObject.UP)
			{
				velocity.y = -25;
			}
		}
		override public function update():void
		{
			super.update();
			
			if (lifespan > 0)
			{
				lifespan--;
			}
			if(lifespan <= 0)
			{
				velocity.y = 0;
			}
		}
	}
}