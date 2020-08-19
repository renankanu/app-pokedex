import 'package:app_pokedex/consts/const_app.dart';
import 'package:app_pokedex/models/pokeapi.dart';
import 'package:app_pokedex/pages/detail_page/widgets/retangle_detail.dart';
import 'package:app_pokedex/stores/api_store.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get_it/get_it.dart';
import 'package:sliding_sheet/sliding_sheet.dart';

class Detail extends StatefulWidget {
  final int index;

  const Detail({Key key, this.index}) : super(key: key);

  @override
  _DetailState createState() => _DetailState();
}

class _DetailState extends State<Detail> {
  PageController _pageController;
  Pokemon _pokemon;
  ApiStore _apiStore;

  @override
  void initState() {
    super.initState();
    _pageController = PageController(initialPage: widget.index);
      _apiStore = GetIt.instance<ApiStore>();
    _pokemon = _apiStore.pokemonActual;
  }
  
  @override
  Widget build(BuildContext context) {
    final double _statusBarHeight = MediaQuery.of(context).padding.top;
    return Scaffold(
      body: Stack(
        children: <Widget>[
          Observer(builder: (context) {
            return Container(
              color: _apiStore.pokemonColor,
            );
          }),
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
                  onPressed: () {
                    Navigator.pop(context);
                  },
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
          Padding(
              padding: const EdgeInsets.only(top: 104),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Container(
                  child: Column(
                    children: <Widget>[
                      Observer(builder: (context) {
                        return Text(
                          _apiStore.pokemonActual.name,
                          style: TextStyle(
                            fontFamily: 'Raleway',
                            fontWeight: FontWeight.bold,
                            fontSize: 36,
                            color: Colors.white,
                          ),
                        );
                      })
                    ],
                  ),
                ),
              )),
          SlidingSheet(
              elevation: 0,
              cornerRadius: 16,
              snapSpec: SnapSpec(
                snap: true,
                snappings: [0.7, 1.0],
                positioning: SnapPositioning.relativeToAvailableSpace,
              ),
              builder: (context, state) {
                return Container(
                  height: MediaQuery.of(context).size.height,
                );
              }),
          Positioned(
            top: 140,
            left: 0,
            right: 0,
            child: Container(
              height: 150,
              child: PageView.builder(
                controller: _pageController,
                  onPageChanged: (index) {
                    _apiStore.setSelectedPokemon(index: index);
                  },
                  itemCount: _apiStore.pokeAPI.pokemon.length,
                  itemBuilder: (BuildContext context, int index) {
                    Pokemon _pokeItem = _apiStore.getPokemon(index: index);
                    return CachedNetworkImage(
                      width: 80,
                      height: 80,
                      placeholder: (context, url) => new Container(
                        color: Colors.transparent,
                      ),
                      imageUrl:
                          'https://raw.githubusercontent.com/fanzeyi/pokemon.json/master/images/${_pokeItem.num}.png',
                    );
                  }),
            ),
          )
        ],
      ),
    );
  }
}
