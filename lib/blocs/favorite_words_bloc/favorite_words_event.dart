part of 'favorite_words_bloc.dart';

@immutable
abstract class FavoriteWordsEvent {}

class FavoriteWordsGetFavoritesEvent extends FavoriteWordsEvent {}

class FavoriteWordsAddEvent extends FavoriteWordsEvent {
  final String word;

  FavoriteWordsAddEvent(this.word);
}

class FavoriteWordsAddRemoveEvent extends FavoriteWordsEvent {
  final String word;

  FavoriteWordsAddRemoveEvent(this.word);
}

class FavoriteWordsRemoveEvent extends FavoriteWordsEvent {
  final String word;

  FavoriteWordsRemoveEvent(this.word);
}
