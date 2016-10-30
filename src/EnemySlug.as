package  
{
	/**
	 * ...
	 * @author ...
	 */
	import org.flixel.*;
	
	public class EnemySlug extends Enemy
	{
		public var gravity:Number;
		public var friction:FlxPoint = new FlxPoint(0, 0);
		
		private static var HITPOINTS:Number = 3;
		private static var movementSpeedX:Number = 10;
		
		public function EnemySlug(X:Number, Y:Number)
		{
			super(X, Y, null, HITPOINTS);
			
			velocity.x = 20;
			maxVelocity.x = 80;
			maxVelocity.y = 210;
			gravity = 125;
			acceleration.y = gravity;
			
			loadGraphic(AssetManager.imageEnemySlug, false, false, 8, 8);
			addAnimation("Walking", [0, 1, 2, 3, 4, 5, 6, 7, 8, 1], 15, true);
			facing = RIGHT;
			
			play("Walking");
		}
		
		override public function movement():void
		{
			if (facing == FlxObject.LEFT)
			{
				velocity.x = -movementSpeedX;
			}
			else if (facing == FlxObject.RIGHT)
			{
				velocity.x = movementSpeedX;
			}
		}
		
		override public function update():void
		{
			super.update();
		}
	}
}