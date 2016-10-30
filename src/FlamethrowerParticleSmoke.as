package  
{
	/**
	 * ...
	 * @author Spiggly
	 */
	
	import org.flixel.*;
	
	public class FlamethrowerParticleSmoke extends FlxParticle
	{
		public function FlamethrowerParticleSmoke()
		{
			//The last guy to forget this... they call him "Three-Finger Pete," don't be that guy
			super();
			
			//Game loop won't draw particle until it is emitted
			exists = false;
			
			//For smoke rising effect
			acceleration.y = -75;
			acceleration.x = Math.ceil(Math.random() * 50) - 25;
			
			//For particles with no image file
			var randWidth:uint = Math.ceil(Math.random() * 6); //Sets random width
			var randHeight:uint = Math.ceil(Math.random() * 6); //Sets random height
			
			var randNumb:Number = Math.ceil(Math.random() * 6);
			switch(randNumb)
			{
				case 1: makeGraphic(randWidth, randWidth, 0xAAA9A9A9); break;
				case 2: makeGraphic(randWidth, randWidth, 0xAA474747); break;
				case 3: makeGraphic(randWidth, randWidth, 0xAA838383); break;
				case 4: makeGraphic(randWidth, randWidth, 0x88C5C5C5); break;
				case 5: makeGraphic(randWidth, randWidth, 0x889262626); break;
				case 6: makeGraphic(randWidth, randWidth, 0x881E1E1E); break;
			}
			//makeGraphic is the poor man's loadGraphic, use it to set sprite as a colored rectangle
		}
		
		override public function onEmit():void
		{
			//After all that we've been through, and you forgot to call super()? You have betrayed my trust! Boo-hoo, boo-hoo!
			super.onEmit();
			
			solid = false;
			
			//Game loop will stop ignoring the Forever Alone particle and will draw and update it
			exists = true;
		}
	}
}