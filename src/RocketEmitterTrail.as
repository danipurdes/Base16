package  
{
	import org.flixel.*;
	/**
	 * ...
	 * @author ...
	 */
	public class RocketEmitterTrail extends FlxEmitter
	{
		public var parentRocket:RocketProjectile;
		
		public function RocketEmitterTrail(pRocket:RocketProjectile) 
		{
			super(pRocket.x, pRocket.y, 5)
			parentRocket = pRocket;
		}
		override public function update():void
		{
			super.update();
			
			x = parentRocket.x;
			y = parentRocket.y;
		}	
	}
}