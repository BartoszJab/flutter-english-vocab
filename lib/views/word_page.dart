import 'package:flutter/material.dart';
import 'package:flutter_english_app/models/word_model.dart';

class WordPage extends StatelessWidget {
  final WordModel word;
  const WordPage({Key? key, required this.word}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text(word.word.toString()),
      ),
    );
  }
}
