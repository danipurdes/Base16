package  
{
	/**
	 * ...
	 * @author puedes
	 */
	
	import org.flixel.*;
	
	public class WeaponManager extends FlxGroup
	{
		public var currentSpot:int;
		
		public function WeaponManager()
		{
			super();
			
			currentSpot = 0;
			maxSize = 8;
			
			add(new Minigun());
			add(new Pistol());
			add(new SpreadGun());
			add(new Flamethrower());
			add(new GrenadeLauncher());
			add(new StickyBombLauncher());
			add(new RocketLauncher());
			add(new SawGun());
			
			for (var i:int = 1; i < members.length; i++)
			{
				members[i].active = true;
				members[i].visible = false;
			}
		}
		
		public function getWeapon():Weapon
		{
			return members[currentSpot];
		}
		
		public function nextWeapon():Weapon
		{
			members[currentSpot].visible = false;
			currentSpot += 1;
			if (currentSpot == members.length)
			{
				currentSpot = 0;
			}
			members[currentSpot].visible = true;
			
			return members[currentSpot];
		}
		
		public function previousWeapon():Weapon
		{
			members[currentSpot].visible = false;
			currentSpot -= 1;
			if (currentSpot == -1)
			{
				currentSpot = members.length - 1;
			}
			members[currentSpot].visible = true;
			return members[currentSpot];
		}
	}
}