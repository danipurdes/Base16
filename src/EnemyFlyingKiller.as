package  
{
	/**
	 * ...
	 * @author ...
	 */
	import org.flixel.*;
	 
	public class EnemyFlyingKiller extends Enemy
	{
		private static var HITPOINTS:Number = 25;
		private static var movementSpeedX:Number = 40;
		private static var movementSpeedY:Number = 22;
		
		public var child:int = 0;
		
		public function EnemyFlyingKiller(X:Number, Y:Number) 
		{
			super(X, Y, null, HITPOINTS);
			
			velocity.x = movementSpeedX;
			acceleration.y = 100;
			
			loadGraphic(AssetManager.imageEnemyFlyingKiller, true, false, 16, 16);
			addAnimation("Flying", [0, 1, 2, 3, 4, 5], 15, true);
			
			play("Flying");
		}
		
		override public function movement():void
		{
			velocity.x = Math.cos((FlxU.getAngle(getMidpoint(), Registry.player.getMidpoint()) - 90) * (Math.PI / 180)) * movementSpeedX;
			velocity.y = Math.sin((FlxU.getAngle(getMidpoint(), Registry.player.getMidpoint()) - 90) * (Math.PI / 180)) * movementSpeedY;
		}
		
		override public function die():void 
		{
			if (child < 2)
			{
				for (var i:int = -1; i <= 1; i+=2)
				{
					var ENEMY:EnemyFlyingKiller = new EnemyFlyingKiller(x + (i * 4), y);
					ENEMY.child = child + 1;
					ENEMY.scale.x = scale.x / 2;
					ENEMY.scale.y = scale.y / 2;
					ENEMY.width = width / 2;
					ENEMY.height = height / 2;
					ENEMY.centerOffsets();
					Registry.enemies.add(ENEMY);
				}
			}
			super.die();
		}
		
		override public function update():void
		{
			super.update();
			
			if (FlxU.getDistance(getMidpoint(), Registry.player.getMidpoint()) <= 75 && isTouching(FlxObject.DOWN))
			{
				velocity.y = -60;
			}
			movement();
		}
		
	}

}