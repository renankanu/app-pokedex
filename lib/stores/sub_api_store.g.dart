// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sub_api_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$SubApiStore on _SubApiStoreBase, Store {
  final _$specieAtom = Atom(name: '_SubApiStoreBase.specie');

  @override
  Specie get specie {
    _$specieAtom.reportRead();
    return super.specie;
  }

  @override
  set specie(Specie value) {
    _$specieAtom.reportWrite(value, super.specie, () {
      super.specie = value;
    });
  }

  final _$pokeInfoAtom = Atom(name: '_SubApiStoreBase.pokeInfo');

  @override
  PokeInfo get pokeInfo {
    _$pokeInfoAtom.reportRead();
    return super.pokeInfo;
  }

  @override
  set pokeInfo(PokeInfo value) {
    _$pokeInfoAtom.reportWrite(value, super.pokeInfo, () {
      super.pokeInfo = value;
    });
  }

  final _$getInfoPokemonAsyncAction =
      AsyncAction('_SubApiStoreBase.getInfoPokemon');

  @override
  Future<void> getInfoPokemon(String name) {
    return _$getInfoPokemonAsyncAction.run(() => super.getInfoPokemon(name));
  }

  final _$getInfoSpecieAsyncAction =
      AsyncAction('_SubApiStoreBase.getInfoSpecie');

  @override
  Future<void> getInfoSpecie(String numPokemon) {
    return _$getInfoSpecieAsyncAction
        .run(() => super.getInfoSpecie(numPokemon));
  }

  @override
  String toString() {
    return '''
specie: ${specie},
pokeInfo: ${pokeInfo}
    ''';
  }
}
