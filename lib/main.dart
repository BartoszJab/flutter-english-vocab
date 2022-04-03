import 'package:flutter/material.dart';
import 'package:flutter_english_app/constants.dart';
import 'package:flutter_english_app/home_page.dart';

void main() => runApp(const App());

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark().copyWith(
        scaffoldBackgroundColor: backgroundColor,
        canvasColor: secondaryColor,
      ),
      home: const HomePage(),
    );
  }
}
