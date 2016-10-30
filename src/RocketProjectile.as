package  
{
	/**
	 * ...
	 * @author Brandon
	 */
	
	import org.flixel.*;
	
	public class RocketProjectile extends Projectile
	{
		private static var DAMAGE:Number = 10;
		private static var TOTALVELOCITY:Number = 25;
		private static var TOTALACCELERATION:Number = 150;
		private static var FORCEGRAVITY:Number = 0;
		private var trailEmitter:RocketEmitterTrail;
		
		public function RocketProjectile(X:Number, Y:Number, ANGLE:Number) 
		{
			super(X, Y, ANGLE, DAMAGE, TOTALVELOCITY, TOTALACCELERATION, FORCEGRAVITY, AssetManager.imageRocketLauncherProjectile);
			
			angle = ANGLE;
			
			trailEmitter = SpecialEffects.rocketSmoke(this);
		}
		
		override public function update():void
		{
			super.update();
			
			angle = FlxU.getAngle(new FlxPoint(0,0), velocity);
		}
		
		override public function kill():void 
		{
			trailEmitter.kill();
			Registry.emitters.add(new Explosion(x, y));
			super.kill();
		}
	}
}