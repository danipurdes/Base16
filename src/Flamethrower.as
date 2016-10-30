package  
{
	/**
	 * ...
	 * @author Spiggly
	 */
	
	import org.flixel.*;
	
	public class Flamethrower extends Weapon
	{
		private static var FIRINGRATE:Number = 0.05;
		private static var CLIPSIZE:Number = 75;
		private static var TOTALAMMO:Number = 300;
		private static var RELOADDURATION:Number = 0.01;
		
		public function Flamethrower()
		{
			super(FIRINGRATE, CLIPSIZE, TOTALAMMO, RELOADDURATION, AssetManager.imageFlamethrowerGun, AssetManager.soundFlamethrowerProjectileFired);
		}
		
		override public function firingInstructions():void
		{
			super.firingInstructions();
			
			for (var i:int = 0; i < 12; i++)
			{
				var angleOffset:Number = 0;
				for (var j:int = 0; j < 3; j++)
				{
					angleOffset = (Math.random() * 60) - 30;
					//trace(angleOffset);
				}
				angleOffset /= 3;
				var tempProjectile:FlamethrowerProjectile = new FlamethrowerProjectile(getMidpoint().x, getMidpoint().y, this.angle + angleOffset);
				tempProjectile.x -= tempProjectile.width / 2;
				tempProjectile.y -= tempProjectile.height / 2;
				Registry.projectiles.add(tempProjectile);
			}
			
			SpecialEffects.flameSmoke(x + (width / 2), y + (height / 2));
		}
	}
}