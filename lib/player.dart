import 'dart:ffi';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:downlands/entity.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:logger/logger.dart';

PlayerData player = PlayerData();

class PlayerSprite extends StatefulWidget {
  @override
  _PlayerSprite createState() => _PlayerSprite();
}

class _PlayerSprite extends State<PlayerSprite> {
  late Icon sprite;
  late int x;
  late int y;

  @override
  void initState() {
    sprite = Icon(Icons.accessibility);
    x = player.x;
    y = player.y;
  }

  @override
  Widget build(BuildContext context) {
    return(// Access the index from PlayerData
        sprite
    );
  }
}


class PlayerData implements Entity  {
  //Player coordinates on the map
  @override
  int x = 3;
  @override
  int y = 5;
  @override
  Widget sprite = PlayerSprite();

  //Each step consumes one stamina
  int stamina = 10;
  final logger = Logger();

  void changePosition(int newX, int newY) {
    x += newX;
    y += newY;
  }
  

  
}