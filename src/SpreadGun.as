package  
{
	/**
	 * ...
	 * @author Brandon
	 */
	
	import org.flixel.*;
	
	public class SpreadGun extends Weapon
	{
		private static var FIRINGRATE:Number = 0.3;
		private static var CLIPSIZE:Number = 5;
		private static var TOTALAMMO:Number = -1;
		private static var RELOAD_DURATION:Number = 0.25;
		
		public function SpreadGun() 
		{
			super(FIRINGRATE, CLIPSIZE, TOTALAMMO, RELOAD_DURATION, AssetManager.imageSpreadGun, AssetManager.soundPistolProjectileFired);
			
			loadGraphic(AssetManager.imageSpreadGun, true, true, 6, 15);
			addAnimation("idle", [0,1,2,3,4,5,6,7], 4, true);
			addAnimation("firing", [8], 0, true);
			
			play("idle");
		}
		
		override public function firingInstructions():void
		{
			super.firingInstructions();
			
			var projectileArray:Array = new Array();
			
			for (var i:int = -1; i <= 1; i++)
			{
				projectileArray.push(new PistolProjectile(getMidpoint().x, getMidpoint().y, this.angle + (7.5 * i)));
			}
			for (var j:int = 0; j < projectileArray.length; j++)
			{
				Registry.projectiles.add(projectileArray[j]);
			}
			
			SpecialEffects.gunsmoke(getMidpoint().x, getMidpoint().y);
		}
		
		override public function update():void
		{
			super.update();
			
			if (FlxG.mouse.justReleased())
			{
				play("idle");
			}
			if (FlxG.mouse.justPressed())
			{
				play("firing");
			}
		}
	}	
}