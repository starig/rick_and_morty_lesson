import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';
import 'package:rick_and_morty_lesson/models/character_response/character_response.dart';

part 'api.g.dart';

@RestApi(baseUrl: '')
abstract class RickAndMortyApiClient {
  factory RickAndMortyApiClient(Dio dio, {String baseUrl}) = _RickAndMortyApiClient;

  @GET('/character')
  Future<CharacterResponse> getCharacters();
}
