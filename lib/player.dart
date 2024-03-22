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
  late int index;

  @override
  void initState() {
    sprite = Icon(Icons.accessibility);
    index = player.index;
  }

  @override
  Widget build(BuildContext context) {
    return(// Access the index from PlayerData
        sprite
    );
  }
}


class PlayerData implements Entity  {
  @override
  int index = 23;
  @override
  Widget sprite = PlayerSprite();

  final logger = Logger();

  void changePosition(int newIndex) {
    index += newIndex;
  }
  int getIndex() {
    return index;
  }

  
}