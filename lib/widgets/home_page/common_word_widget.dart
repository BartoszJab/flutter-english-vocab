import 'package:flutter/material.dart';
import 'package:flutter_english_app/bloc/word_search_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_english_app/constants.dart';
import 'package:flutter_english_app/popular_words.dart';

class CommonWordWidget extends StatefulWidget {
  const CommonWordWidget({Key? key}) : super(key: key);

  @override
  State<CommonWordWidget> createState() => _CommonWordWidgetState();
}

class _CommonWordWidgetState extends State<CommonWordWidget> {
  late PageController _pageController;

  @override
  void initState() {
    _pageController = PageController();
    popularWords.shuffle();
    super.initState();
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  void _nextCard() {
    if (_pageController.page == popularWords.length - 1) {
      _pageController.jumpToPage(0);
      return;
    }

    _pageController.nextPage(
        duration: const Duration(seconds: 1), curve: Curves.ease);
  }

  void _previousCard() {
    if (_pageController.page == 0.0) {
      _pageController.jumpToPage(popularWords.length - 1);
      return;
    }

    _pageController.previousPage(
        duration: const Duration(seconds: 1), curve: Curves.ease);
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.3,
      child: PageView.builder(
        itemBuilder: ((_, index) {
          return GestureDetector(
            onTap: () {
              context.read<WordSearchBloc>().add(
                    LoadWordEvent(
                      searchedWord: popularWords.elementAt(index),
                    ),
                  );
            },
            onHorizontalDragEnd: ((details) {
              if (details.primaryVelocity! < 0) {
                _nextCard();
              } else if (details.primaryVelocity! > 0) {
                _previousCard();
              }
            }),
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: WordCardWidget(
                currentItemIndex: index,
              ),
            ),
          );
        }),
        itemCount: popularWords.length,
        controller: _pageController,
      ),
    );
  }
}

class WordCardWidget extends StatelessWidget {
  final int currentItemIndex;

  const WordCardWidget({Key? key, required this.currentItemIndex})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: 16.0,
        vertical: 24.0,
      ),
      decoration: BoxDecoration(
        color: secondaryColor,
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            popularWords.elementAt(currentItemIndex),
            style: const TextStyle(
              fontSize: 28.0,
              fontWeight: FontWeight.w600,
            ),
          ),
          const SizedBox(
            height: 10.0,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: const [
              Icon(
                Icons.favorite,
                color: Colors.red,
                size: 42.0,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
