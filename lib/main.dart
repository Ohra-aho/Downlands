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
      appBar: AppBar(
        title: const Text('DOWNLANDS',
        style: TextStyle(
          fontSize: 40,
          decoration: TextDecoration.underline,
          color: Color.fromARGB(255, 99, 97, 255),
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



//Control source code
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
      child: Column(children: [
          ElevatedButton(
            onPressed: () => {
              player.changePosition(0, -1),
              visibleEs.Update()
            },
          child: const Icon(Icons.arrow_upward),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
            onPressed: () => {
              player.changePosition(-1, 0),
              visibleEs.Update()
              },
            child: Icon(Icons.arrow_back)
            ),
            ElevatedButton(
            onPressed: () => {
              player.changePosition(0, 1),
              visibleEs.Update()
              },
            child: Icon(Icons.arrow_downward)
            ),
            ElevatedButton(
            onPressed: () => {
              player.changePosition(1, 0),
              visibleEs.Update()
              },
            child: Icon(Icons.arrow_forward)
            ),
          ],
        )
     ],),
     );
  }
}




