package  
{
	/**
	 * ...
	 * @author Spiggly
	 */
	
	import org.flixel.*;
	
	public class FlamethrowerProjectile extends Projectile
	{
		private static var DAMAGE:Number = 1;
		private static var TOTALVELOCITY:Number = 400;
		private static var TOTALACCELERATION:Number = 0;
		private static var FORCEGRAVITY:Number = 0;
		
		private static var HEIGHT:Number;
		private static var WIDTH:Number;
		private var LIFESPAN:Number = 0.095;
		
		public function FlamethrowerProjectile(X:Number, Y:Number, ANGLE:Number) 
		{
			var totalVelocityOffset:Number = Math.random() * 300 - 150;
			super(X, Y, ANGLE, DAMAGE, TOTALVELOCITY + totalVelocityOffset, TOTALACCELERATION, FORCEGRAVITY, null);
			
			maxVelocity.x = TOTALVELOCITY;
			maxVelocity.y = TOTALVELOCITY;
			
			var randWidth:uint = Math.ceil(Math.random() * 2);
			var randHeight:uint = randWidth; //Math.ceil(Math.random() * 2);
			
			var alpha:uint = 0xFF000000;
			var red:uint = 0x00FF0000 * Math.random();
			var green:uint = 0x00000000;//0x00007000 * Math.random() + 0x00005F00;
			makeGraphic(randWidth, randHeight, alpha + red);
			
			/*var randNumb:Number = Math.ceil(Math.random() * 4);
			switch(randNumb)
			{
				case 1: makeGraphic(randWidth, randHeight, 0xCCDD0000); break;
                case 2: makeGraphic(randWidth, randHeight, 0xCCDDBB00); break;
				case 3: makeGraphic(randWidth, randHeight, 0xCCEE8800); break;
                case 4: makeGraphic(randWidth, randHeight, 0xCCEE3300); break;
			}*/
			
			HEIGHT = height;
			WIDTH = width;
			
			x -= WIDTH / 2;
			y -= HEIGHT / 2;
			
			LIFESPAN += Math.random() * 0.05 - 0.025;
		}
		
		override public function update():void
		{
			super.update();
			
			LIFESPAN -= FlxG.elapsed;
			if (LIFESPAN <= 0)
			{
				kill();
			}
		}
		
		override public function collideLevel():void
		{
			if (touching == FlxObject.LEFT || touching == FlxObject.RIGHT)
			{
				velocity.x = -velocityStored.x / 4;
				velocity.y = velocityStored.y + (velocityStored.x / 4 * 3);
			}
			if (touching == FlxObject.DOWN || touching == FlxObject.UP)
			{
				velocity.y = -velocityStored.y / 4;
				velocity.x = velocityStored.x * 1.25;
			}
		}
	}
}