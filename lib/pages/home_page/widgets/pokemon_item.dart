import 'package:app_pokedex/consts/const_app.dart';
import 'package:flutter/material.dart';

class PokemonItem extends StatelessWidget {
  final String name;
  final String number;
  final int index;
  final Color color;
  final Widget image;
  final List<String> types;

  Widget setTypes() {
    List<Widget> list = [];
    types.forEach((type) {
      list.add(
        Column(
          children: <Widget>[
            Container(
              padding: EdgeInsets.symmetric(horizontal: 12, vertical: 4),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(38),
                  color: Color.fromARGB(80, 255, 255, 255)),
              child: Text(
                type.trim(),
                style: TextStyle(
                    fontFamily: 'Google',
                    fontSize: 12,
                    fontWeight: FontWeight.bold,
                    color: Colors.white),
              ),
            ),
            SizedBox(
              height: 5,
            )
          ],
        ),
      );
    });
    return Column(
      children: list,
      crossAxisAlignment: CrossAxisAlignment.start,
    );
  }

  const PokemonItem(
      {Key key,
      this.name,
      this.index,
      this.color,
      this.image,
      this.types,
      this.number})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        child: Stack(
          children: <Widget>[
            Positioned(
              bottom: -12,
              right: -12,
              child: Opacity(
                child: Image.asset(
                  ConstsApp.whitePokeball,
                  width: 100,
                  height: 100,
                ),
                opacity: 0.2,
              ),
            ),
            Positioned(
                right: 4, bottom: 8, child: Hero(tag: name, child: image)),
            Positioned(
              top: 10,
              right: 4,
              child: Opacity(
                child: Text(
                  '#$number',
                  style: TextStyle(
                    fontFamily: 'Raleway',
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                    color: Colors.white,
                  ),
                ),
                opacity: 0.12,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 16, top: 24),
              child: Text(
                name,
                style: TextStyle(
                  fontFamily: 'Raleway',
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                  color: Colors.white,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 16, top: 46),
              child: setTypes(),
            )
          ],
        ),
        decoration: BoxDecoration(
          color: ConstsApp.getColorType(type: types[0]),
          borderRadius: BorderRadius.all(
            Radius.circular(20),
          ),
        ),
      ),
    );
  }
}
