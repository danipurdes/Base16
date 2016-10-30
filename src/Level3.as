package  
{
	/**
	 * ...
	 * @author Richard the Bunny-Hearted
	 */
	
	import org.flixel.*;
	
	public class Level3 extends Level
	{
		private var WALLS:Class = AssetManager.level_test3;
		private var TILE_IMAGE:Class = AssetManager.imageTilesClean;
		private var BACKGROUND:Class = AssetManager.imageBackgroundStars1;
		private var ENEMYMAP:Class = AssetManager.level_test_enemies2;
		private var DECORATIONMAP:Class = AssetManager.level_test_decorations2;
		
		public function Level3()
		{
			super(WALLS, TILE_IMAGE, BACKGROUND, ENEMYMAP, DECORATIONMAP);
		}
	}
}