class WordModel {
  String? word;
  List<MeaningModel>? meanings;

  WordModel({
    required this.word,
    required this.meanings,
  });

  WordModel.fromJson(Map<String, dynamic> json) {
    word = json["word"];

    if (json["meanings"] != null) {
      meanings = [];
      for (var element in (json["meanings"] as List)) {
        meanings!.add(MeaningModel.fromJson(element));
      }
    }
  }
}

class MeaningModel {
  String? partOfSpeech;
  List<DefinitionModel>? definitions;

  MeaningModel({
    required this.partOfSpeech,
    required this.definitions,
  });

  MeaningModel.fromJson(Map<String, dynamic> json) {
    partOfSpeech = json["partOfSpeech"];

    if (json["definitions"] != null) {
      definitions = [];
      for (var element in (json["definitions"] as List)) {
        definitions!.add(DefinitionModel.fromJson(element));
      }
    }
  }
}

class DefinitionModel {
  String? definition;
  List<String>? synonyms;
  List<String>? antonyms;

  DefinitionModel({
    required this.definition,
    required this.synonyms,
    required this.antonyms,
  });

  DefinitionModel.fromJson(Map<String, dynamic> json) {
    definition = json["definition"];
    // synonyms = json["synonyms"] as List<String>;
    // antonyms = json["antonyms"] as List<String>;

    // if (json["synonyms"] != null) {
    //   synonyms = [];
    //   for (var element in (json["synonyms"] as List)) {
    //     synonyms!.add(element.toString());
    //   }
    // }

    // if (json["antonyms"] != null) {
    //   antonyms = [];
    //   for (var element in (json["antonyms"] as List)) {
    //     antonyms!.add(element.toString());
    //   }
    // }
  }
}
