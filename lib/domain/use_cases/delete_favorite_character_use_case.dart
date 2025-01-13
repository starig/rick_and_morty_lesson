import 'package:rick_and_morty_lesson/data/repositories/favorite_characters/repository.dart';
import 'package:rick_and_morty_lesson/data/sqflite/favorite_characters/schema.dart';

class DeleteFavoriteCharactersUseCase {
  final FavoriteCharactersRepository _repository;

  DeleteFavoriteCharactersUseCase(this._repository);

  Future<void> execute(FavoriteCharacterModel character) async {
    try {
      await _repository.deleteFavoriteCharacter(character);
    } catch (e) {
      rethrow;
    }
  }
}
