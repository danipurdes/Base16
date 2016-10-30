package  
{
	import org.flixel.FlxSprite;
	import org.flixel.*;
	/**
	 * ...
	 * @author ...
	 */
	
	public class EnemyWeapon extends FlxSprite
	{
		public var firingRate:Number;
		public var firingRate_timer:Number;

		private var image:Class;
		private var sound_fire:Class;
		
		public function EnemyWeapon(FIRINGRATE:Number, IMAGE:Class, SOUNDFIRE:Class)
		{
			super();
			
			solid = false;
			firingRate = FIRINGRATE;
			firingRate_timer = FIRINGRATE;
			
			image = IMAGE;
			sound_fire = SOUNDFIRE;
			loadGraphic(IMAGE, false, true);
			antialiasing = false;
		}
		
		override public function update():void
		{
			super.update();
			
			var tempAngle:Number = FlxU.getAngle(getMidpoint(), Registry.player.getMidpoint());
			
			if (tempAngle >= 0)
			{
				if (tempAngle < 45)
				{
					tempAngle = 45;
				}
				else if (tempAngle > 135)
				{
					tempAngle = 135;
				}
			}
			else if (tempAngle < 0)
			{
				if (tempAngle > -45)
				{
					tempAngle = -45;
				}
				else if (tempAngle < -135)
				{
					tempAngle = -135;
				}
			}
			
			if (tempAngle >= 0)
			{
				scale.x = 1;
			}
			else if (tempAngle < 0)
			{
				scale.x = -1;
			}
			
			this.angle = tempAngle;
		}
		public function enemyFire():void
		{
			firingInstructions();
		}
		public function firingInstructions():void
		{
			FlxG.play(sound_fire, .5); //FlxG.play(sound class, volume from 0-1)
		}
	}
}