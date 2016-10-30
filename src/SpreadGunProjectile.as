package  
{
	/**
	 * ...
	 * @author Spiggly
	 */
	
	import org.flixel.*;
	
	public class SpreadGunProjectile extends Projectile
	{
		private static var DAMAGE:Number = 8;
		private static var TOTALVELOCITY:Number = 500;
		private static var TOTALACCELERATION:Number = 0;
		private static var FORCEGRAVITY:Number = 0;
		
		public function PistolProjectile(X:Number, Y:Number, ANGLE:Number) 
		{
			super(X, Y, ANGLE, DAMAGE, TOTALVELOCITY, TOTALACCELERATION, FORCEGRAVITY, AssetManager.imageSpreadGunProjectile);
		}
	}
}