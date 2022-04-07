import 'package:flutter/material.dart';
import 'package:flutter_english_app/bloc/word_search_bloc.dart';
import 'package:flutter_english_app/repositories/word_repository.dart';
import 'package:flutter_english_app/views/word_page.dart';
import 'package:flutter_english_app/widgets/home_page/common_word_widget.dart';
import 'package:flutter_english_app/widgets/home_page/search_word_widget.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => WordSearchBloc(
        context.read<WordRepository>(),
      ),
      child: Scaffold(
        body: BlocListener<WordSearchBloc, WordSearchState>(
          listener: (context, state) {
            if (state is WordSearchLoadingState) {
              _showLoadingSnackBar(context);
            } else if (state is WordSearchLoadedState) {
              ScaffoldMessenger.of(context).hideCurrentSnackBar();
              Navigator.push(context, MaterialPageRoute(builder: (context) {
                return WordPage(word: state.word);
              }));
            } else if (state is WordSearchErrorState) {
              ScaffoldMessenger.of(context).hideCurrentSnackBar();
              _showErrorSnackBar(context);
            }
          },
          child: SafeArea(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: const [
                  SearchWordWidget(),
                  SizedBox(height: 20),
                  Text(
                    'Najczęściej występujące',
                    style: TextStyle(fontSize: 24.0),
                  ),
                  CommonWordWidget(),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

void _showErrorSnackBar(BuildContext context) {
  const snackBar = SnackBar(content: Text("Nie znaleziono podanego słowa"));
  ScaffoldMessenger.of(context).showSnackBar(snackBar);
}

void _showLoadingSnackBar(BuildContext context) {
  const snackBar = SnackBar(content: Text("Ładowanie..."));
  ScaffoldMessenger.of(context).showSnackBar(snackBar);
}
