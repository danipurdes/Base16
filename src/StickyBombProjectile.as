package  
{
	/**
	 * ...
	 * @author puedes
	 */
	
	import org.flixel.*;
	
	public class StickyBombProjectile extends Projectile
	{
		private static var DAMAGE:Number = 65;
		private static var TOTALVELOCITY:Number = 150;
		private static var TOTALACCELERATION:Number = 0;
		private static var FORCEGRAVITY:Number = 75;
		
		public function StickyBombProjectile(X:Number, Y:Number, ANGLE:Number) 
		{
			super(X, Y, ANGLE, DAMAGE, TOTALVELOCITY, TOTALACCELERATION, FORCEGRAVITY, AssetManager.imageStickyBombProjectile);
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
			velocity.x = 0;
			velocity.y = 0;
			acceleration.x = 0;
			acceleration.y = 0;
		}
	}
}