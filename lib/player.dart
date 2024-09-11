import 'dart:async';
import 'package:flame/components.dart';
import 'package:space_shooter/bullet.dart';
import 'package:space_shooter/game.dart';

class Player extends SpriteAnimationComponent with HasGameRef<SpaceShooter> {
  late final SpawnComponent bulletSpawner;
  Player()
      : super(
          size: Vector2(50, 100),
          anchor: Anchor.center,
        );
  @override
  FutureOr<void> onLoad() async {
    // TODO: implement onLoad
    animation = await gameRef.loadSpriteAnimation(
      'player.png',
      SpriteAnimationData.sequenced(
        amount: 4,
        stepTime: .1,
        textureSize: Vector2(32, 48),
      ),
    );
    position = gameRef.size / 2;
    bulletSpawner = SpawnComponent(
      period: .2,
      selfPositioning: true,
      factory: (index) {
        return Bullet(
          position: position +
              Vector2(
                0,
                -height / 2,
              ),
        );
      },
      autoStart: false,
    );
    gameRef.add(bulletSpawner);
    return super.onLoad();
  }

  void startShooting() {
    // TODO
    bulletSpawner.timer.start();
  }

  void stopShooting() {
    // TODO
    bulletSpawner.timer.stop();
  }

  void move(Vector2 delta) {
    position.add(delta);
  }
}
