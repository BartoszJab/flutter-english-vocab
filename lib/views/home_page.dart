import 'package:flutter/material.dart';
import 'package:flutter_english_app/blocs/favorite_words_bloc/favorite_words_bloc.dart';
import 'package:flutter_english_app/blocs/word_search_bloc/word_search_bloc.dart';
import 'package:flutter_english_app/constants.dart';
import 'package:flutter_english_app/popular_words.dart';
import 'package:flutter_english_app/repositories/favorite_words_repository.dart';
import 'package:flutter_english_app/repositories/word_repository.dart';
import 'package:flutter_english_app/views/translation_page.dart';
import 'package:flutter_english_app/views/word_page.dart';
import 'package:flutter_english_app/widgets/home_page/common_word_widget.dart';
import 'package:flutter_english_app/widgets/home_page/favorite_words_widget.dart';
import 'package:flutter_english_app/widgets/home_page/search_word_widget.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    popularWords.shuffle();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => WordSearchBloc(
            context.read<WordRepository>(),
          ),
        ),
        BlocProvider(
          create: (context) => FavoriteWordsBloc(
            context.read<FavoriteWordsRepository>(),
          )..add(FavoriteWordsGetFavoritesEvent()),
        ),
      ],
      child: Scaffold(
        body: BlocListener<WordSearchBloc, WordSearchState>(
          listener: (context, state) {
            if (state is WordSearchLoadingState) {
              _showLoadingSnackBar(context);
            } else if (state is WordSearchLoadedState) {
              ScaffoldMessenger.of(context).hideCurrentSnackBar();
              Navigator.push(context, MaterialPageRoute(builder: (_) {
                return BlocProvider.value(
                    value: BlocProvider.of<FavoriteWordsBloc>(context),
                    child: TranslationPage(translation: state.translation));
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
                children: const [
                  SearchWordWidget(),
                  SizedBox(height: 10),
                  CommonWordWidget(),
                  Divider(
                    thickness: 2.0,
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  FavoriteWordsWidget(),
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
