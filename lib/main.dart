import 'package:flutter/material.dart';

void main() => runApp(MaterialApp(
  home: Home()
));
  
class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
    appBar: AppBar(
      title: Text('Downlands'),
      centerTitle: true,
      ),
    body: Center(
      child: Column(children: [
        Grid(),
        Control()
      ],)
      ),
    );
  }
}


//Grid source code
class Grid extends StatefulWidget {
  @override
  _GridState createState() => _GridState();
}

class _GridState extends State<Grid> {

  @override
  Widget build(BuildContext context) {
    return Expanded( 
      child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <GridRow>[
        for(var i = 0; i < 5; i++) GridRow(),
      ],
    ),
    );
  }
}

class GridRow extends StatefulWidget {
  @override
  _GridRowState createState() => _GridRowState();
}

class _GridRowState extends State<GridRow> {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Icon>[
         for(var i = 0; i < 5; i++) Icon(Icons.border_outer),
      ],
    );
  }
}

//Control source code
class Control extends StatefulWidget {
  @override
  _ControlState createState() => _ControlState();
}

class _ControlState extends State<Control> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.grey,
      child: Column(children: [
        ElevatedButton(
          onPressed: () => {print("jfjfjfjfjfjjfj")},
          child: Icon(Icons.arrow_upward)
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
            onPressed: () => {print("jfjfjfjfjfjjfj")},
            child: Icon(Icons.arrow_back)
            ),
            ElevatedButton(
            onPressed: () => {print("jfjfjfjfjfjjfj")},
            child: Icon(Icons.arrow_downward)
            ),
            ElevatedButton(
            onPressed: () => {print("jfjfjfjfjfjjfj")},
            child: Icon(Icons.arrow_forward)
            ),
          ],
        )
     ],),
     );
  }
}




