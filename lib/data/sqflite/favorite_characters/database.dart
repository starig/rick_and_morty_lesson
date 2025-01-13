import 'package:rick_and_morty_lesson/data/sqflite/favorite_characters/schema.dart';
import 'package:sqflite/sqflite.dart';

class FavoriteCharactersDatabase {
  static final FavoriteCharactersDatabase instance = FavoriteCharactersDatabase._internal();

  static Database? _database;

  FavoriteCharactersDatabase._internal();

  Future<Database> get database async {
    if (_database != null) {
      return _database!;
    }

    _database = await _initDatabase();

    return _database!;
  }

  Future<Database> _initDatabase() async {
    final databasePath = await getDatabasesPath();
    final path = '$databasePath/favorite_characters_db.db';
    return await openDatabase(
      path,
      version: 1,
      onCreate: _createDatabase,
    );
  }

  Future<void> _createDatabase(Database db, int version) async {
    return await db.execute('''
        CREATE TABLE ${FavoriteCharactersFields.tableName} (
          ${FavoriteCharactersFields.characterId} ${FavoriteCharactersFields.idType}
        )
      ''');
  }
}
