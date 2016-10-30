package
{
	/**
	 * ...
	 * @author Puedes
	 */
	
	import org.flixel.*;
	
	public class Weapon extends FlxSprite
	{
		public var curAmmo:Number;
		public var clipSize:Number;
		public var totalAmmo:Number;
		public var maxAmmo:Number;
		public var firingRate:Number; 
		public var firingRate_timer:Number;
		public var reloadTimer:Number;
		public var reloadDuration:Number;
		
		public var usesTotalAmmo:Boolean;
		public var reloading:Boolean;
		
		private var image:Class;
		private var sound_fire:Class;
		
		public function Weapon(FIRINGRATE:Number, CLIPSIZE:Number, TOTALAMMO:Number, RELOADDURATION:Number, IMAGE:Class, SOUNDFIRE:Class)
		{
			super();
			
			solid = false;
			firingRate = FIRINGRATE;
			firingRate_timer = firingRate;
			reloadDuration = RELOADDURATION;
			reloadTimer = reloadDuration;
			
			clipSize = CLIPSIZE;
			totalAmmo = TOTALAMMO;
			if (TOTALAMMO != -1)
			{
				usesTotalAmmo = true;
				curAmmo = clipSize;
				totalAmmo -= curAmmo;
			}
			else
			{
				usesTotalAmmo = false;
				curAmmo = clipSize;
			}
			
			image = IMAGE;
			sound_fire = SOUNDFIRE;
			loadGraphic(IMAGE, false, true);
			antialiasing = false;
		}
		
		override public function update():void
		{
			super.update();
			
			angle = getAngleToMouse();
			
			if (reloading == true)
			{
				if (reloadTimer <= 0)
				{
					if (totalAmmo > 0 && usesTotalAmmo)
					{
						curAmmo++;
						totalAmmo--;
					}
					else if (!usesTotalAmmo)
					{
						curAmmo++;
					}
					
					if (totalAmmo <= 0 && usesTotalAmmo)
					{
						totalAmmo = 0;
						reloading = false;
					}
					else if (curAmmo >= clipSize)
					{
						curAmmo = clipSize;
						reloading = false;
					}
					
					reloadTimer = reloadDuration;
				}
				else
					reloadTimer -= FlxG.elapsed;
			}
			
			if (FlxG.keys.justPressed("R") && curAmmo < clipSize)
			{
				reloading = true;
			}
		}
		
		public function fire():void
		{
			if (reloading == false)
			{
				if (curAmmo > 0)
				{
					firingInstructions();
				}
				else
				{
					reloading = true;
				}
			}
		}
		
		public function firingInstructions():void
		{
			curAmmo -= 1;
			FlxG.play(sound_fire, .5); //FlxG.play(sound class, volume from 0-1)
		}
		
		public function getAngleToMouse():Number
		{
			var minBorder:Number = -180;
			var maxBorder:Number = 180;
			
			var tempAngle:Number = FlxU.getAngle(Registry.player.getMidpoint(), FlxG.mouse.getWorldPosition());
			
			//tempAngle /= 45;
			//tempAngle = Math.round(tempAngle);
			//tempAngle *= 45;
			
			if (tempAngle >= 0)
			{
				if (tempAngle < minBorder)
				{
					tempAngle = minBorder;
				}
				else if (tempAngle > maxBorder)
				{
					tempAngle = maxBorder;
				}
			}
			else if (tempAngle < 0)
			{
				if (tempAngle > -minBorder)
				{
					tempAngle = -minBorder;
				}
				else if (tempAngle < -maxBorder)
				{
					tempAngle = -maxBorder;
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
			
			return tempAngle;
		}
	}
}