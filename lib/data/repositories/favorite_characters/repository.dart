import 'package:rick_and_morty_lesson/data/sqflite/favorite_characters/schema.dart';
import 'package:sqflite/sqflite.dart';

class FavoriteCharactersRepository {
  final Database database;

  FavoriteCharactersRepository({required this.database});

  Future<void> addFavoriteCharacter(FavoriteCharacterModel character) async {
    try {
      await database.insert(
        FavoriteCharactersFields.tableName,
        character.toJson(),
      );
    } catch (e) {
      rethrow;
    }
  }

  Future<void> deleteFavoriteCharacter(FavoriteCharacterModel character) async {
    try {
      await database.delete(
        FavoriteCharactersFields.tableName,
        where: '${FavoriteCharactersFields.characterId} = ?',
        whereArgs: [character.characterId],
      );
    } catch (e) {
      rethrow;
    }
  }

  Future<List<FavoriteCharacterModel>> getFavoriteCharacters() async {
    try {
      final data = await database.query(FavoriteCharactersFields.tableName);
      List<FavoriteCharacterModel> characters = [];

      for (var item in data) {
        characters = [...characters, FavoriteCharacterModel.fromJson(item)];
      }

      return characters;
    } catch (e) {
      rethrow;
    }
  }
}
