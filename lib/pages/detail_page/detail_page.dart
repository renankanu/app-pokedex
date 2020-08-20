import 'package:app_pokedex/consts/const_app.dart';
import 'package:app_pokedex/models/pokeapi.dart';
import 'package:app_pokedex/pages/detail_page/widgets/info_pokemon.dart';
import 'package:app_pokedex/pages/detail_page/widgets/retangle_detail.dart';
import 'package:app_pokedex/stores/api_store.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get_it/get_it.dart';
import 'package:simple_animations/simple_animations.dart';
import 'package:sliding_sheet/sliding_sheet.dart';

class Detail extends StatefulWidget {
  final int index;

  const Detail({Key key, this.index}) : super(key: key);

  @override
  _DetailState createState() => _DetailState();
}

enum _CheckboxProps { rotation }

class _DetailState extends State<Detail> {
  PageController _pageController;
  ApiStore _apiStore;
  MultiTween _animation;
  double _progress;
  double _multiple;
  double _opacity;
  double _opacityTitle;

  @override
  void initState() {
    super.initState();
    _pageController =
        PageController(initialPage: widget.index, viewportFraction: 0.6);
    _apiStore = GetIt.instance<ApiStore>();
    _animation = MultiTween<_CheckboxProps>()
      ..add(_CheckboxProps.rotation, Tween(begin: 0.0, end: 10.0),
          Duration(seconds: 1), Curves.linear);
    _progress = 0;
    _multiple = 1;
    _opacity = 1;
    _opacityTitle = 0;
  }

  double interval(double lower, double upper, double progress) {
    assert(lower < upper);

    if (progress > upper) return 1.0;
    if (progress < lower) return 0.0;

    return ((progress - lower) / (upper - lower)).clamp(0.0, 1.0);
  }

  Widget getTypes(List<String> types) {
    List<Widget> list = [];
    types.forEach((type) {
      list.add(
        Row(
          children: <Widget>[
            Container(
              padding: EdgeInsets.symmetric(horizontal: 12, vertical: 4),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(38),
                  color: Color.fromARGB(80, 255, 255, 255)),
              child: Text(
                type.trim(),
                style: TextStyle(
                    fontFamily: 'Google',
                    fontSize: 12,
                    fontWeight: FontWeight.bold,
                    color: Colors.white),
              ),
            ),
            SizedBox(
              width: 5,
            )
          ],
        ),
      );
    });
    return Row(
      children: list,
      crossAxisAlignment: CrossAxisAlignment.start,
    );
  }

  @override
  Widget build(BuildContext context) {
    final double _statusBarHeight = MediaQuery.of(context).padding.top;
    return Scaffold(
      body: Stack(
        children: <Widget>[
          Observer(builder: (context) {
            return AnimatedContainer(
              color: _apiStore.pokemonColor,
              duration: Duration(milliseconds: 900),
            );
          }),
          Positioned(top: 10, right: 60, child: Image.asset(ConstsApp.dots)),
          Positioned(top: -50, left: -10, child: RetangleDetail()),
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
                Opacity(
                    opacity: _opacityTitle,
                    child: Text(
                      _apiStore.pokemonActual.name,
                      style: TextStyle(
                          fontFamily: 'Raleway',
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                          fontSize: 22),
                    )),
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
              padding: const EdgeInsets.only(top: 80),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Container(
                  child: Observer(builder: (context) {
                    return Opacity(
                      opacity: _opacity,
                      child: Column(
                        children: <Widget>[
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              Text(
                                _apiStore.pokemonActual.name,
                                style: TextStyle(
                                  fontFamily: 'Raleway',
                                  fontWeight: FontWeight.bold,
                                  fontSize: 36,
                                  color: Colors.white,
                                ),
                              ),
                              Text(
                                "#"+_apiStore.pokemonActual.num,
                                style: TextStyle(
                                  fontFamily: 'Raleway',
                                  fontWeight: FontWeight.bold,
                                  fontSize: 18,
                                  color: Colors.white,
                                ),
                              ),
                            ],
                          ),
                          Container(
                            child: getTypes(_apiStore.pokemonActual.type),
                          )
                        ],
                      ),
                    );
                  }),
                ),
              )),
          SlidingSheet(
              listener: (state) => {
                    setState(() {
                      _progress = state.progress;
                      _multiple = 1 - interval(0.0, 0.9, _progress);
                      _opacity = _multiple;
                      _opacityTitle =
                          _multiple = interval(0.55, 0.9, _progress);
                    })
                  },
              elevation: 0,
              cornerRadius: 30,
              snapSpec: SnapSpec(
                snap: true,
                snappings: [0.7, 0.9],
                positioning: SnapPositioning.relativeToAvailableSpace,
              ),
              builder: (context, state) {
                return Container(
                  height: MediaQuery.of(context).size.height,
                  child: InfoPokemon(),
                );
              }),
          Positioned(
            top: 120 - (_progress * 100),
            left: 0,
            right: 0,
            child: Opacity(
              opacity: _opacity,
              child: Container(
                height: 200,
                child: PageView.builder(
                    controller: _pageController,
                    onPageChanged: (index) {
                      _apiStore.setSelectedPokemon(index: index);
                    },
                    itemCount: _apiStore.pokeAPI.pokemon.length,
                    itemBuilder: (BuildContext context, int index) {
                      Pokemon _pokeItem = _apiStore.getPokemon(index: index);
                      return Stack(
                        alignment: Alignment.center,
                        children: <Widget>[
                          LoopAnimation(
                              tween: _animation,
                              duration: Duration(seconds: 10),
                              builder: (context, child, value) {
                                return Transform.rotate(
                                  angle: value.get(_CheckboxProps.rotation),
                                  child: Opacity(
                                    child: Image.asset(
                                      ConstsApp.whitePokeball,
                                      width: 280,
                                      height: 280,
                                    ),
                                    opacity: index == _apiStore.actualPosition
                                        ? 0.2
                                        : 0.0,
                                  ),
                                );
                              }),
                          Observer(builder: (context) {
                            return AnimatedPadding(
                              duration: Duration(milliseconds: 500),
                              curve: Curves.bounceInOut,
                              padding: EdgeInsets.all(
                                  index == _apiStore.actualPosition ? 0 : 60),
                              child: Hero(
                                tag: _pokeItem.name,
                                child: CachedNetworkImage(
                                  width: 160,
                                  height: 160,
                                  color: index == _apiStore.actualPosition
                                      ? null
                                      : Colors.black.withOpacity(0.2),
                                  placeholder: (context, url) => new Container(
                                    color: Colors.transparent,
                                  ),
                                  imageUrl:
                                      'https://raw.githubusercontent.com/fanzeyi/pokemon.json/master/images/${_pokeItem.num}.png',
                                ),
                              ),
                            );
                          })
                        ],
                      );
                    }),
              ),
            ),
          )
        ],
      ),
    );
  }
}
