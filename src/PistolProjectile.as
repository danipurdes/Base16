package
{
	/**
	 * ...
	 * @author Spiggly
	 */
	
	import org.flixel.*;
	
	public class PistolProjectile extends Projectile
	{
		private static var DAMAGE:Number = 1;
		private static var TOTALVELOCITY:Number = 250;
		private static var TOTALACCELERATION:Number = 0;
		private static var FORCEGRAVITY:Number = 0;
		
		public function PistolProjectile(X:Number, Y:Number, ANGLE:Number) 
		{
			super(X, Y, ANGLE, DAMAGE, TOTALVELOCITY, TOTALACCELERATION, FORCEGRAVITY, AssetManager.imagePistolProjectile);
		}
		
		override public function kill():void
		{
			//Registry.emitters.add(new Explosion(x, y, 0.5, 15));
			super.kill();
		}
	}
}