package
{
	/**
	 * ...
	 * @author puedes
	 * 
	 * Notes:
		 * Allows game objects to communicate with each other without passing references back and forth
		 * Set main variables in here and make them static
	 */
	
	import org.flixel.*;
	
	public class Registry
    {
        public static var player:Player;
		public static var projectiles:ProjectileManager;
		public static var weapons:WeaponManager;
		public static var enemies:EnemyManager;
		public static var enemyprojectiles:EnemyProjectileManager;
		public static var enemyweapons:EnemyWeaponManager;
		public static var emitters:EmitterManager;
		public static var interactives:InteractiveManager;
		public static var decorations:DecorationManager;
        
        public function Registry()
        {
			super();
        }
        
		public static function erase():void
		{
			//player = null;
			projectiles.clear();
			//weapons = null;
			enemies.clear();
			enemyprojectiles.clear();
			enemyweapons.clear();
			emitters.clear();
			interactives.clear();
			decorations.clear();
		}
    }
}