package  
{
	/**
	 * ...
	 * @author puedes
	 */
	
	import org.flixel.*;
	
	public class Level extends FlxGroup
	{
		public var walls:FlxTilemap = new FlxTilemap();
		public var tileImage:Class;
		public var enemyMap:String = new String();
		public var interactiveMap:String = new String();
		public var decorationMap:String = new String;
		public var background:Background;
		
		public function Level(WALLS:Class, TILE_IMAGE:Class, BACKGROUND:Class, ENEMYMAP:Class, DECORATIONMAP:Class)
		{
			super();
			
			loadLevel(WALLS, TILE_IMAGE, BACKGROUND, ENEMYMAP, DECORATIONMAP);
		}
		
		public function loadLevel(WALLS:Class, TILE_IMAGE:Class, BACKGROUND:Class, ENEMYMAP:Class, DECORATIONMAP:Class):void
		{
			Registry.erase();
			remove(background);
			background = new Background(0, 0, BACKGROUND, 0, 0);
			add(background);
			
			walls.loadMap(new WALLS, TILE_IMAGE, 8, 8);
			add(walls);
			
			var wallData:String = new WALLS;
			var wallRows:Array = wallData.split("\n");
			for (var py:int = 0; py < wallRows.length; py++)
			{
				var wallCols:Array = wallRows[py].split(",");
				for (var px:int = 0; px < wallCols.length; px++)
				{
					if (wallCols[px] == "P")
					{
						Registry.player.x = px * 8;
						Registry.player.y = (py - 1) * 8;
					}
				}
			}
			
			var decorationData:String = new DECORATIONMAP;
			var decorationRows:Array = decorationData.split("\n");
			for (var dy:int = 0; dy < decorationRows.length; dy++)
			{
				var decorationCols:Array = decorationRows[dy].split(",");
				for (var dx:int = 0; dx < decorationCols.length; dx++)
				{
					var deco:Decoration = new Decoration(dx * 8, dy * 8, null);
					if (decorationCols[dx] == 1)
					{
						deco.loadGraphic(AssetManager.imageBarrel1);
						Registry.decorations.add(deco);
					}
					if (decorationCols[dx] == 2)
					{
						deco.loadGraphic(AssetManager.imageCorpse1);
						Registry.decorations.add(deco);
					}
					if (decorationCols[dx] == 3)
					{
						deco.loadGraphic(AssetManager.imageCorpse2);
						Registry.decorations.add(deco);
					}
					if (decorationCols[dx] == 4)
					{
						deco.loadGraphic(AssetManager.imageCorpse3);
						Registry.decorations.add(deco);
					}
					if (decorationCols[dx] == 5)
					{
						deco.loadGraphic(AssetManager.imageCorpse4);
						Registry.decorations.add(deco);
					}
					if (decorationCols[dx] == 6)
					{
						deco.loadGraphic(AssetManager.imageSkull);
						Registry.decorations.add(deco);
					}
					if (decorationCols[dx] == 7)
					{
						deco.loadGraphic(AssetManager.imagePot);
						Registry.decorations.add(deco);
					}
					if (decorationCols[dx] == 8)
					{
						deco.loadGraphic(AssetManager.imagePlant);
						Registry.decorations.add(deco);
					}
				}
			}
			
			var enemyData:String = new ENEMYMAP;
			var enemyRows:Array = enemyData.split("\n");
			for (var ey:int = 0; ey < enemyRows.length; ey++)
			{
				var enemyCols:Array = enemyRows[ey].split(",");
				for (var ex:int = 0; ex < enemyCols.length; ex++)
				{
					if (enemyCols[ex] == 1)
					{
						Registry.enemies.add(new EnemySlug(ex * 8, ey * 8));
					}
					if (enemyCols[ex] == 2)
					{
						Registry.enemies.add(new EnemySpider(ex * 8, ey * 8));
					}
					if (enemyCols[ex] == 3)
					{
						Registry.enemies.add(new EnemyTrooper(ex * 8, ey * 8));
					}
					if (enemyCols[ex] == 4)
					{
						Registry.enemies.add(new EnemyFlyingKiller(ex * 8, ey * 8));
					}
				}
			}
		}
		
		public function bounds():FlxRect
		{
			return walls.getBounds();
		}
		public function width():Number
		{
			return walls.getBounds().width;
		}
		public function height():Number
		{
			return walls.getBounds().height;
		}
	}
}