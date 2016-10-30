package  
{
	/**
	 * ...
	 * @author ...
	 */
	public class EnemyPistolProjectile extends EnemyProjectile
	{
		private static var DAMAGE:Number = 13;
		private static var TOTALVELOCITY:Number = 250;
		private static var TOTALACCELERATION:Number = 0;
		private static var FORCEGRAVITY:Number = 0;
		
		public function EnemyPistolProjectile(X:Number, Y:Number, ANGLE:Number) 
		{
			super(X, Y, ANGLE, DAMAGE, TOTALVELOCITY, TOTALACCELERATION, FORCEGRAVITY, AssetManager.imagePistolProjectile)
		}
	}
}