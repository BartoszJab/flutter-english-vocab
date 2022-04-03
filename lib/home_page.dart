import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_english_app/constants.dart';
import 'package:flutter_english_app/popular_words.dart';
import 'package:flutter_english_app/widgets/common_word_widget.dart';
import 'package:flutter_english_app/widgets/search_word_widget.dart';

class HomePage extends StatefulWidget {
  HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
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
    );
  }
}
