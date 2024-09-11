import 'dart:async';

import 'package:flame/components.dart';
import 'package:flame/events.dart';
import 'package:flame/experimental.dart';
import 'package:flame/game.dart';
import 'package:flame/parallax.dart';
import 'package:flutter/painting.dart';
import 'package:space_shooter/enemy.dart';
import 'package:space_shooter/player.dart';

class SpaceShooter extends FlameGame with PanDetector, HasCollisionDetection {
  late Player player;
  @override
  FutureOr<void> onLoad() async {
    // TODO: implement onLoad
    await super.onLoad();
    final parallax = await loadParallaxComponent(
      [
        ParallaxImageData('stars_0.png'),
        ParallaxImageData('stars_1.png'),
        ParallaxImageData('stars_2.png'),
      ],
      baseVelocity: Vector2(0, -5),
      repeat: ImageRepeat.repeat,
      velocityMultiplierDelta: Vector2(0, 5),
    );
    add(parallax);
    player = Player();
    add(
      SpawnComponent(
        factory: (index) {
          return Enemy();
        },
        period: 1,
        area: Rectangle.fromLTWH(0, 0, size.x, -Enemy.enemySize),
      ),
    );
    add(player);
  }

  @override
  void onPanUpdate(DragUpdateInfo info) {
    // TODO: implement onPanUpdate
    super.onPanUpdate(info);
    player.move(info.delta.global);
  }

  @override
  void onPanStart(DragStartInfo info) {
    player.startShooting();
  }

  @override
  void onPanEnd(DragEndInfo info) {
    player.stopShooting();
  }
}
