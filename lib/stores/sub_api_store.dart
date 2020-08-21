import 'dart:convert';

import 'package:app_pokedex/models/pokeapiinfo.dart';
import 'package:app_pokedex/models/specie.dart';
import 'package:mobx/mobx.dart';
import 'package:app_pokedex/consts/const_api.dart';
import 'package:http/http.dart' as http;
part 'sub_api_store.g.dart';

class SubApiStore = _SubApiStoreBase with _$SubApiStore;

abstract class _SubApiStoreBase with Store {
  @observable
  Specie specie;

  @observable
  PokeInfo pokeInfo;

  @action
  Future<void> getInfoPokemon(String name) async {
    try {
      pokeInfo = null;
      final response =
          await http.get(ConstAPI.pokeapiv2URL + name.toLowerCase());
      var decodeJson = jsonDecode(response.body);
      pokeInfo = PokeInfo.fromJson(decodeJson);
    } catch (error, stacktrace) {
      print("Erro ao carregar lista" + stacktrace.toString());
      return null;
    }
  }

  @action
  Future<void> getInfoSpecie(String numPokemon) async {
    try {
      specie = null;
      final response =
          await http.get(ConstAPI.pokeapiv2SpeciesURL + numPokemon);
      var decodeJson = jsonDecode(response.body);
      var _specie = Specie.fromJson(decodeJson);
      specie = _specie;
    } catch (error, stacktrace) {
      print("Erro ao carregar lista" + stacktrace.toString());
      return null;
    }
  }
}
