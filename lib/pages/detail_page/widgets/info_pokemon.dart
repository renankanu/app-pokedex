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
