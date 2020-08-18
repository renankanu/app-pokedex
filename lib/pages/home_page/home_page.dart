import 'package:app_pokedex/consts/const_app.dart';
import 'package:app_pokedex/models/pokeapi.dart';
import 'package:app_pokedex/pages/detail_page/detail_page.dart';
import 'package:app_pokedex/pages/home_page/widgets/app_bar_home.dart';
import 'package:app_pokedex/pages/home_page/widgets/pokemon_item.dart';
import 'package:app_pokedex/stores/api_store.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:provider/provider.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final _apiStore = Provider.of<ApiStore>(context);
    _apiStore.fetchPokemonList();
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
                AppBarHome(),
                Expanded(
                  child: Container(
                    child: Observer(
                      name: 'ListHomePage',
                      builder: (BuildContext context) {
                        PokeAPI _pokeAPI = _apiStore.pokeAPI;
                        return (_pokeAPI != null)
                            ? AnimationLimiter(
                                child: GridView.builder(
                                    physics: BouncingScrollPhysics(),
                                    padding: EdgeInsets.all(12.0),
                                    addAutomaticKeepAlives: false,
                                    gridDelegate:
                                        new SliverGridDelegateWithFixedCrossAxisCount(
                                            crossAxisCount: 2),
                                    itemCount: _pokeAPI.pokemon.length,
                                    itemBuilder: (context, index) {
                                      Pokemon pokemon =
                                          _apiStore.getPokemon(index: index);
                                      return AnimationConfiguration
                                          .staggeredGrid(
                                              position: index,
                                              duration: const Duration(
                                                  milliseconds: 375),
                                              columnCount: 3,
                                              child: ScaleAnimation(
                                                child: GestureDetector(
                                                  child: PokemonItem(
                                                    types: pokemon.type,
                                                    index: index,
                                                    name: pokemon.name,
                                                    number: pokemon.num,
                                                    image: _apiStore.getImage(
                                                        number: pokemon.num),
                                                  ),
                                                  onTap: () {
                                                    Navigator.push(
                                                        context,
                                                        MaterialPageRoute(
                                                          builder: (BuildContext
                                                                  context) =>
                                                              Detail(
                                                                  index: index),
                                                          fullscreenDialog:
                                                              true,
                                                        ));
                                                  },
                                                ),
                                              ));
                                    }),
                              )
                            : Center(
                                child: CircularProgressIndicator(),
                              );
                      },
                    ),
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
