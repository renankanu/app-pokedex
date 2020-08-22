import 'package:app_pokedex/models/pokeapiinfo.dart';
import 'package:app_pokedex/stores/sub_api_store.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get_it/get_it.dart';

class BaseStatsTab extends StatelessWidget {
  final SubApiStore _subApiStore = GetIt.instance<SubApiStore>();

  List<int> getStatusPokemon(PokeInfo pokeInfo) {
    List<int> list = [1, 2, 3, 4, 5, 6, 7];
    int sum = 0;
    pokeInfo.stats.forEach((f) {
      sum = sum + f.baseStat;
      switch (f.stat.name) {
        case 'speed':
          list[5] = f.baseStat;
          break;
        case 'special-defense':
          list[4] = f.baseStat;
          break;
        case 'special-attack':
          list[3] = f.baseStat;
          break;
        case 'defense':
          list[2] = f.baseStat;
          break;
        case 'attack':
          list[1] = f.baseStat;
          break;
        case 'hp':
          list[0] = f.baseStat;
          break;
      }
    });
    list[6] = sum;

    return list;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 30, vertical: 15),
        child: Observer(builder: (context) {
          return SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: <Widget>[
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      'HP',
                      style: TextStyle(fontSize: 16, color: Colors.grey[600]),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      'Attack',
                      style: TextStyle(fontSize: 16, color: Colors.grey[600]),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      'Defense',
                      style: TextStyle(fontSize: 16, color: Colors.grey[600]),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      'Sp. Atk',
                      style: TextStyle(fontSize: 16, color: Colors.grey[600]),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      'Sp. Def',
                      style: TextStyle(fontSize: 16, color: Colors.grey[600]),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      'Speed',
                      style: TextStyle(fontSize: 16, color: Colors.grey[600]),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      'Total',
                      style: TextStyle(fontSize: 16, color: Colors.grey[600]),
                    ),
                  ],
                ),
                SizedBox(
                  width: 26,
                ),
                Observer(builder: (context) {
                  List<int> _list = getStatusPokemon(_subApiStore.pokeInfo);
                  return Column(
                    children: <Widget>[
                      Text(
                        _list[0].toString(),
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.w700),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        _list[1].toString(),
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.w700),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        _list[2].toString(),
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.w700),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        _list[3].toString(),
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.w700),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        _list[4].toString(),
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.w700),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        _list[5].toString(),
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.w700),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        _list[6].toString(),
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.w700),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                    ],
                  );
                }),
                SizedBox(
                  width: 10,
                ),
                Observer(builder: (context) {
                  List<int> _list = getStatusPokemon(_subApiStore.pokeInfo);
                  return Column(
                    children: <Widget>[
                      StatusBar(
                        widthFactor: _list[0] / 100,
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      StatusBar(
                        widthFactor: _list[1] / 100,
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      StatusBar(
                        widthFactor: _list[2] / 100,
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      StatusBar(
                        widthFactor: _list[3] / 100,
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      StatusBar(
                        widthFactor: _list[4] / 100,
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      StatusBar(
                        widthFactor: _list[5] / 100,
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      StatusBar(
                        widthFactor: _list[6] / 600,
                      ),
                    ],
                  );
                }),
              ],
            ),
          );
        }),
      ),
    );
  }
}

class StatusBar extends StatelessWidget {
  final double widthFactor;

  const StatusBar({Key key, this.widthFactor}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 19,
      child: Center(
        child: Container(
          height: 4,
          width: MediaQuery.of(context).size.width * .47,
          alignment: Alignment.centerLeft,
          decoration: ShapeDecoration(
            shape: StadiumBorder(),
            color: Colors.grey,
          ),
          child: FractionallySizedBox(
            widthFactor: widthFactor,
            heightFactor: 1.0,
            child: Container(
              decoration: ShapeDecoration(
                shape: StadiumBorder(),
                color: widthFactor > 0.5 ? Colors.teal : Colors.red,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
