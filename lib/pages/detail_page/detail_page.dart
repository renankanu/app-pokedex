import 'package:app_pokedex/consts/const_app.dart';
import 'package:app_pokedex/models/pokeapi.dart';
import 'package:app_pokedex/stores/api_store.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Detail extends StatelessWidget {
  final int index;

  const Detail({Key key, this.index}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    final _apiStore = Provider.of<ApiStore>(context);
    Pokemon pokemon = _apiStore.getPokemon(index: index);
    Color _pokemonColor = ConstsApp.getColorType(type: pokemon.type[0]);
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: _pokemonColor,
        leading: IconButton(icon: Icon(Icons.arrow_back_ios), onPressed: () {},),
      ),
      backgroundColor: _pokemonColor,
    );
  }
}