import 'package:flutter_english_app/database/favorite_words_database.dart';

class FavoriteWordsDao {
  final _dbInstance = FavoriteWordsDatabase.instance;

  Future<int> addToFavorite(String word) async {
    final db = await _dbInstance.database;
    final id = db.insert(favoriteWordsTable, {
      wordColumn: word,
    });

    return id;
  }

  Future<List<String>> getFavoriteWords() async {
    final db = await _dbInstance.database;
    final favoriteWords = await db.query(favoriteWordsTable);

    return favoriteWords.map((e) => e[wordColumn].toString()).toList();
  }

  Future<bool> isWordFavorite(String word) async {
    final db = await _dbInstance.database;
    final queryResult = await db.query(
      favoriteWordsTable,
      where: '$wordColumn = ?',
      whereArgs: [word],
    );

    return queryResult.isNotEmpty;
  }

  Future<int> remove(String word) async {
    final db = await _dbInstance.database;
    final id = db.delete(
      favoriteWordsTable,
      where: '$wordColumn = ?',
      whereArgs: [word],
    );
    return id;
  }
}
