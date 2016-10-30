package
{
	/**
	 * ...
	 * @author Puedes
	 */
	
	import org.flixel.*;
	
	public class Projectile extends FlxSprite
	{
		public var damage:Number;
		public var gravity:Number;
		
		public var velocityStored:FlxPoint = new FlxPoint(0,0);
		public var accelerationStored:FlxPoint = new FlxPoint(0,0);
		
		public function Projectile(X:Number, Y:Number, ANGLE:Number, DAMAGE:Number, TOTALVELOCITY:Number, TOTALACCELERATION:Number, FORCEGRAVITY:Number, IMAGE:Class)
		{
			super(X, Y);
			
			damage = DAMAGE;
			
			velocity.x = Math.cos((ANGLE - 90) * (Math.PI / 180)) * TOTALVELOCITY;
			velocity.y = Math.sin((ANGLE - 90) * (Math.PI / 180)) * TOTALVELOCITY;
			
			acceleration.x = Math.cos((ANGLE - 90) * (Math.PI / 180)) * TOTALACCELERATION;
			acceleration.y = Math.sin((ANGLE - 90) * (Math.PI / 180)) * TOTALACCELERATION + FORCEGRAVITY;
			
			gravity = FORCEGRAVITY;
			
			if (IMAGE != null)
			{
				loadGraphic(IMAGE, false, false);
			}
			antialiasing = true;
		}
		
		override public function update():void
		{
			super.update();
			
			if (x < 0 || x > FlxG.worldBounds.width || y < 0 || y > FlxG.worldBounds.height)
			{
				kill();
			}
		}
		
		override public function kill():void
		{
			Registry.projectiles.remove(this);
		}
		
		public function collideLevel():void
		{
			kill();
		}
		
		public function collideEnemy(ENEMY:Enemy):void
		{
			kill();
		}
		
		public function setStoredVelocity(POINT:FlxPoint):void
		{
			velocityStored.x = POINT.x;
			velocityStored.y = POINT.y;
		}
		
		public function setStoredAcceleration(POINT:FlxPoint):void
		{
			accelerationStored.x = POINT.x;
			accelerationStored.y = POINT.y;
		}
	}
}