import 'package:flutter/material.dart';
import 'package:flutter_english_app/constants.dart';
import 'package:flutter_english_app/models/word_model.dart';

class DefinitionsListWidget extends StatelessWidget {
  final MeaningModel meaning;
  const DefinitionsListWidget({
    Key? key,
    required this.meaning,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: meaning.definitions?.length,
      itemBuilder: (context, definitionIndex) {
        var definition = meaning.definitions?[definitionIndex];
        return Card(
          elevation: 6,
          color: secondaryColor,
          child: ListTile(
            leading: Text((definitionIndex + 1).toString()),
            title: Text(definition!.definition),
          ),
        );
      },
    );
  }
}
