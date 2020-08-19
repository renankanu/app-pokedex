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
  Computed<Pokemon> _$pokemonActualComputed;

  @override
  Pokemon get pokemonActual =>
      (_$pokemonActualComputed ??= Computed<Pokemon>(() => super.pokemonActual,
              name: '_ApiStoreBase.pokemonActual'))
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

  final _$_pokemonActualAtom = Atom(name: '_ApiStoreBase._pokemonActual');

  @override
  Pokemon get _pokemonActual {
    _$_pokemonActualAtom.reportRead();
    return super._pokemonActual;
  }

  @override
  set _pokemonActual(Pokemon value) {
    _$_pokemonActualAtom.reportWrite(value, super._pokemonActual, () {
      super._pokemonActual = value;
    });
  }

  final _$pokemonColorAtom = Atom(name: '_ApiStoreBase.pokemonColor');

  @override
  dynamic get pokemonColor {
    _$pokemonColorAtom.reportRead();
    return super.pokemonColor;
  }

  @override
  set pokemonColor(dynamic value) {
    _$pokemonColorAtom.reportWrite(value, super.pokemonColor, () {
      super.pokemonColor = value;
    });
  }

  final _$actualPositionAtom = Atom(name: '_ApiStoreBase.actualPosition');

  @override
  int get actualPosition {
    _$actualPositionAtom.reportRead();
    return super.actualPosition;
  }

  @override
  set actualPosition(int value) {
    _$actualPositionAtom.reportWrite(value, super.actualPosition, () {
      super.actualPosition = value;
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
  dynamic setSelectedPokemon({int index}) {
    final _$actionInfo = _$_ApiStoreBaseActionController.startAction(
        name: '_ApiStoreBase.setSelectedPokemon');
    try {
      return super.setSelectedPokemon(index: index);
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
pokemonColor: ${pokemonColor},
actualPosition: ${actualPosition},
pokeAPI: ${pokeAPI},
pokemonActual: ${pokemonActual}
    ''';
  }
}
