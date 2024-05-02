

import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:downlands/map.dart';
import 'package:downlands/player.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';
import 'package:downlands/entity.dart';

class Control extends StatefulWidget {
  @override
  _ControlState createState() => _ControlState();
}

class _ControlState extends State<Control> {
    bool visibleB = true;

  @override
  Widget build(BuildContext context) {

    return Container(
      color: Colors.grey,
      child: const Row(children: [
        BarHolder(health: 100, stamina: 200),
        Arrows()
        ],)
     );
  }
}
 
class Arrows extends StatelessWidget {
  const Arrows({super.key});

  @override
  Widget build(BuildContext context) {
    return 
      SizedBox( 
        width: MediaQuery.of(context).size.width * 0.33,
        child: const Column(children: [
        ArrowButton(x: 0, y: -1, direction: "up"),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ArrowButton(x: -1, y: 0, direction: "back"),
            ArrowButton(x: 0, y: 1, direction: "down"),
            ArrowButton(x: 1, y: 0, direction: "forward")
          ],
        )
     ],)
     );
  }
}

class ArrowButton extends StatelessWidget{

  final int x;
  final int y;
  final String direction;

  const ArrowButton({
    super.key, 
    required this.x, 
    required this.y, 
    required this.direction
    });

  Icon determineIcon() {
    Icon temp;
    switch(direction) {
        case "up" : temp = const Icon(Icons.arrow_upward);
        case "down" : temp = const Icon(Icons.arrow_downward);
        case "back" : temp = const Icon(Icons.arrow_back);
        case "forward" : temp = const Icon(Icons.arrow_forward);
        default: temp = const Icon(Icons.arrow_upward);
      }
    return temp;
  }

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
            onPressed: () => {
              player.changePosition(x, y),
              visibleEs.Update()
              },
            child: determineIcon()
          );
  }
}

class BarHolder extends StatefulWidget {
  final double health;
  final double stamina;

  const BarHolder({
    super.key,
    required this.health,
    required this.stamina
  });

  @override
  _Barholder createState() => _Barholder();
}

class _Barholder extends State<BarHolder> {
  late double health;
  late double stamina;

  @override
  void initState() {
    super.initState();
    health = widget.health;
    stamina = widget.stamina;
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width * 0.33,
      child: Column(
        children: [
          StatusBar(value: health, color: Colors.red), 
          StatusBar(value: stamina, color: Colors.green)
          ],
      ),
    );
  }
}

class StatusBar extends StatefulWidget {
  final double value;
  final Color color;

  const StatusBar({
    super.key,
    required this.value,
    required this.color
  });

  @override
  _StatusBar createState() => _StatusBar();
}

class _StatusBar extends State<StatusBar> {
  late double value;
  late Color color;

  @override
  void initState() {
    super.initState();
    value = widget.value;
    color = widget.color;
  }

  @override
  Widget build(BuildContext context) {
    //Barbackground
    return Container(
      width: 200,
      height: 20,
      padding: const EdgeInsets.all(2),
      color: Colors.black,
      child: Align(
        alignment: Alignment.centerLeft,
        child: ConstrainedBox(
          constraints: const BoxConstraints(
            minWidth: 1,
            minHeight: 20,
            maxWidth: 200,
            maxHeight: 20
          ),
          child: Container(
            color: color,
            width: value,
            height: 20,
          ),
        ),
      ),
    );
    
  }
}

