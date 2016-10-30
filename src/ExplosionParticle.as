package  
{
	/**
	 * ...
	 * @author Richard the Bunny-Hearted
	 */
	
	import org.flixel.*;
	
	public class ExplosionParticle extends FlxSprite
	{
		public function ExplosionParticle(ANGLE:Number) 
		{
			super();
			
			makeGraphic(1, 1, 0xFFFFFFFF);
			velocity.x = Math.cos(ANGLE * Math.PI / 180) * 50;
			velocity.y = Math.sin(ANGLE * Math.PI / 180) * 50;
			exists = true;
		}
		
		override public function update():void
		{
			super.update();
		}
		
		public function collideLevel():void
		{
			kill();
		}
	}
}