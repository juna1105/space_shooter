import 'package:flame/components.dart';
import 'package:flutter/material.dart';

class Player extends SpriteComponent {
  final _paint = Paint()..color = Colors.white;
  @override
  void render(Canvas canvas) {
    // TODO: implement render
    super.render(canvas);
    canvas.drawRect(size.toRect(), _paint);
  }

  void move(Vector2 delta) {
    position.add(delta);
  }
}
