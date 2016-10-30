package  
{
	/**
	 * ...
	 * @author Spiggly
	 */
	
	import org.flixel.*;
	
	public class Pistol extends Weapon
	{
		private static var FIRINGRATE:Number = 0.3;
		private static var CLIPSIZE:Number = 10;
		private static var TOTALAMMO:Number = -1;
		private static var RELOADDURATION:Number = 0.25;
		
		public function Pistol()
		{
			super(FIRINGRATE, CLIPSIZE, TOTALAMMO, RELOADDURATION, AssetManager.imagePistolGun, AssetManager.soundPistolProjectileFired);
		}
		
		override public function firingInstructions():void
		{
			super.firingInstructions();
			
			var PROJECTILE:Projectile = new PistolProjectile(Registry.player.getMidpoint().x, Registry.player.getMidpoint().y, this.angle);
			Registry.projectiles.add(PROJECTILE);
			
			SpecialEffects.gunsmoke(getMidpoint().x, getMidpoint().y);
		}
	}
}