import 'package:rick_and_morty_lesson/models/character_response/character_response.dart';
import 'package:rick_and_morty_lesson/services/rick_and_morty_api/api.dart';

class RickAndMortyRepository {
  final RickAndMortyApiClient apiClient;

  RickAndMortyRepository({required this.apiClient});

  Future<CharacterResponse> getCharacters() async {
    try {
      final response = await apiClient.getCharacters();
      return response;
    } catch (e) {
      rethrow;
    }
  }
}
