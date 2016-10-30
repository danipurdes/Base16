package  
{
	/**
	 * ...
	 * @author Richard the Bunny-Hearted
	 */
	
	import org.flixel.*;
	import org.flixel.plugin.photonstorm.*;
	
	public class DamageText extends FlxBitmapFont
	{
		private var rad:Number = 0;
		private var damp:Number = 100;
		private var lifeSpan:Number = 0.5;
		
		public function DamageText(X:Number, Y:Number, DAMAGE:Number)
		{
			super(AssetManager.imageBitmapFontDamage, 5, 7, "0123456789", 10, 1);
			x = X;
			y = Y;
			text = DAMAGE + "";
			velocity.y = -45;
		}
		
		override public function update():void
		{
			velocity.x = damp * Math.sin(rad);
			rad += Math.PI / 12;
			damp -= 0.5;
			
			if (damp <= 0)
			{
				damp = 0;
			}
			
			lifeSpan -= FlxG.elapsed;
			if (lifeSpan <= 0)
			{
				FlxG.state.remove(this);
			}
		}
	}
}