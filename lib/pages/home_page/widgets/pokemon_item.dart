import 'package:flutter/material.dart';

class PokemonItem extends StatelessWidget {
  final String name;
  final int index;
  final Color color;
  final Widget image;

  const PokemonItem({Key key, this.name, this.index, this.color, this.image})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        child: Stack(
          children: <Widget>[
            image,
          ],
        ),
        decoration: BoxDecoration(
          color: Colors.blueAccent,
          borderRadius: BorderRadius.all(
            Radius.circular(20),
          ),
        ),
      ),
    );
  }
}
