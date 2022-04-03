import 'package:flutter/material.dart';
import 'package:flutter_english_app/constants.dart';

class SearchWordWidget extends StatelessWidget {
  const SearchWordWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextField(
      decoration: InputDecoration(
        fillColor: secondaryColor,
        filled: true,
        hintText: 'Wyszukaj słowo',
        border: OutlineInputBorder(
          borderSide: BorderSide.none,
          borderRadius: BorderRadius.circular(20.0),
        ),
        suffixIcon: GestureDetector(
          onTap: () {},
          child: const Icon(Icons.search),
        ),
      ),
    );
  }
}
