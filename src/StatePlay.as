package  
{
	/**
	 * ...
	 * @author Puedes
	 * 
	 * Notes:
		 * PlayState is where the "gameplay" happens
		 * Runs the levels and their logic
		 * (Other states will be MenuState, GameOverState, PauseMenuState, OptionsMenuState, etc.)
	 */
	
	import org.flixel.*;
	import org.flixel.plugin.photonstorm.*;
	
	public class StatePlay extends FlxState
	{
		public var level:Level;
		public var hud:HUD;
		public var bg:Background;
		public var darkness:FlxSprite;
		public var lightSource:FlxSprite = new FlxSprite(0, 0);
		
		override public function create():void
		{
			super.create();
			
			FlxG.bgColor = 0xff000000;
			//FlxG.playMusic(AssetManager.musicBackgroundMusic, 1);
			FlxG.mouse.show(AssetManager.imageCursor, 2, -6, -6);
			
			Registry.projectiles = new ProjectileManager();
			Registry.weapons = new WeaponManager();
			Registry.emitters = new EmitterManager();
			Registry.decorations = new DecorationManager();
			Registry.interactives = new InteractiveManager();
			Registry.enemies = new EnemyManager();
			Registry.enemyprojectiles = new EnemyProjectileManager();
			Registry.enemyweapons = new EnemyWeaponManager();
			Registry.player = new Player();
			
			hud = new HUD();
			
			level = new Level1();
			FlxG.worldBounds = level.bounds();
			add(level);
			
			add(Registry.player);
			add(Registry.projectiles);
			add(Registry.weapons);
			add(Registry.enemies);
			add(Registry.enemyprojectiles);
			add(Registry.enemyweapons);
			add(Registry.emitters);
			add(Registry.decorations);
			add(Registry.interactives);
			
			FlxG.camera.setBounds(0, 0, level.width(), level.height());
			FlxG.camera.follow(Registry.player, FlxCamera.STYLE_PLATFORMER);
			
			/*darkness = new FlxSprite();
			darkness.makeGraphic(level.width(), level.height(), 0xF000075F);
			darkness.scrollFactor = new FlxPoint(0, 0);
			lightSource.makeGraphic(75, 75, 0xAAFFF55C);
			lightSource.blend = "subtract";
			add(darkness);
			add(lightSource);
			lightSource.blend = "screen";*/
			
			add(hud);
		}
		
		override public function update():void
		{
			super.update();
			
			if (FlxG.keys.justPressed("SPACE"))
			{
				remove(level);
				level = new Level3();
				add(level);
			}
			
			//lightSource.x = Registry.player.getMidpoint().x - (lightSource.width / 2);
			//lightSource.y = Registry.player.getMidpoint().y - (lightSource.height / 2);
			
			for each (var PROJECTILE in Registry.projectiles.members)
			{
				FlxG.overlap(level, PROJECTILE, hitLevelProjectileNotify, hitLevelProjectileProcess);
			}
			
			for each (var PARTICLE in Registry.emitters.members)
			{
				FlxG.collide(level, Registry.emitters, hitLevelParticle);
			}
			
			FlxG.collide(level, Registry.player);
			FlxG.collide(level, Registry.enemies, hitWallSpider);
			
			FlxG.overlap(level, Registry.decorations);
			FlxG.collide(Registry.player, Registry.enemies, hitPlayerEnemy);
			FlxG.overlap(Registry.enemies, Registry.projectiles, hitEnemyProjectile, hitEnemyProjectileProcess);
		}
		
		public function hitPlayerEnemy(PLAYER:Player, ENEMY:Enemy):void
		{
			ENEMY.attack(PLAYER);
		}
		
		public function hitLevelProjectileProcess(TILEMAP:FlxTilemap, PROJECTILE:Projectile):Boolean
		{
			PROJECTILE.setStoredVelocity(PROJECTILE.velocity);
			PROJECTILE.setStoredAcceleration(PROJECTILE.acceleration);
			return FlxObject.separate(TILEMAP, PROJECTILE);
		}
		
		public function hitLevelProjectileNotify(TILEMAP:FlxTilemap, PROJECTILE:Projectile):void
		{
			PROJECTILE.collideLevel();
		}
		
		public function hitLevelParticle(TILEMAP:FlxTilemap, PARTICLE:FlxParticle):void
		{
			if (PARTICLE is ExplosionParticle)
			{
				(PARTICLE as ExplosionParticle).collideLevel();
			}
		}
		
		public function hitWallSpider(TILEMAP:FlxTilemap, ENEMY:Enemy):void
		{
			if (ENEMY is EnemySlug && ENEMY.isTouching(FlxObject.RIGHT))
			{
				ENEMY.velocity.x = -20;
				ENEMY.scale.x = -1;
				ENEMY.facing = FlxObject.LEFT;
			}
			if (ENEMY is EnemySlug && ENEMY.isTouching(FlxObject.LEFT))
			{
				ENEMY.velocity.x = 20;
				ENEMY.scale.x = 1;
				ENEMY.facing = FlxObject.RIGHT;
			}
		}
		
		public function hitEnemyProjectileProcess(ENEMY:Enemy, PROJECTILE:Projectile):Boolean
		{
			PROJECTILE.velocity.x = 0;
			PROJECTILE.velocity.y = 0;
			ENEMY.velocity = new FlxPoint();
			return true;//FlxObject.separate(ENEMY, PROJECTILE);
		}
		
		public function hitEnemyProjectile(ENEMY:Enemy, PROJECTILE:Projectile):void
		{
			ENEMY.hitProjectile(PROJECTILE);
			PROJECTILE.collideEnemy(ENEMY);
		}
	}
}