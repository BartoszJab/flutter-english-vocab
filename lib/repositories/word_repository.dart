import 'dart:convert';

import 'package:flutter_english_app/models/word_model.dart';
import 'package:http/http.dart' as http;

class WordRepository {
  final String _baseUrl = "https://api.dictionaryapi.dev/api/v2/entries/en";

  Future<WordModel> getWord(String word) async {
    final response = await http.get(Uri.parse("$_baseUrl/$word"));

    if (response.statusCode == 200) {
      final wordJson = jsonDecode(response.body);
      return WordModel.fromJson(wordJson[0]);
    } else {
      throw Exception("Something went wrong...");
    }
  }
}
