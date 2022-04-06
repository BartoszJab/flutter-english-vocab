import 'package:flutter/material.dart';
import 'package:flutter_english_app/constants.dart';
import 'package:flutter_english_app/views/home_page.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_english_app/repositories/word_repository.dart';

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
      home: RepositoryProvider(
        create: (context) => WordRepository(),
        child: HomePage(),
      ),
    );
  }
}
