package  
{
	import org.flixel.FlxGroup;
	/**
	 * ...
	 * @author ...
	 */
	public class EnemyWeaponManager extends FlxGroup
	{
		public var currentSpot:int;
		
		public function EnemyWeaponManager() 
		{
			super();
			
			currentSpot = 0;
			maxSize = 2;
			
			add(new EnemyWeaponPistol());
			
		}
		
		public function getEnemyWeapon():EnemyWeapon
		{
			return members[currentSpot];
		}
		
	}

}