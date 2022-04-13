part of 'favorite_words_bloc.dart';

@immutable
abstract class FavoriteWordsState {}

class FavoriteWordsInitial extends FavoriteWordsState {}

class FavoriteWordsLoadedWordsState extends FavoriteWordsState {
  final List<String> favoriteWords;

  FavoriteWordsLoadedWordsState({required this.favoriteWords});
}

class FavoriteWordsLoadErrorState extends FavoriteWordsState {
  final Exception e;

  FavoriteWordsLoadErrorState(this.e);
}

class FavoriteWordsErrorState extends FavoriteWordsState {
  final Exception e;

  FavoriteWordsErrorState(this.e);
}
