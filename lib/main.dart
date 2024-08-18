import 'package:flutter/material.dart';
import 'package:movie_app/home/home.dart';
import 'package:movie_app/theme/theme_app.dart';

void main() {
  runApp(const MyApp());
  //ziad14
  //mohamed ali
  //marammmmm
  // ziad/maram
  //mohamed/osman
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeApp.theme,
      initialRoute: HomeScreen.routeName,
      routes: {
        HomeScreen.routeName :(context)=> HomeScreen()
      },

      /// osman
      /// mohamed 2

    );
  }
}


