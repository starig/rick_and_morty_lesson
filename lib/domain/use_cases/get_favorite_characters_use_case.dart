import 'package:rick_and_morty_lesson/data/repositories/favorite_characters/repository.dart';
import 'package:rick_and_morty_lesson/data/sqflite/favorite_characters/schema.dart';

class GetFavoriteCharactersUseCase {
  final FavoriteCharactersRepository _repository;

  GetFavoriteCharactersUseCase(this._repository);

  Future<List<FavoriteCharacterModel>> execute() async {
    try {
      return await _repository.getFavoriteCharacters();
    } catch (e) {
      rethrow;
    }
  }
}
