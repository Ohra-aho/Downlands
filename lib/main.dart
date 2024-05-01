import 'package:downlands/controls.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:downlands/map.dart';
import 'package:downlands/player.dart';
import 'package:provider/provider.dart';
import 'package:downlands/entity.dart';


void main() {
  runApp(
    MaterialApp(home: Home()),
  );
}

  
class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<VEs>(
      create:(_)=>visibleEs,
      child: Scaffold(
        //Title and such ass
      appBar: AppBar(
        backgroundColor: Colors.grey,
        title: const Text('DOWNLANDS',
        style: TextStyle(
          fontSize: 40,
          decoration: TextDecoration.underline,
          color: Color.fromARGB(150, 99, 97, 255),
          shadows: <Shadow>[
            Shadow(
              offset: Offset(3.0, 3.0),
              blurRadius: 3.0,
              color: Color.fromARGB(255, 0, 0, 0),
          ),]
      )
      ),
      centerTitle: true,
      ),
    body: Center(
      child: Column(children: [
        Grid(),
        Control()
      ],)
      ),
    ),);
  }
}








