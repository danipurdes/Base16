package  
{
	/**
	 * ...
	 * @author ...
	 */
	public class EnemyWeaponPistol extends EnemyWeapon
	{
		private static var FIRINGRATE:Number = 2;
		
		public function EnemyWeaponPistol() 
		{
			super(FIRINGRATE, AssetManager.imageEnemyPistol, AssetManager.soundPistolProjectileFired);
		}
		
		override public function firingInstructions():void
		{
			super.firingInstructions();
			
			var tempProjectile:EnemyPistolProjectile = new EnemyPistolProjectile(getMidpoint().x, getMidpoint().y, angle);
			Registry.enemyprojectiles.add(tempProjectile);
			
			SpecialEffects.gunsmoke(getMidpoint().x, getMidpoint().y);
		}
	}
}