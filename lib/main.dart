import 'package:flame/game.dart';
import 'package:flutter/material.dart';
import 'package:space_shooter/game.dart';

void main() {
  runApp(
    GameWidget(
      game: SpaceShooter(),
    ),
  );
}
