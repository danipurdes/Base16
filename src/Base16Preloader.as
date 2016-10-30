package  
{
	/**
	 * ...
	 * @author Richard the Bunny-Hearted
	 */
	
	import flash.display.*;
	import flash.text.*;
	import org.flixel.system.*;
	
	public class Base16Preloader extends FlxPreloader
	{
		public function Base16Preloader() 
		{
			className = "GameEngine";
			super();
		}
		
		override protected function create():void
		{
			_buffer = new Sprite();
			_buffer.width = stage.stageWidth;
			_buffer.height = stage.stageHeight;
			_buffer.scaleX = 2;
			_buffer.scaleY = 2;
			addChild(_buffer);
			
			_width = stage.stageWidth / _buffer.scaleX;
			_height = stage.stageHeight / _buffer.scaleY;
			_buffer.addChild(new Bitmap(new BitmapData(_width, _height, false, 0xFF59003A)));
			
			_bmpBar = new Bitmap(new BitmapData(1, 7, false, 0xFFFFFF));
			_bmpBar.x = 4;
			_bmpBar.y = _height - 11;
			_buffer.addChild(_bmpBar);
			
			_text = new TextField();
			_text.defaultTextFormat = new TextFormat("system", 8, 0xFFFFFF);
			_text.embedFonts = true;
			_text.selectable = false;
			_text.multiline = false;
			_text.x = 2;
			_text.y = _height - 11;
			_text.width = 80;
			_buffer.addChild(_text);
		}
		
		override protected function update(Percent:Number):void
		{
			_bmpBar.scaleX = Percent * (_width - 8);
			if (Percent >= 1)
			{
				_text.text = "Completed";
				_text.setTextFormat(_text.defaultTextFormat);
				return;
			}
			
			_text.text = "Loading: " + Math.floor(Percent * 100) + "%";
			_text.setTextFormat(_text.defaultTextFormat);
		}
	}
}