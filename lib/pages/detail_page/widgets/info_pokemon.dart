import 'package:app_pokedex/models/pokeapiinfo.dart';
import 'package:app_pokedex/models/specie.dart';
import 'package:app_pokedex/stores/api_store.dart';
import 'package:app_pokedex/stores/sub_api_store.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get_it/get_it.dart';
import 'package:md2_tab_indicator/md2_tab_indicator.dart';

class InfoPokemon extends StatefulWidget {
  @override
  _InfoPokemonState createState() => _InfoPokemonState();
}

class _InfoPokemonState extends State<InfoPokemon>
    with SingleTickerProviderStateMixin {
  TabController _tabController;
  PageController _pageController;
  ApiStore _apiStore;
  SubApiStore _subApiStore;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
    _apiStore = GetIt.instance<ApiStore>();
    _subApiStore = GetIt.instance<SubApiStore>();
    _pageController = PageController(initialPage: 0);
  }

  String buildString(String item) {
    var initialValue = item;
    if (initialValue.length == 1) {
      return "0." + initialValue + "0";
    }
    var lastChar = initialValue.substring(initialValue.length - 1);
    var newvalue = initialValue.substring(0, initialValue.length - 1);
    return newvalue + "." + lastChar;
  }

  String converterKgToLbs(String kg) {
    var kgDouble = num.tryParse(buildString(kg))?.toDouble();
    var lbs = kgDouble * 2.2046;
    return lbs.toStringAsFixed(1) + " lbs (" + kgDouble.toString() + " kg)";
  }

  String converterMtsToFeet(String meters) {
    var mtsDouble = num.tryParse(buildString(meters))?.toDouble();
    var feet = mtsDouble * 3.2808;
    return feet.toStringAsFixed(1) + " (" + mtsDouble.toString() + " mts)";
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(50),
        child: Observer(builder: (context) {
          return AppBar(
            backgroundColor: Colors.white,
            elevation: 0,
            bottom: TabBar(
              onTap: (index) {
                _pageController.animateToPage(index,
                    duration: Duration(microseconds: 300),
                    curve: Curves.easeInOut);
              },
              controller: _tabController,
              labelStyle: TextStyle(fontWeight: FontWeight.w700),
              indicatorSize: TabBarIndicatorSize.label,
              labelColor: _apiStore.pokemonColor,
              unselectedLabelColor: Color(0xff5f6368),
              isScrollable: true,
              indicator: MD2Indicator(
                  indicatorHeight: 1,
                  indicatorColor: _apiStore.pokemonColor,
                  indicatorSize: MD2IndicatorSize.full),
              tabs: <Widget>[
                Tab(
                  text: "Info",
                ),
                Tab(
                  text: "Evolution",
                ),
                Tab(
                  text: "Status",
                ),
              ],
            ),
          );
        }),
      ),
      body: PageView(
        onPageChanged: (index) {
          _tabController.animateTo(index,
              duration: Duration(microseconds: 300));
        },
        controller: _pageController,
        children: <Widget>[
          Container(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 30, vertical: 15),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    'Description',
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Observer(
                    builder: (context) {
                      Specie _specie = _subApiStore.specie;
                      return _specie != null
                          ? Text(
                              _specie.flavorTextEntries
                                  .where((desc) => desc.language.name == 'en')
                                  .first
                                  .flavorText
                                  .replaceAll('\n', ' ')
                                  .replaceAll('\f', ' '),
                              style: TextStyle(
                                fontSize: 14,
                              ),
                            )
                          : Center(
                              child: SizedBox(
                                width: 15,
                                height: 15,
                                child: CircularProgressIndicator(
                                  valueColor: AlwaysStoppedAnimation<Color>(
                                      _apiStore.pokemonColor),
                                ),
                              ),
                            );
                    },
                  ),
                  SizedBox(
                    height: 28,
                  ),
                  Observer(builder: (context) {
                    PokeInfo _pokeInfo = _subApiStore.pokeInfo;
                    return Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12),
                          color: Colors.white,
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withOpacity(0.12),
                              spreadRadius: 1,
                              blurRadius: 10,
                              offset: Offset(5, 10),
                            ),
                          ]),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 20.0, vertical: 16.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: <Widget>[
                            Column(
                              children: <Widget>[
                                Opacity(
                                  opacity: 0.4,
                                  child: Text(
                                    'Height',
                                    style: TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.black54,
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  height: 11,
                                ),
                                Text(
                                  _pokeInfo != null
                                      ? converterMtsToFeet(
                                          _pokeInfo.height.toString())
                                      : "",
                                  style: TextStyle(
                                    fontSize: 14,
                                    color: Colors.black,
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 5,
                            ),
                            Column(
                              children: <Widget>[
                                Opacity(
                                  opacity: 0.4,
                                  child: Text(
                                    'Weight',
                                    style: TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.black54,
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  height: 11,
                                ),
                                Text(
                                  _pokeInfo != null
                                      ? converterKgToLbs(
                                          _pokeInfo.weight.toString())
                                      : "",
                                  style: TextStyle(
                                    fontSize: 14,
                                    color: Colors.black,
                                  ),
                                ),
                              ],
                            )
                          ],
                        ),
                      ),
                    );
                  })
                ],
              ),
            ),
          ),
          Container(
            color: Colors.amber,
          ),
          Container(
            color: Colors.cyanAccent,
          ),
        ],
      ),
    );
  }
}
