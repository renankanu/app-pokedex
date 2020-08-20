import 'package:app_pokedex/stores/api_store.dart';
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
  ApiStore _apiStore;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
    _apiStore = GetIt.instance<ApiStore>();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(50),
        child: Observer(
          builder: (context) {
            return AppBar(
              backgroundColor: Colors.white,
              elevation: 0,
              bottom: TabBar(
                controller: _tabController,
                labelStyle: TextStyle(fontWeight: FontWeight.w700),
                indicatorSize: TabBarIndicatorSize.label,
                labelColor: _apiStore.pokemonColor,
                unselectedLabelColor: Color(0xff5f6368),
                isScrollable: true,
                indicator: MD2Indicator(
                    indicatorHeight: 1,
                    indicatorColor: _apiStore.pokemonColor,
                    indicatorSize:
                        MD2IndicatorSize.full
                    ),
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
          }
        ),
      ),
    );
  }
}
