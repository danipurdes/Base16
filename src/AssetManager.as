package
{
	/**
	 * ...
	 * @author Puedes
	 */
	
	public class AssetManager
	{
		//Images
		[Embed(source = "assets/cursor.png")] public static var imageCursor:Class;
		[Embed(source = "assets/cursorPrecise.png")] public static var imageCursorPrecise:Class;
		
		[Embed(source = "assets/bitmapFont.png")] public static var imageBitmapFontSmall:Class;
		[Embed(source = "assets/bitmapFontDanny.png")] public static var imageBitmapFontDanny:Class;
		[Embed(source = "assets/bitmapFontDamage.png")] public static var imageBitmapFontDamage:Class;
		
		//Levels
		[Embed(source = "csv/levelTest.csv", mimeType = "application/octet-stream")] public static var level_test:Class;
		[Embed(source = "csv/levelTest_enemies.csv", mimeType = "application/octet-stream")] public static var level_test_enemies:Class;
		[Embed(source = "csv/levelTest_decorations.csv", mimeType = "application/octet-stream")] public static var level_test_decorations:Class;
		[Embed(source = "csv/levelTest2.csv", mimeType = "application/octet-stream")] public static var level_test2:Class;
		[Embed(source = "csv/levelTest_enemies2.csv", mimeType = "application/octet-stream")] public static var level_test_enemies2:Class;
		[Embed(source = "csv/levelTest_decorations2.csv", mimeType = "application/octet-stream")] public static var level_test_decorations2:Class;
		[Embed(source = "csv/levelTest3.csv", mimeType = "application/octet-stream")] public static var level_test3:Class;
		
		//Backgrounds
		[Embed(source = "assets/backgrounds/stars1.png")] public static var imageBackgroundStars1:Class;
		[Embed(source = "assets/backgrounds/stars2.png")] public static var imageBackgroundStars2:Class;
		
		//Tilemaps
		[Embed(source = "assets/tile.png")] public static var imageTiles:Class;
		[Embed(source = "assets/tileClean.png")] public static var imageTilesClean:Class;
		
		//Suits
		[Embed(source = "assets/suits/ssRobitBasic.png")] public static var imageSuitBasic:Class;
		[Embed(source = "assets/suits/ssRobitIsaac.png")] public static var imageSuitIsaac:Class;
		[Embed(source = "assets/suits/ssRobitElite.png")] public static var imageSuitElite:Class;
		[Embed(source = "assets/suits/ssRobitDoom.png")] public static var imageSuitDoom:Class;
		[Embed(source = "assets/suits/ssRobitPressure.png")] public static var imageSuitJim:Class;
		
		//Weapons
		[Embed(source = "assets/pistol/pistolGun.png")] public static var imagePistolGun:Class;
		[Embed(source = "assets/pistol/pistolProjectile.png")] public static var imagePistolProjectile:Class;
		
		[Embed(source = "assets/flamethrower/flameGun.png")] public static var imageFlamethrowerGun:Class;
		[Embed(source = "assets/flamethrower/flameProjectile.png")] public static var imageFlamethrowerProjectile:Class;
		
		[Embed(source = "assets/spreadgun/spreadGun.png")] public static var imageSpreadGun:Class;
		[Embed(source = "assets/spreadgun/spreadProjectile.png")] public static var imageSpreadGunProjectile:Class;
		
		[Embed(source = "assets/rocket/rocketGun.png")] public static var imageRocketLauncherGun:Class;
		[Embed(source = "assets/rocket/rocketProjectile.png")] public static var imageRocketLauncherProjectile:Class;
		
		[Embed(source = "assets/grenade/grenadeGun.png")] public static var imageGrenadeLauncherGun:Class;
		[Embed(source = "assets/grenade/grenadeProjectile.png")] public static var imageGrenadeLauncherProjectile:Class;
		
		[Embed(source = "assets/stickygun/stickyGun.png")] public static var imageStickyBombGun:Class;
		[Embed(source = "assets/stickygun/stickyProjectile.png")] public static var imageStickyBombProjectile:Class;
		
		[Embed(source = "assets/minigun/miniGun.png")] public static var imageMiniGun:Class;
		[Embed(source = "assets/minigun/miniGunProjectile.png")] public static var imageMiniGunProjectile:Class;
		
		[Embed(source = "assets/sawgun/sawGun.png")] public static var imageSawGun:Class;
		[Embed(source = "assets/sawgun/sawProjectile.png")] public static var imageSawProjectile:Class;
		
		//Enemies
		[Embed(source = "assets/enemies/spiderLittle.png")] public static var imageEnemySpider:Class;
		[Embed(source = "assets/enemies/slugLittle.png")] public static var imageEnemySlug:Class;
		[Embed(source = "assets/enemies/AlienTrooper.png")] public static var imageEnemyTrooper:Class;
		[Embed(source = "assets/enemies/AirKiller.png")] public static var imageEnemyFlyingKiller:Class;
		
		//Enemy Weapons
		[Embed(source = "assets/enemyweapons/EnemyPistol.png")] public static var imageEnemyPistol:Class;
		
		//Decorations
		[Embed(source = "assets/decoration/barrel1.png")] public static var imageBarrel1:Class;
		[Embed(source = "assets/decoration/corpse1.png")] public static var imageCorpse1:Class;
		[Embed(source = "assets/decoration/corpse2.png")] public static var imageCorpse2:Class;
		[Embed(source = "assets/decoration/corpse3.png")] public static var imageCorpse3:Class;
		[Embed(source = "assets/decoration/corpse4.png")] public static var imageCorpse4:Class;
		[Embed(source = "assets/decoration/skull.png")] public static var imageSkull:Class;
		[Embed(source = "assets/decoration/pot.png")] public static var imagePot:Class;
		[Embed(source = "assets/decoration/plant.png")] public static var imagePlant:Class;
		
		//Sounds
		[Embed(source = "assets/pistol/pistolFiring.mp3")] public static var soundPistolProjectileFired:Class;
		[Embed(source = "assets/flamethrower/flameProjectileFired.mp3")] public static var soundFlamethrowerProjectileFired:Class;
		
		//Music
		[Embed(source = "assets/music/bgBase16.mp3")] public static var musicBackgroundMusic:Class;
	}
}