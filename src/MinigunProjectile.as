package  
{
	/**
	 * ...
	 * @author Spiggly
	 */
	
	import org.flixel.*;
	
	public class MinigunProjectile extends Projectile
	{
		private static var DAMAGE:Number = 2;
		private static var TOTALVELOCITY:Number = 500;
		private static var TOTALACCELERATION:Number = 0;
		private static var FORCEGRAVITY:Number = 0;
		
		public function MinigunProjectile(X:Number, Y:Number, ANGLE:Number) 
		{
			super(X, Y, ANGLE, DAMAGE, TOTALVELOCITY, TOTALACCELERATION, FORCEGRAVITY, AssetManager.imageMiniGunProjectile);
			
			angle = ANGLE;
		}
	}
}