import 'dart:async';

import 'package:flame/components.dart';
import 'package:flame/events.dart';
import 'package:flame/game.dart';
import 'package:space_shooter/player.dart';

class SpaceShooter extends FlameGame with PanDetector {
  late Player player;
  @override
  FutureOr<void> onLoad() async {
    // TODO: implement onLoad
    await super.onLoad();
    final playerSprite = await loadSprite('player-sprite.png');
    player = Player()
      ..sprite = playerSprite
      ..position = size / 2
      ..width = 50
      ..height = 100
      ..anchor = Anchor.center;
    add(player);
  }

  @override
  void onPanUpdate(DragUpdateInfo info) {
    // TODO: implement onPanUpdate
    super.onPanUpdate(info);
    player.move(info.delta.global);
  }
}
