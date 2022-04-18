import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_english_app/blocs/favorite_words_bloc/favorite_words_bloc.dart';
import 'package:flutter_english_app/blocs/word_search_bloc/word_search_bloc.dart';
import 'package:flutter_english_app/constants.dart';

class FavoriteWordsWidget extends StatelessWidget {
  const FavoriteWordsWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FavoriteWordsBloc, FavoriteWordsState>(
      builder: (context, state) {
        if (state is FavoriteWordsLoadedWordsState) {
          if (state.favoriteWords.isEmpty) {
            return const Text("Nie masz ulubionych słów");
          }

          // return Text(state.favoriteWords.length.toString());
          return SizedBox(
            height: 300,
            child: Column(
              children: [
                const Text(
                  "Ulubione",
                  style: TextStyle(
                    fontSize: labelSize,
                  ),
                ),
                Expanded(
                  child: ListView.builder(
                    itemCount: state.favoriteWords.length,
                    itemBuilder: (context, index) {
                      return Card(
                        color: secondaryColor,
                        child: ListTile(
                          onTap: () => context.read<WordSearchBloc>().add(
                              LoadWordEvent(
                                  searchedWord: state.favoriteWords[index])),
                          leading: Text((index + 1).toString()),
                          title: Text(state.favoriteWords[index]),
                          trailing: IconButton(
                            icon: const Icon(Icons.delete),
                            onPressed: () => context
                                .read<FavoriteWordsBloc>()
                                .add(FavoriteWordsAddRemoveEvent(
                                    state.favoriteWords[index])),
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
          );
        }
        return Container();
      },
    );
  }
}
