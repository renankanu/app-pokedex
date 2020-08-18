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
    return Scaffold(
      appBar: AppBar(
        title: Text(
          _pokemon.name,
          style: TextStyle(
              fontFamily: 'Raleway', fontWeight: FontWeight.bold, fontSize: 21),
        ),
        elevation: 0,
        backgroundColor: _pokemonColor,
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios),
          onPressed: () {},
        ),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.favorite_border),
            onPressed: () {},
          )
        ],
      ),
      backgroundColor: _pokemonColor,
      body: Stack(
        children: <Widget>[
          Image.asset(ConstsApp.dots),
          RetangleDetail()
        ],
      ),
    );
  }
}
