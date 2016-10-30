package
{
	/**
	 * ...
	 * @author puedes
	 */
	
	import org.flixel.*;
	
	public class Player extends FlxSprite
	{
		public var maxHitpoints:Number = 12;
		public var curHitpoints:Number = 12;
		
		public var gravity:Number;
		public var velocityStored:FlxPoint = new FlxPoint(0, 0);
		public var accelerationStored:FlxPoint = new FlxPoint(0, 0);
		public var friction:FlxPoint = new FlxPoint(0, 0);
		
		private var curWeapon:Weapon;
		private var curJumps:Number;
		private var maxJumps:Number;
		
		public function Player() 
		{
			super();
			
			facing = FlxObject.RIGHT;
			curWeapon = Registry.weapons.getWeapon();
			curWeapon.angle = 90;
			
			maxVelocity.x = 80;
			maxVelocity.y = 210;
			gravity = 175;
			acceleration.y = gravity;
			friction.x = maxVelocity.x * 4;
			friction.y = maxVelocity.y * 4;
			drag.x = friction.x;
			drag.y = friction.y;
			
			curJumps = 0;
			maxJumps = 2;
			
			loadGraphic(AssetManager.imageSuitJim, true, true, 16, 16);
			width = 8;
			height = 14;
			offset.x = 4;
			offset.y = 2;
			
			//addAnimation("stand", [0, 1], 6, true);
			//addAnimation("walk", [2, 3, 0, 3, 2], 6, true);
			//addAnimation("jump", [4], 6, true);
			//addAnimation("fall", [5, 6], 6, true);
		}
		
		public function killPlayer():void 
		{
			//Registry.weapons.clear();
			//Registry.player null;
			FlxG.switchState(new StateMainMenu());
		}
		
		override public function update():void
		{
			super.update();
			
			if (curHitpoints <= 0)
			{
				killPlayer();
			}
			
			curWeapon.x = getMidpoint().x - (curWeapon.width / 2);
			curWeapon.y = getMidpoint().y - (curWeapon.height / 2);
			
			acceleration.y = gravity;
			acceleration.x = 0;
			
			if (velocity.x == 0 && velocity.y == 0)
			{
				//play("stand");
			}
			
			if (FlxG.keys.A)
			{
				acceleration.x = -maxVelocity.x * 4;
				//play("walk");
			}
			
			if (FlxG.keys.D)
			{
				acceleration.x = maxVelocity.x * 4;
				//play("walk");
			}
			
			if (touching == FlxObject.DOWN)
			{
				curJumps = 0;
				drag.x = friction.x;
				drag.y = friction.y / 2;
			}
			else
			{
				if (curJumps == 0)
				{
					curJumps = 1;
				}
				else
				{
					if (velocity.y <= 0)
					{
						//play("jump");
					}
					else
					{
						//play("fall");
					}
				}
				
				drag.x = friction.x / 2;
				drag.y = friction.y;
			}
			
			if (FlxG.keys.justPressed("W") && (curJumps < maxJumps))
			{
				curJumps += 1;
				velocity.y = -maxVelocity.y / 2.25;
			}
			
			if (curWeapon.scale.x == -1)
			{
				facing = FlxObject.LEFT;
			}
			else if (curWeapon.scale.x == 1)
			{
				facing = FlxObject.RIGHT;
			}
			
			if (FlxG.keys.justPressed("E"))
			{
				curWeapon = Registry.weapons.nextWeapon();
			}
			if (FlxG.keys.justPressed("Q"))
			{
				curWeapon = Registry.weapons.previousWeapon();
			}
			
			if (curWeapon.firingRate_timer < curWeapon.firingRate)
			{
				curWeapon.firingRate_timer += FlxG.elapsed;
				if (curWeapon.firingRate_timer >= curWeapon.firingRate)
				{
					curWeapon.firingRate_timer = curWeapon.firingRate;
				}
			}
			if (FlxG.mouse.pressed())
			{
				if (curWeapon.firingRate_timer >= curWeapon.firingRate)
				{
					curWeapon.fire();
					curWeapon.firingRate_timer = 0;
				}
			}
		}
	}
}