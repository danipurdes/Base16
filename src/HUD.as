package  
{
	/**
	 * ...
	 * @author Puedes
	 */
	
	import org.flixel.*;
	import org.flixel.plugin.photonstorm.*;

	public class HUD extends FlxGroup
	{
		public var hitpointsBar:FlxBar;
		public var ammoText:FlxBitmapFont;
		public var ammoBar:FlxBar;
		
		public function HUD() 
		{
			super();
			
			var rectangle:FlxSprite = new FlxSprite(0, 0);
			rectangle.makeGraphic(65, 28, 0xFFA9A9A9);
			rectangle.scrollFactor = new FlxPoint();
			add(rectangle);
			
			hitpointsBar = new FlxBar(FlxG.width - 105, 5, FlxBar.FILL_RIGHT_TO_LEFT, 100, 8, Registry.player, "curHitpoints", 0, Registry.player.maxHitpoints, false);
			hitpointsBar.createFilledBar(0xFFFF0000, 0xFF00FF00, false);
			hitpointsBar.scrollFactor = new FlxPoint();
			add(hitpointsBar);
			
			ammoText = new FlxBitmapFont(AssetManager.imageBitmapFontDanny, 7, 8, "ABCDEFGHIJKLMNOPQRSTUVWXYZ 0123456789@", 38, 1);
			ammoText.text = "0";
			ammoText.x = 5;
			ammoText.y = 5;
			ammoText.customSpacingX = 1;
			ammoText.customSpacingY = 1;
			ammoText.align = FlxBitmapFont.ALIGN_LEFT;
			ammoText.scrollFactor = new FlxPoint();
			add(ammoText);
			
			ammoBar = new FlxBar(5, 15, FlxBar.FILL_LEFT_TO_RIGHT, 55, 5, Registry.weapons.getWeapon(), "curAmmo", 0, Registry.weapons.getWeapon().clipSize, false);
			ammoBar.createFilledBar(0xFF000000, 0xFFFFFFFF, true, 0xFF000000);
			ammoBar.scrollFactor = new FlxPoint();
			add(ammoBar);
		}
		
		override public function update():void
		{
			ammoText.text = " ";
			ammoText.text += Registry.weapons.getWeapon().curAmmo;
			for (var i:int = 0; i < 3 - Registry.weapons.getWeapon().curAmmo.toString().length; i++)
				ammoText.text += " ";
			ammoText.text += " ";
			for (var j:int = 0; j < 3 - (Registry.weapons.getWeapon().usesTotalAmmo ? Registry.weapons.getWeapon().totalAmmo.toString().length : 1); j++)
				ammoText.text += " ";
			ammoText.text += (Registry.weapons.getWeapon().usesTotalAmmo ? Registry.weapons.getWeapon().totalAmmo : "@");
			ammoText.text = ammoText.text.substring(1);
			
			ammoBar.setParent(Registry.weapons.getWeapon(), "curAmmo", false);
			ammoBar.setRange(0, Registry.weapons.getWeapon().clipSize);
			
			super.update();
		}
	}
}