package  
{
	/**
	 * ...
	 * @author ...
	 */
	import org.flixel.*;
	
	public class EnemySpider extends Enemy
	{
		public var gravity:Number;
		public var friction:FlxPoint = new FlxPoint(0, 0);
		
		private static var HITPOINTS:Number = 25;
		private static var movementSpeedX:Number = 25;
		private static var movementSpeedY:Number = 10;
		private var TIMER_TOTAL:Number = 1;
		private var TIMER_CURRENT:Number;
		
		public function EnemySpider(X:Number, Y:Number)
		{
			super(X, Y, null, HITPOINTS);
			
			maxVelocity.x = 80;
			maxVelocity.y = 210;
			gravity = 125;
			acceleration.y = gravity;
			
			loadGraphic(AssetManager.imageEnemySpider, true, false, 12, 8);
			addAnimation("Walking", [0, 1, 2, 3, 4, 5, 6, 7], 15, true);
			
			play("Walking");
		}
		
		override public function movement():void
		{
			velocity.x = Math.cos((FlxU.getAngle(getMidpoint(), Registry.player.getMidpoint()) - 90) * (Math.PI / 180)) * movementSpeedX;
			
			if (FlxU.getDistance(getMidpoint(), Registry.player.getMidpoint()) <= 50 && isTouching(FlxObject.FLOOR))
				velocity.y = -gravity * 0.5;
		}
		
		override public function update():void
		{
			super.update();
			
			if (TIMER_CURRENT <= 0)
			{
				//Registry.projectiles.add(new PistolProjectile(getMidpoint().x, getMidpoint().y, FlxU.getAngle(getMidpoint(), Registry.player.getMidpoint())));
				TIMER_CURRENT = TIMER_TOTAL;
			}
			else
				TIMER_CURRENT -= FlxG.elapsed;
		}
	}
}