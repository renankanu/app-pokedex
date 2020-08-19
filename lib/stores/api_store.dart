import 'dart:convert';

import 'package:app_pokedex/consts/const_api.dart';
import 'package:app_pokedex/consts/const_app.dart';
import 'package:app_pokedex/models/pokeapi.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
import 'package:http/http.dart' as http;
part 'api_store.g.dart';

class ApiStore = _ApiStoreBase with _$ApiStore;

abstract class _ApiStoreBase with Store {
  @observable
  PokeAPI _pokeAPI;

  @observable
  Pokemon _pokemonActual;

  @observable
  dynamic pokemonColor;

  @computed
  PokeAPI get pokeAPI => _pokeAPI;

  @computed
  Pokemon get pokemonActual => _pokemonActual;

  @action
  fetchPokemonList() {
    _pokeAPI = null;
    loadPokeAPI().then((pokeList) => {_pokeAPI = pokeList});
  }

  Pokemon getPokemon({int index}) {
    return _pokeAPI.pokemon[index];
  }

  @action
  setSelectedPokemon({int index }) {
   _pokemonActual = _pokeAPI.pokemon[index];
   pokemonColor = ConstsApp.getColorType(type: _pokemonActual.type[0]);
  }

  @action
  Widget getImage({String number}) {
    return CachedNetworkImage(
      width: 80,
      height: 80,
      placeholder: (context, url) => new Container(
        color: Colors.transparent,
      ),
      imageUrl:  'https://raw.githubusercontent.com/fanzeyi/pokemon.json/master/images/$number.png',
    );
  }

  Future<PokeAPI> loadPokeAPI() async {
    try {
      final response = await http.get(ConstAPI.apiURL);
      var decodeJson = jsonDecode(response.body);
      return PokeAPI.fromJson(decodeJson);
    } catch (error) {
      print("Error in load itens");
      return null;
    }
  }
}
