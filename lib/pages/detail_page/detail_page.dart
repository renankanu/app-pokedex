import 'package:app_pokedex/consts/const_app.dart';
import 'package:app_pokedex/models/pokeapi.dart';
import 'package:app_pokedex/pages/detail_page/widgets/retangle_detail.dart';
import 'package:app_pokedex/stores/api_store.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Detail extends StatelessWidget {
  final int index;

  const Detail({Key key, this.index}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _apiStore = Provider.of<ApiStore>(context);
    Pokemon _pokemon = _apiStore.getPokemon(index: index);
    Color _pokemonColor = ConstsApp.getColorType(type: _pokemon.type[0]);
    final double _statusBarHeight = MediaQuery.of(context).padding.top;
    return Scaffold(
      backgroundColor: _pokemonColor,
      body: Stack(
        children: <Widget>[
          Positioned(top: 10, right: 60, child: Image.asset(ConstsApp.dots)),
          Positioned(top: -10, left: -10, child: RetangleDetail()),
          Container(
            padding: EdgeInsets.only(top: _statusBarHeight),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                IconButton(
                  icon: Icon(
                    Icons.arrow_back,
                    color: Colors.white,
                  ),
                  onPressed: () {},
                ),
                IconButton(
                  icon: Icon(
                    Icons.favorite_border,
                    color: Colors.white,
                  ),
                  onPressed: () {},
                ),
              ],
            ),
          ),
          Padding(padding: const EdgeInsets.only(top: 104),child: Container(width: 200,height: 200,))
        ],
      ),
    );
  }
}
