import 'package:sqflite/sqflite.dart';
import 'package:sqflite/sqlite_api.dart';
import 'package:path/path.dart';

class FavoriteWordsDatabase {
  static final FavoriteWordsDatabase instance = FavoriteWordsDatabase._init();
  Database? _database;
  FavoriteWordsDatabase._init();

  Future<Database> get database async {
    if (_database != null) return _database!;

    _database = await _initializeDatabase(dbName);
    return _database!;
  }

  Future<Database> _initializeDatabase(String filePath) async {
    final databasePath = await getDatabasesPath();
    final path = join(databasePath, filePath);
    final db = await openDatabase(path, version: 1, onCreate: _createDatabase);

    return db;
  }

  Future<void> _createDatabase(Database db, int version) async {
    await db.execute(createFavoriteWordsTable);
  }

  Future<void> close() async {
    final database = await instance.database;
    database.close();
  }
}

const dbName = 'favorite_words.db';
const favoriteWordsTable = 'favorite_words';
const wordColumn = 'word';

const createFavoriteWordsTable =
    '''CREATE TABLE IF NOT EXISTS "$favoriteWordsTable" (
      "id" INTEGER PRIMARY KEY NOT NULL,
      "$wordColumn" TEXT NOT NULL
    );''';
