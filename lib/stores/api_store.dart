import 'dart:convert';

import 'package:app_pokedex/consts/const_api.dart';
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

  @computed
  PokeAPI get pokeAPI => _pokeAPI;

  @action
  fetchPokemonList() {
    _pokeAPI = null;
    loadPokeAPI().then((pokeList) => {_pokeAPI = pokeList});
  }

  @action
  getPokemon({int index}) {
    return _pokeAPI.pokemon[index];
  }

  @action
  Widget getImage({String number}) {
    return CachedNetworkImage(
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
