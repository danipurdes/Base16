package  
{
	/**
	 * ...
	 * @author Spiggy
	 */
	
	import org.flixel.*;
	
	public class Explosion extends FlxEmitter
	{
		public function Explosion(X:Number, Y:Number)
		{
			super(X, Y, 8);
			
			lifespan = .2;
			
			for (var i:int = 0; i < 8; i++)
			{
				var temp:ExplosionParticle = new ExplosionParticle(i * 360 / 8);
				add(temp);
			}
			
			start();
		}
		
		override public function update():void
		{
			if (countLiving() == 0)
			{
				Registry.emitters.remove(this);
			}
		}
	}
}