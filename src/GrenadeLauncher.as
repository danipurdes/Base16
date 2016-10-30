package  
{
	/**
	 * ...
	 * @author ...
	 */
	
	import adobe.utils.CustomActions;
	import org.flixel.*;
	
	public class GrenadeLauncher extends Weapon
	{
		private static var FIRINGRATE:Number = 0.2;
		private static var CLIPSIZE:Number = 5;
		private static var TOTALAMMO:Number = 15;
		private static var MAXAMMO:Number = 500;
		private static var RELOADDURATION:Number = 0.5;
		
		public function GrenadeLauncher()
		{
			super(FIRINGRATE, CLIPSIZE, TOTALAMMO, RELOADDURATION, AssetManager.imageGrenadeLauncherGun, AssetManager.soundPistolProjectileFired);
		}
		
		override public function firingInstructions():void 
		{
			super.firingInstructions();
			
			var tempProjectile:GrenadeLauncherProjectile = new GrenadeLauncherProjectile(x + (width / 2), y, this.angle);
			Registry.projectiles.add(tempProjectile);
			
			//SpecialEffects.gunsmoke(x + (width / 2), y + (height / 2));
		}	
	}
}