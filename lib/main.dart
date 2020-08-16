import 'package:app_pokedex/pages/home_page/home_page.dart';
import 'package:app_pokedex/stores/api_store.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
          providers: <SingleChildWidget>[
            Provider<ApiStore>(
              create: (_) => ApiStore(),
            )
          ],
          child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Kanu Pokedex',
        theme: ThemeData(
          primarySwatch: Colors.blue,
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        home: HomePage(),
      ),
    );
  }
}
