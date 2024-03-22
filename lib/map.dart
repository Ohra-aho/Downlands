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
                  children: [for(var i = 0; i < 5; i++) GridRow(column: i)],
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
  Entity? RenderSquare(List<Entity> list, int index) {
    for(Entity e in list) {
      if(e.index == index) {
        logger.d(e.index);
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
                  for(var i = 1; i < 6; i++) Square(index: i+column*5, occupant: RenderSquare(entities, i+column*5))
                ],
      );});
    }
  }



class Square extends StatefulWidget {
  final int index;
  final Entity? occupant;
  const Square({Key? key, required this.index, this.occupant}) : super(key: key);

  @override
  _SquareState createState() => _SquareState();
}

class _SquareState extends State<Square> {
  late int index;
  late Icon icon;
  late Entity? occupant;
  late Widget? occupantSprite;
  final logger = Logger();

  Widget? displayOccupant() {
    logger.d("Index: $index Occupant: ${occupant?.index}");
      if(occupant != null && occupant?.index == index) {
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
    index = widget.index;
    occupant = widget.occupant;
  }

  @override
  Widget build(BuildContext context) { 
    icon = Icon(Icons.border_outer);
    index = widget.index;
    occupant = widget.occupant;
    return (
      Container(child: displayOccupant(),)
    );
    
  }

}