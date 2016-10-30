package  
{
	/**
	 * ...
	 * @author puedes
	 */
	
	import org.flixel.*;
	
	public class GrenadeLauncherProjectile extends Projectile
	{
		private static var DAMAGE:Number = 65;
		private static var TOTALVELOCITY:Number = 150;
		private static var TOTALACCELERATION:Number = 0;
		private static var FORCEGRAVITY:Number = 150;
		
		public function GrenadeLauncherProjectile(X:Number, Y:Number, ANGLE:Number) 
		{
			super(X, Y, ANGLE, DAMAGE, TOTALVELOCITY, TOTALACCELERATION, FORCEGRAVITY, AssetManager.imageGrenadeLauncherProjectile);
		}
		
		override public function kill():void
		{
			var explosion:Explosion = new Explosion(getMidpoint().x, getMidpoint().y);
			Registry.emitters.add(explosion);
			explosion.start();
			Registry.projectiles.remove(this);
		}
		
		override public function collideLevel():void 
		{
			if (touching == FlxObject.DOWN)
			{
				velocity.x = velocityStored.x * 0.8;
				velocity.y = -velocityStored.y * 0.65;
				acceleration.x = accelerationStored.x;
				acceleration.y = accelerationStored.y;
				
				if (Math.abs(velocity.y) < 5)
				{
					velocity.y = 0;
				}
			}
			if (touching == FlxObject.UP)
			{
				velocity.x = velocityStored.x * 0.8;
				velocity.y = 0;
				acceleration.x = accelerationStored.x;
				acceleration.y = -accelerationStored.y;
			}
			if (touching == FlxObject.LEFT || touching == FlxObject.RIGHT)
			{
				velocity.x = -velocityStored.x * 0.65;
				velocity.y = velocityStored.y * 0.8;
				acceleration.x = accelerationStored.x;
				acceleration.y = accelerationStored.y;
			}
		}
	}
}