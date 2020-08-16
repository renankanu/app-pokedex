// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'api_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$ApiStore on _ApiStoreBase, Store {
  Computed<PokeAPI> _$pokeAPIComputed;

  @override
  PokeAPI get pokeAPI => (_$pokeAPIComputed ??=
          Computed<PokeAPI>(() => super.pokeAPI, name: '_ApiStoreBase.pokeAPI'))
      .value;

  final _$_pokeAPIAtom = Atom(name: '_ApiStoreBase._pokeAPI');

  @override
  PokeAPI get _pokeAPI {
    _$_pokeAPIAtom.reportRead();
    return super._pokeAPI;
  }

  @override
  set _pokeAPI(PokeAPI value) {
    _$_pokeAPIAtom.reportWrite(value, super._pokeAPI, () {
      super._pokeAPI = value;
    });
  }

  final _$_ApiStoreBaseActionController =
      ActionController(name: '_ApiStoreBase');

  @override
  dynamic fetchPokemonList() {
    final _$actionInfo = _$_ApiStoreBaseActionController.startAction(
        name: '_ApiStoreBase.fetchPokemonList');
    try {
      return super.fetchPokemonList();
    } finally {
      _$_ApiStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic getPokemon({int index}) {
    final _$actionInfo = _$_ApiStoreBaseActionController.startAction(
        name: '_ApiStoreBase.getPokemon');
    try {
      return super.getPokemon(index: index);
    } finally {
      _$_ApiStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  Widget getImage({String number}) {
    final _$actionInfo = _$_ApiStoreBaseActionController.startAction(
        name: '_ApiStoreBase.getImage');
    try {
      return super.getImage(number: number);
    } finally {
      _$_ApiStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
pokeAPI: ${pokeAPI}
    ''';
  }
}
