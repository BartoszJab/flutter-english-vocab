import 'package:flutter/material.dart';
import 'package:flutter_english_app/blocs/word_search_bloc/word_search_bloc.dart';
import 'package:flutter_english_app/constants.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SearchWordWidget extends StatefulWidget {
  const SearchWordWidget({Key? key}) : super(key: key);

  @override
  State<SearchWordWidget> createState() => _SearchWordWidgetState();
}

class _SearchWordWidgetState extends State<SearchWordWidget> {
  late TextEditingController _controller;

  @override
  void initState() {
    _controller = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: _controller,
      decoration: InputDecoration(
        fillColor: secondaryColor,
        filled: true,
        hintText: 'Wyszukaj słowo',
        border: OutlineInputBorder(
          borderSide: BorderSide.none,
          borderRadius: BorderRadius.circular(20.0),
        ),
        suffixIcon: GestureDetector(
          onTap: () {
            context
                .read<WordSearchBloc>()
                .add(LoadWordEvent(searchedWord: _controller.text));
          },
          child: const Icon(Icons.search),
        ),
      ),
    );
  }
}
