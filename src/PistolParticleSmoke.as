package  
{
	/**
	 * ...
	 * @author Spiggly
	 */
	
	import org.flixel.*;
	
	public class PistolParticleSmoke extends FlxParticle
	{
		public function PistolParticleSmoke()
		{
			//The last guy to forget this... they call him "Three-Finger Pete," don't be that guy
			super();
			
			//Game loop won't draw particle until it is emitted
			exists = false;
			
			//For particles with no image file
			var randWidth:uint = Math.ceil(Math.random() * 5); //Sets random width
			var randHeight:uint = Math.ceil(Math.random() * 5); //Sets random height
			makeGraphic(randWidth, randWidth, 0xAAB1B1B1); //makeGraphic is the poor man's loadGraphic, use it to set sprite as a colored rectangle
		}
		
		override public function onEmit():void
		{
			//After all that we've been through, and you forgot to call super()? You have betrayed my trust! Boo-hoo, boo-hoo!
			super.onEmit();
			
			//Game loop will stop ignoring the Forever Alone particle and will draw and update it
			exists = true;
		}
	}
}