package  
{
	/**
	 * ...
	 * @author ...
	 */
	
	import org.flixel.*;
	
	public class EnemyTrooper extends Enemy
	{
		private static var movementSpeedX:Number = 20;
		private static var movementSpeedY:Number = 10;
		private var HITPOINTS:Number = 60;
		private var curWeapon:EnemyWeapon;
		
		public function EnemyTrooper(X:Number, Y:Number) 
		{
			super(X, Y, null, HITPOINTS);
			
			facing = FlxObject.RIGHT;
			curWeapon = new EnemyWeaponPistol();
			Registry.enemyweapons.add(curWeapon);
			curWeapon.angle = 90;
			
			acceleration.y = 175;
			
			loadGraphic(AssetManager.imageEnemyTrooper, true, false, 16, 16);
			addAnimation("walking", [0, 1, 2, 3, 4, 5], 14, true);
		}
		
		override public function die():void
		{
			Registry.enemyweapons.remove(curWeapon);
			super.die();
		}
		
		override public function movement():void
		{
			velocity.x = Math.cos((FlxU.getAngle(getMidpoint(), Registry.player.getMidpoint()) - 90) * (Math.PI / 180)) * movementSpeedX;
			if (velocity.x > 0)
			{
				facing = FlxObject.RIGHT;
				scale.x = 1;
			}
			else if (velocity.x < 0)
			{
				facing = FlxObject.LEFT;
				scale.x = 1;
			}
			play("walking");
		}
		
		override public function update():void
		{
			super.update();
			
			curWeapon.x = getMidpoint().x - (curWeapon.width / 2);
			curWeapon.y = getMidpoint().y - (curWeapon.height / 2);
			
			acceleration.x = 0;
			
			if (FlxU.getDistance(getMidpoint(), Registry.player.getMidpoint()) <= 75 && isTouching(FlxObject.DOWN))
			{
				//velocity.y = -50;
			}
			
			movement();
			
			if (curWeapon.firingRate_timer > 0)
			{
				curWeapon.firingRate_timer -= FlxG.elapsed;
				
				if (curWeapon.firingRate_timer <= 0)
				{
					curWeapon.enemyFire();
					curWeapon.firingRate_timer = curWeapon.firingRate;
				}
			}
		}
	}
}