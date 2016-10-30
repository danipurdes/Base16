package  
{
	/**
	 * ...
	 * @author ...
	 */
	
	import org.flixel.*;
	
	public class SawProjectile extends Projectile
	{
		private static var DAMAGE:Number = 60;
		private static var TOTALVELOCITY:Number = 85;
		private static var TOTALACCELERATION:Number = 0;
		private static var FORCEGRAVITY:Number = 0;
		
		private static var topLine:FlxSprite = new FlxSprite();
		private static var bottomLine:FlxSprite = new FlxSprite();
		private static var leftLine:FlxSprite = new FlxSprite();
		private static var rightLine:FlxSprite = new FlxSprite();
		
		public function SawProjectile(X:Number, Y:Number, ANGLE:Number) 
		{
			super(X, Y, ANGLE, DAMAGE, TOTALVELOCITY, TOTALACCELERATION, FORCEGRAVITY, AssetManager.imageSawProjectile);
			
			loadGraphic(AssetManager.imageSawProjectile, true, true, 5, 5);
			
			//topLine.makeGraphic();
			
			addAnimation("spinning", [0, 1, 2, 3, 4, 5, 6, 7], 16, true);
			play("spinning");
		}
		
		override public function collideLevel():void
		{
			velocity.y = -15;
		}
	}
}