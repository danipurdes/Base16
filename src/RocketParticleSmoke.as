package  
{
	/**
	 * ...
	 * @author Spiggly
	 */
	
	import org.flixel.*;
	
	public class RocketParticleSmoke extends FlxParticle
	{
		public function RocketParticleSmoke()
		{
			super();
			
			exists = false;
			
			var randWidth:uint = Math.ceil(Math.random() * 2);
			var randHeight:uint = Math.ceil(Math.random() * 2);
			
			var randNumb:Number = Math.ceil(Math.random() * 3);
			switch(randNumb)
			{
				case 1: makeGraphic(randWidth, randWidth, 0xBBA9A9A9); break;
				case 2: makeGraphic(randWidth, randWidth, 0xBB474747); break;
				case 3: makeGraphic(randWidth, randWidth, 0xBB838383); break;
			}
		}
		
		override public function onEmit():void
		{
			super.onEmit();
			
			solid = false;
			exists = true;
		}
	}
}