package  
{
	/**
	 * ...
	 * @author Brandon
	 */
	
	public class RocketLauncher extends Weapon
	{
		private static var FIRINGRATE:Number = 1;
		private static var CLIPSIZE:Number = 3;
		private static var TOTALAMMO:Number = 15;
		private static var RELOAD_DURATION:Number = 0.75;
		
		public function RocketLauncher() 
		{
			super(FIRINGRATE, CLIPSIZE, TOTALAMMO, RELOAD_DURATION, AssetManager.imageRocketLauncherGun, AssetManager.soundPistolProjectileFired);
		}
		
		override public function firingInstructions():void 
		{
			super.firingInstructions();
			
			var tempBullet:RocketProjectile = new RocketProjectile(Registry.player.getMidpoint().x, Registry.player.y, this.angle);
			Registry.projectiles.add(tempBullet);
			
			var velocityDelta:Number = 40;
			var velocityDeltaX:Number = Math.cos((angle - 90) * (Math.PI / 180)) * velocityDelta;
			var velocityDeltaY:Number = Math.sin((angle - 90) * (Math.PI / 180)) * velocityDelta;
			
			Registry.player.velocity.x -= velocityDeltaX;
			Registry.player.velocity.y -= velocityDeltaY;
			
			SpecialEffects.gunsmoke(Registry.player.getMidpoint().x, Registry.player.y);
		}
	}
}