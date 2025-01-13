import 'package:rick_and_morty_lesson/data/repositories/favorite_characters/repository.dart';
import 'package:rick_and_morty_lesson/data/sqflite/favorite_characters/schema.dart';

class AddToFavoriteCharactersUseCase {
  final FavoriteCharactersRepository _repository;

  AddToFavoriteCharactersUseCase(this._repository);

  Future<void> execute(FavoriteCharacterModel character) async {
    try {
      await _repository.addFavoriteCharacter(character);
    } catch (e) {
      rethrow;
    }
  }
}
