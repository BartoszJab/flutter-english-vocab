import 'dart:convert';

import 'package:flutter_english_app/models/translation_model.dart';
import 'package:flutter_english_app/models/word_model.dart';
import 'package:http/http.dart' as http;

class WordRepository {
  final String _baseDefinitionsUrl =
      "https://api.dictionaryapi.dev/api/v2/entries/en";
  final String _baseTranslationsUrl = "https://pl.glosbe.com/en/pl";

  Future<WordModel> getWord(String word) async {
    final response = await http.get(Uri.parse("$_baseDefinitionsUrl/$word"));

    if (response.statusCode == 200) {
      final wordJson = jsonDecode(response.body);
      return WordModel.fromJson(wordJson[0]);
    } else {
      throw Exception("Word search error...");
    }
  }

  Future<TranslationModel> getWordTranslation(String word) async {
    final response = await http.get(Uri.parse("$_baseTranslationsUrl/$word"));

    if (response.statusCode == 200) {
      return TranslationModel.fromGlosbeResponseBody(word, response.body);
    } else {
      throw Exception("Translation error...");
    }
  }
}
