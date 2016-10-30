package  
{
	/**
	 * ...
	 * @author Richard the Bunny-Hearted
	 */
	
	import org.flixel.*;
	
	public class Level2 extends Level
	{
		private var WALLS:Class = AssetManager.level_test2;
		private var TILE_IMAGE:Class = AssetManager.imageTiles;
		private var BACKGROUND:Class = AssetManager.imageBackgroundStars2;
		private var ENEMYMAP:Class = AssetManager.level_test_enemies2;
		private var DECORATIONMAP:Class = AssetManager.level_test_decorations2;
		
		public function Level2() 
		{
			super(WALLS, TILE_IMAGE, BACKGROUND, ENEMYMAP, DECORATIONMAP);
		}
	}
}