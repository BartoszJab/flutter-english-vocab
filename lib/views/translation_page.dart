import 'package:flutter/material.dart';
import 'package:flutter_english_app/constants.dart';
import 'package:flutter_english_app/models/translation_model.dart';
import 'package:flutter_english_app/models/word_model.dart';
import 'package:flutter_english_app/widgets/translation_page/translation_card_widget.dart';
import 'package:flutter_english_app/widgets/word_page/definitions_list_widget.dart';

class TranslationPage extends StatefulWidget {
  final TranslationModel translation;
  const TranslationPage({Key? key, required this.translation})
      : super(key: key);

  @override
  State<TranslationPage> createState() => _WordPageState();
}

class _WordPageState extends State<TranslationPage> {
  late PageController _pageController;

  @override
  void initState() {
    _pageController = PageController(
      viewportFraction: 0.93,
    );
    super.initState();
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  IconButton(
                      icon: const Icon(Icons.arrow_back),
                      onPressed: () => Navigator.pop(context)),
                  const SizedBox(
                    width: 32,
                  ),
                  Text(
                    widget.translation.englishWord,
                    style: const TextStyle(
                      fontSize: 32,
                      fontStyle: FontStyle.italic,
                    ),
                  ),
                ],
              ),
              const Divider(thickness: 2.0),
              Expanded(
                child: ListView.separated(
                  separatorBuilder: (context, index) => const SizedBox(
                    height: 10.0,
                  ),
                  itemCount: widget.translation.translatedPhrases.length,
                  itemBuilder: (context, index) {
                    return TranslationCardWidget(
                      translatedPhrase:
                          widget.translation.translatedPhrases[index],
                      englishExample:
                          widget.translation.englishExamples.length > index
                              ? widget.translation.englishExamples[index]
                              : "----",
                      translatedExample:
                          widget.translation.translatedExamples.length > index
                              ? widget.translation.translatedExamples[index]
                              : "----",
                      color: secondaryColor,
                    );
                  },
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
