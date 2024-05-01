

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:downlands/map.dart';
import 'package:downlands/player.dart';
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
      child: Row(children: [Arrows()],)
     );
  }
}
 
class Arrows extends StatelessWidget {
  const Arrows({super.key});

  @override
  Widget build(BuildContext context) {
    return 
      const Column(children: [
        ArrowButton(x: 0, y: -1, direction: "up"),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ArrowButton(x: -1, y: 0, direction: "back"),
            ArrowButton(x: 0, y: 1, direction: "down"),
            ArrowButton(x: 1, y: 0, direction: "forward")
          ],
        )
     ],);
  }
}

class ArrowButton extends StatefulWidget {
  final int x;
  final int y; 
  final String direction;

  const ArrowButton({Key? key, 
  required this.x, 
  required this.y, 
  required this.direction}) : super(key: key);

  @override
  _ArrowButtonState createState() => _ArrowButtonState();
}

class _ArrowButtonState extends State<ArrowButton> {

  late int x;
  late int y;
  late String direction;

  Icon determineIcon() {
    Icon temp;
    switch(direction) {
        case "up" : temp = Icon(Icons.arrow_upward);
        case "down" : temp = Icon(Icons.arrow_downward);
        case "back" : temp = Icon(Icons.arrow_back);
        case "forward" : temp = Icon(Icons.arrow_forward);
        default: temp = Icon(Icons.arrow_upward);
      }

    return temp;
    
  }

  @override
  void initState() {
    super.initState();
    x = widget.x;
    y = widget.y;
    direction = widget.direction;
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

