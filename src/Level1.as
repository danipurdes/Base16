package  
{
	/**
	 * ...
	 * @author Richard the Bunny-Hearted
	 */
	
	import org.flixel.*;
	
	public class Level1 extends Level
	{
		private var WALLS:Class = AssetManager.level_test;
		private var TILE_IMAGE:Class = AssetManager.imageTilesClean;
		private var BACKGROUND:Class = AssetManager.imageBackgroundStars1;
		private var ENEMYMAP:Class = AssetManager.level_test_enemies;
		private var DECORATIONMAP:Class = AssetManager.level_test_decorations;
		
		public function Level1()
		{
			super(WALLS, TILE_IMAGE, BACKGROUND, ENEMYMAP, DECORATIONMAP);
		}
	}
}