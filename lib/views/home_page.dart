import 'package:flutter/material.dart';
import 'package:flutter_english_app/bloc/word_search_bloc.dart';
import 'package:flutter_english_app/repositories/word_repository.dart';
import 'package:flutter_english_app/views/word_page.dart';
import 'package:flutter_english_app/widgets/common_word_widget.dart';
import 'package:flutter_english_app/widgets/search_word_widget.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomePage extends StatefulWidget {
  HomePage({Key? key}) : super(key: key);

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
              print("loading");
            } else if (state is WordSearchLoadedState) {
              Navigator.push(context, MaterialPageRoute(builder: (context) {
                return WordPage(word: state.word);
              }));
            } else if (state is WordSearchErrorState) {
              print("error");
            }
          },
          child: SafeArea(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const SearchWordWidget(),
                  const SizedBox(height: 10),
                  const Text(
                    'Najczęściej występujące',
                    style: TextStyle(fontSize: 24.0),
                  ),
                  const SizedBox(
                    height: 10,
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
