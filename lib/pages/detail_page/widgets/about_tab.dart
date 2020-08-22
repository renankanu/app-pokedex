import 'package:app_pokedex/models/pokeapiinfo.dart';
import 'package:app_pokedex/models/specie.dart';
import 'package:app_pokedex/stores/api_store.dart';
import 'package:app_pokedex/stores/sub_api_store.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get_it/get_it.dart';

class AboutTab extends StatelessWidget {
  final SubApiStore _subApiStore = GetIt.instance<SubApiStore>();
  final ApiStore _apiStore = GetIt.instance<ApiStore>();

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

  String capitalize(String text) => text[0].toUpperCase() + text.substring(1);
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 30, vertical: 15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              'Description',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
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
                                ? converterKgToLbs(_pokeInfo.weight.toString())
                                : "",
                            style: TextStyle(
                              fontSize: 14,
                              color: Colors.black,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              );
            }),
            SizedBox(
              height: 31,
            ),
            Text(
              "Other",
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(
              height: 22,
            ),
            Observer(builder: (context) {
              Specie _specie = _subApiStore.specie;
              return Row(
                children: <Widget>[
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.only(bottom: 18.0),
                        child: Text(
                          "Shape",
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(bottom: 18.0),
                        child: Text("Egg Groups"),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(bottom: 18.0),
                        child: Text("Habitat"),
                      ),
                    ],
                  ),
                  SizedBox(
                    width: 26,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.only(bottom: 18.0),
                        child: Text(
                          _specie != null
                              ? capitalize(_specie.shape.name)
                              : "?",
                          style: TextStyle(fontWeight: FontWeight.w500),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(bottom: 18.0),
                        child: Text(
                          _specie != null
                              ? capitalize(_specie.eggGroups[0].name)
                              : "?",
                          style: TextStyle(fontWeight: FontWeight.w500),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(bottom: 18.0),
                        child: Text(
                          _specie != null
                              ? capitalize(_specie.habitat.name)
                              : "?",
                          style: TextStyle(fontWeight: FontWeight.w500),
                        ),
                      ),
                    ],
                  )
                ],
              );
            })
          ],
        ),
      ),
    );
  }
}
