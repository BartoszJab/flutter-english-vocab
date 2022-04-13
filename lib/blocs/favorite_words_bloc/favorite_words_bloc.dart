import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_english_app/database/favorite_words_database.dart';
import 'package:flutter_english_app/repositories/favorite_words_repository.dart';
import 'package:meta/meta.dart';

part 'favorite_words_event.dart';
part 'favorite_words_state.dart';

class FavoriteWordsBloc extends Bloc<FavoriteWordsEvent, FavoriteWordsState> {
  final FavoriteWordsRepository repository;

  FavoriteWordsBloc(this.repository) : super(FavoriteWordsInitial()) {
    on<FavoriteWordsGetFavoritesEvent>(
      (event, emit) async {
        try {
          emit(FavoriteWordsLoadedWordsState(
              favoriteWords: await repository.getFavoriteWords()));
        } on Exception catch (e) {
          emit(FavoriteWordsLoadErrorState(e));
        }
      },
    );

    on<FavoriteWordsAddRemoveEvent>(
      (event, emit) async {
        try {
          final isWordFavorite = await repository.isWordFavorite(event.word);

          if (isWordFavorite) {
            await repository.remove(event.word);
            emit(FavoriteWordsLoadedWordsState(
                favoriteWords: await repository.getFavoriteWords()));
          } else {
            await repository.addToFavorite(event.word);
            emit(FavoriteWordsLoadedWordsState(
                favoriteWords: await repository.getFavoriteWords()));
          }
        } on Exception catch (e) {
          emit(FavoriteWordsErrorState(e));
        }
      },
    );
  }
}
