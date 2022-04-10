import 'package:html/dom.dart' as dom;
import 'package:html/parser.dart' as parser;
// class TranslationModel {
//   final String phrase;
//   final String englishExample;
//   final String translatedExamples;

//   const TranslationModel({
//     required this.phrase,
//     required this.englishExample,
//     required this.translatedExamples,
//   });
// }

class TranslationModel {
  final String englishWord;
  final List<String> translatedPhrases;
  final List<String> englishExamples;
  final List<String> translatedExamples;

  const TranslationModel({
    required this.englishWord,
    required this.translatedPhrases,
    required this.englishExamples,
    required this.translatedExamples,
  });

  factory TranslationModel.fromGlosbeResponseBody(
    String englishWord,
    String responseBody,
  ) {
    dom.Document document = parser.parse(responseBody);
    final elements = document.getElementsByClassName("translation");
    final translatedPhrases = elements
        .take(3)
        .map((e) => e.getElementsByTagName("span")[0].innerHtml.trim())
        .toList();

    final translationExamplesElements =
        document.getElementsByClassName("translation__example");

    final englishExamples = translationExamplesElements
        .take(3)
        .map((e) => e.getElementsByTagName("p")[0].innerHtml
            // .replaceAll("<strong>", "")
            // .replaceAll("</strong>", ""),
            )
        .toList();

    final translatedExamples = translationExamplesElements
        .take(3)
        .map((e) => e.getElementsByTagName("p")[1].innerHtml
            // .replaceAll("<strong>", "")
            // .replaceAll("</strong>", ""),
            )
        .toList();

    return TranslationModel(
      englishWord: englishWord,
      translatedPhrases: translatedPhrases,
      englishExamples: englishExamples,
      translatedExamples: translatedExamples,
    );
  }
}
