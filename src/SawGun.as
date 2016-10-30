package  
{
	/**
	 * ...
	 * @author ...
	 */
	
	import org.flixel.*;
	
	public class SawGun extends Weapon
	{
		private static var FIRINGRATE:Number = 0.5;
		private static var CLIPSIZE:Number = 10;
		private static var TOTALAMMO:Number = 50;
		private static var RELOADDURATION:Number = .2;
		
		public function SawGun() 
		{
			super(FIRINGRATE, CLIPSIZE, TOTALAMMO, RELOADDURATION, AssetManager.imageSawGun, AssetManager.soundPistolProjectileFired);
		}
		
		override public function firingInstructions():void
		{
			super.firingInstructions();
			
			var tempProjectile:SawProjectile = new SawProjectile(Registry.player.getMidpoint().x, Registry.player.getMidpoint().y, this.angle);
			Registry.projectiles.add(tempProjectile);
			
			//SpecialEffects.gunsmoke(x + (width / 2), y + (height / 2));
		}
	}
}