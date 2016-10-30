package
{
	/**
	* ...
	* @author puedes
	*/
	
	import org.flixel.*;
	
	public class Background extends FlxSprite
	{
		public function Background(X:Number, Y:Number, IMAGE:Class, SCROLL_X:Number, SCROLL_Y:Number)
		{
			super(X, Y);
			loadGraphic(IMAGE);
			scrollFactor.x = SCROLL_X;
			scrollFactor.y = SCROLL_Y;
			solid = false;
        }
    }
}