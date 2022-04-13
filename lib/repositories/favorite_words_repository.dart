import 'package:flutter_english_app/dao/favorite_words_dao.dart';

class FavoriteWordsRepository {
  final favoriteWordsDao = FavoriteWordsDao();

  Future<int> addToFavorite(String word) =>
      favoriteWordsDao.addToFavorite(word);

  Future<List<String>> getFavoriteWords() =>
      favoriteWordsDao.getFavoriteWords();

  Future<int> remove(String word) => favoriteWordsDao.remove(word);

  Future<bool> isWordFavorite(String word) =>
      favoriteWordsDao.isWordFavorite(word);
}
