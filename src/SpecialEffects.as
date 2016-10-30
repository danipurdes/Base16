package  
{
	/**
	 * ...
	 * @author Spiggly
	 * 
	 * Notes:
		 * Container class for all particle effects (smoke, fire, explosions, blood, etc.)
		 * Each function corresponds to a unique effect
		 * 
	 */
	
	import org.flixel.*;
	
	public class SpecialEffects
	{
		//Constructor method (Do not edit)
		public function SpecialEffects() 
		{
			super();
		}
		
		public static function gunsmoke(X:Number, Y:Number):void
		{
			var gunsmokeEmitter:FlxEmitter = new FlxEmitter(X, Y, 10);
			
			if (Registry.weapons.getWeapon().scale.x == -1)
			{
				gunsmokeEmitter.setXSpeed(-400, 150);
			}
			else
			{
				gunsmokeEmitter.setXSpeed(-150, 400);
			}
			gunsmokeEmitter.setYSpeed(-200, 200);
			
			for (var i:int = 0; i < gunsmokeEmitter.maxSize; i++)
			{
				gunsmokeEmitter.add(new PistolParticleSmoke());
			}
			
			Registry.emitters.add(gunsmokeEmitter);
			gunsmokeEmitter.start(true, .05);
		}
		
		public static function flameSmoke(X:Number, Y:Number):void
		{
			var flamesmokeEmitter:FlxEmitter = new FlxEmitter(X, Y, 1)
			
			if (Registry.weapons.getWeapon().scale.x == -1)
			{
				flamesmokeEmitter.setXSpeed(-45, -5);
			}
			else
			{
				flamesmokeEmitter.setXSpeed(5, 45);
			}
			flamesmokeEmitter.setYSpeed(-75, -50);
			
			for (var i:int = 0; i < flamesmokeEmitter.maxSize; i++)
			{
				flamesmokeEmitter.add(new FlamethrowerParticleSmoke());
			}
			
			Registry.emitters.add(flamesmokeEmitter);
			flamesmokeEmitter.start(true, 2);
		}
		
		public static function rocketSmoke(parRocket:RocketProjectile):RocketEmitterTrail
		{
			var smoketrailEmitter:RocketEmitterTrail = new RocketEmitterTrail(parRocket);
			
			smoketrailEmitter.setXSpeed( -parRocket.velocity.x - 5, -parRocket.velocity.x + 5);
			smoketrailEmitter.setYSpeed( -parRocket.velocity.y - 5, -parRocket.velocity.y + 5);
			for (var i:int = 0; i < smoketrailEmitter.maxSize; i++)
			{
				smoketrailEmitter.add(new RocketParticleSmoke());
			}
			
			Registry.emitters.add(smoketrailEmitter);
			smoketrailEmitter.start(false, 0.5, 0.1, 0);
			
			return smoketrailEmitter;
		}
	}
}