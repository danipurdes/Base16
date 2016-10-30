package  
{
	/**
	 * ...
	 * @author ...
	 */
	
	import org.flixel.*;
	
	public class StickyBombLauncher extends Weapon
	{
		private static var FIRINGRATE:Number = 0.2;
		private static var CLIPSIZE:Number = 5;
		private static var TOTALAMMO:Number = 15;
		private static var MAXAMMO:Number = 500;
		private static var RELOADDURATION:Number = 0.5;
		
		public function StickyBombLauncher()
		{
			super(FIRINGRATE, CLIPSIZE, TOTALAMMO, RELOADDURATION, AssetManager.imageStickyBombGun, AssetManager.soundPistolProjectileFired);
			
			loadGraphic(AssetManager.imageStickyBombGun, true, true, 7, 15);
			
			frame = 0;
		}
		
		override public function update():void
		{
			super.update();
			
			if (FlxG.keys.justPressed("S"))
			{
				for each(var PROJECTILE in Registry.projectiles.members)
				{
					if (PROJECTILE is StickyBombProjectile)
					{
						PROJECTILE.kill();
					}
				}
			}
		}
		
		override public function firingInstructions():void 
		{
			super.firingInstructions();
			
			if (++frame > 3)
			{
				frame = 0;
			}
			
			var tempProjectile:StickyBombProjectile = new StickyBombProjectile(x + (width / 2), y, this.angle);
			Registry.projectiles.add(tempProjectile);
		}	
	}
}