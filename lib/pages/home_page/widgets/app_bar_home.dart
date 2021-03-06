import 'package:flutter/material.dart';

class AppBarHome extends StatelessWidget {
  const AppBarHome({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      child: Column(
        children: <Widget>[
          Container(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[
                IconButton(icon: Icon(Icons.menu), onPressed: () {})
              ],
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(left: 20),
                child: Text(
                  'Pokédex',
                  style: TextStyle(fontWeight: FontWeight.w700, fontSize: 28),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
