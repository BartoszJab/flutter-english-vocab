import 'package:flutter/material.dart';
import 'package:flutter_english_app/models/word_model.dart';
import 'package:flutter_english_app/widgets/word_page/definitions_list_widget.dart';

class WordPage extends StatefulWidget {
  final WordModel word;
  const WordPage({Key? key, required this.word}) : super(key: key);

  @override
  State<WordPage> createState() => _WordPageState();
}

class _WordPageState extends State<WordPage> {
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
                    widget.word.word,
                    style: const TextStyle(
                      fontSize: 32,
                      fontStyle: FontStyle.italic,
                    ),
                  ),
                ],
              ),
              const Divider(thickness: 1.0),
              Expanded(
                child: PageView.builder(
                  controller: _pageController,
                  itemCount: widget.word.meanings.length,
                  itemBuilder: (context, meaningIndex) {
                    return GestureDetector(
                      onHorizontalDragEnd: ((details) {
                        if (details.primaryVelocity! < 0) {
                          _pageController.nextPage(
                              duration: const Duration(seconds: 1),
                              curve: Curves.ease);
                        } else if (details.primaryVelocity! > 0) {
                          _pageController.previousPage(
                              duration: const Duration(seconds: 1),
                              curve: Curves.ease);
                        }
                      }),
                      child: Column(
                        children: [
                          Text(
                            widget.word.meanings[meaningIndex].partOfSpeech,
                            style: const TextStyle(fontSize: 20),
                          ),
                          Expanded(
                            child: DefinitionsListWidget(
                              meaning: widget.word.meanings[meaningIndex],
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
