package  
{
	/**
	 * ...
	 * @author Spiggly
	 */
	
	import org.flixel.*;
	
	public class Minigun extends Weapon
	{
		private static var FIRINGRATE:Number = 0.095;
		private static var CLIPSIZE:Number = 100;
		private static var TOTALAMMO:Number = 300;
		private static var MAXAMMO:Number = 500;
		private static var RELOADDURATION:Number = 0.01;
		
		private var WARMUP_TIME:Number = 0.5;
		private var WARMUP_CURRENT:Number = 0;
		
		public function Minigun()
		{
			super(FIRINGRATE, CLIPSIZE, TOTALAMMO, RELOADDURATION, AssetManager.imageMiniGun, AssetManager.soundPistolProjectileFired);
			
			loadGraphic(AssetManager.imageMiniGun, true, true, 7, 15);
			
			addAnimation("idle", [0], 0, true);
			addAnimation("firing", [0, 1, 2, 3], 30, true);
			
			play("idle");
		}
		
		override public function update():void
		{
			super.update();
			
			_curAnim.delay = Math.pow(WARMUP_TIME - WARMUP_CURRENT + .01, 1);
			
			if ((FlxG.keys.justReleased("SPACE") && !FlxG.mouse.pressed()) || (!FlxG.keys.pressed("SPACE") && FlxG.mouse.justReleased()))
			{
				play("idle");
			}
			if ((FlxG.keys.justPressed("SPACE") && !FlxG.mouse.pressed()) || (!FlxG.keys.pressed("SPACE") && FlxG.mouse.justPressed()))
			{
				play("firing");
			}
			
			if (FlxG.keys.pressed("SPACE") || FlxG.mouse.pressed())
			{
				WARMUP_CURRENT += FlxG.elapsed;
				
				if (WARMUP_CURRENT > WARMUP_TIME)
				{
					WARMUP_CURRENT = WARMUP_TIME;
				}
			}
			else
			{
				WARMUP_CURRENT -= 4 * FlxG.elapsed;
				
				if (WARMUP_CURRENT < 0)
				{
					WARMUP_CURRENT = 0;
				}
			}
		}
		
		override public function firingInstructions():void
		{
			if (FlxG.mouse.pressed() && WARMUP_CURRENT >= WARMUP_TIME)
			{
				super.firingInstructions();
				
				for (var i:int = 0; i < 1; i++)
				{
					var angleOffset:Number = 0;
					for (var j:int; j < 10; j++)
					{
						angleOffset += (Math.random() * 18) - 9;
					}
					angleOffset /= 10;
					
					var offset:Number = Math.round(Math.random() * 6 - 3);
					var tempProjectile:MinigunProjectile = new MinigunProjectile(getMidpoint().x, getMidpoint().y, this.angle + angleOffset);
					Registry.projectiles.add(tempProjectile);
				}
				
				var velocityDelta:Number = 20;
				var velocityDeltaX:Number = Math.cos((angle - 90) * (Math.PI / 180)) * velocityDelta;
				var velocityDeltaY:Number = Math.sin((angle - 90) * (Math.PI / 180)) * velocityDelta;
				
				Registry.player.velocity.x -= velocityDeltaX;
				//Registry.player.velocity.y -= velocityDeltaY;
				
				SpecialEffects.gunsmoke(x + (width / 2), y + (height / 2));
			}
		}
	}
}