import 'package:app_pokedex/consts/const_app.dart';
import 'package:app_pokedex/widgets/app_bar_home.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        overflow: Overflow.visible,
        children: <Widget>[
          Positioned(
            top: -(240 / 4.6),
            left: screenWidth - (240 / 1.66),
            child: Opacity(
                opacity: 0.1,
                child: Image.asset(
                  ConstsApp.blackPokeball,
                  height: 240,
                  width: 240,
                )),
          ),
          SafeArea(
            child: Column(
              children: <Widget>[
                AppBarHome()
              ],
            ),
          )
        ],
      ),
    );
  }
}