package  
{
	/**
	 * ...
	 * @author ...
	 */
	
	import org.flixel.*;
	
	public class Enemy extends FlxSprite
	{
		private var image:Class;
		private var hitpoints:Number;
		private var damagePoints:Number;
		
		public var velocityStored:FlxPoint = new FlxPoint(0,0);
		public var accelerationStored:FlxPoint = new FlxPoint(0,0);
		
		private var HIT:Boolean;
		private var HIT_TIMER:Number;
		private var HIT_DURATION:Number = 1;
		
		private var damageText:DamageText;
		
		public function Enemy(X:Number, Y:Number, IMAGE:Class, HITPOINTS:Number) 
		{
			super(X, Y, IMAGE);
			
			hitpoints = HITPOINTS;
			HIT = false;
			HIT_TIMER = HIT_DURATION;
			
			image = IMAGE;
			antialiasing = false; 
		}
		
		public function hitProjectile(PROJECTILE:Projectile):void
		{
			var damageCaused:Number = 0;
			for (var i:int = 0; i < PROJECTILE.damage; i++)
			{
				hitpoints--;
				damageCaused++;
				if (hitpoints <= 0)
				{
					break;
				}
			}
			
			velocityStored = velocity;
			//velocity.x = PROJECTILE.velocity.x;
			//velocity.y = PROJECTILE.velocity.y;
			
			HIT = true;
			HIT_TIMER = HIT_DURATION;
			
			var damageText:DamageText = new DamageText(x, y, damageCaused);
			FlxG.state.add(damageText);
		}
		
		public function attack(PLAYER:Player):void
		{
			PLAYER.curHitpoints -= damagePoints;
		}
		
		public function movement():void
		{
			
		}
		
		override public function update():void
		{
			super.update();
			
			if (HIT)
			{
				HIT_TIMER -= FlxG.elapsed;
				if (HIT_TIMER <= 0)
				{
					HIT = false;
					velocity = velocityStored;
				}
			}
			
			movement();
			
			if (hitpoints <= 0)
			{
				die();
			}
		}
		
		public function die():void
		{
			Registry.enemies.remove(this);
		}
	}
}