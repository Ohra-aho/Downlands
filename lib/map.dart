import 'dart:ffi';

import 'package:downlands/player.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:downlands/entity.dart';
import 'package:provider/provider.dart';
import 'package:logger/logger.dart';


class VEs extends ChangeNotifier {
  List<Entity> visibleEntities = [];
  void Update() {
    notifyListeners();
  }
}

var visibleEs = VEs();


//Grid source code
class Grid extends StatefulWidget {
  @override
  _GridState createState() => _GridState();
}

class _GridState extends State<Grid> {

  @override
  void initState() {
    super.initState();
    visibleEs.visibleEntities.add(player);
  }

  @override
  Widget build(BuildContext context) {
    return  Expanded( 
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [for(var i = 1; i < 6; i++) GridRow(column: i)],
                ),
              );
  }
}

class GridRow extends StatefulWidget {
  final int column;

  const GridRow({Key? key, required this.column}) : super(key: key);

  @override
  _GridRowState createState() => _GridRowState();
}

class _GridRowState extends State<GridRow> {
  late int column;
  final logger = Logger();
  Entity? RenderSquare(List<Entity> list, int x, int y) {
    for(Entity e in list) {
      if(e.x == x && e.y == y) {
        return e;
      }
    }
    return null;
  }

  Entity ss() {
    for(Entity e in visibleEs.visibleEntities) {
      return e;
    }
    return PlayerData();
  }

  @override
  void initState() {
    super.initState();
    column = widget.column; // Get the value passed from GridRow constructor
  }
  @override
  Widget build(BuildContext context) {
    return Consumer<VEs>(builder: (context, playerData, child){
              final List<Entity> entities = playerData.visibleEntities;
              return Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  for(var i = 1; i < 6; i++) Square(x: i, y: column, occupant: RenderSquare(entities, i, column))
                ],
      );});
    }
  }



class Square extends StatefulWidget {
  final int x;
  final int y;
  final Entity? occupant;
  const Square({Key? key, required this.x, required this.y, this.occupant}) : super(key: key);

  @override
  _SquareState createState() => _SquareState();
}

class _SquareState extends State<Square> {
  late int x;
  late int y;
  late Icon icon;
  late Entity? occupant;
  late Widget? occupantSprite;
  final logger = Logger();

  Widget? displayOccupant() {
      if(occupant != null && occupant?.x == x && occupant?.y == y)  {
        occupantSprite = occupant?.sprite;
        return occupantSprite;
      }
      else {
        occupant = null;
        return icon;
      }
  }

  @override
  void initState() {
    super.initState();
    icon = Icon(Icons.border_outer);
    x = widget.x;
    y = widget.y;
    occupant = widget.occupant;
  }

  @override
  Widget build(BuildContext context) { 
    icon = Icon(Icons.border_outer);
    x = widget.x;
    y = widget.y;
    occupant = widget.occupant;
    return (
      Container(child: displayOccupant(),)
    );
    
  }

}