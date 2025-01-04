import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:rick_and_morty_lesson/config/constants.dart';
import 'package:rick_and_morty_lesson/data/rick_and_morty/repository.dart';
import 'package:rick_and_morty_lesson/domain/use_cases/get_character_details_use_case.dart';
import 'package:rick_and_morty_lesson/domain/use_cases/get_characters_use_case.dart';
import 'package:rick_and_morty_lesson/services/rick_and_morty_api/api.dart';

final getIt = GetIt.instance;

configureDependencies() {
  _configureNetworkDependencies();
  _configureApiClients();
  _configureRepositories();
  _configureUseCases();
}

_configureNetworkDependencies() {
  final Dio dio = Dio();
  getIt.registerSingleton<Dio>(dio);
}

_configureApiClients() {
  final dio = getIt.get<Dio>();
  final String privateBaseUrl = AppConstants.rickAndMortyApiUrl;

  getIt.registerLazySingleton<RickAndMortyApiClient>(
    () => RickAndMortyApiClient(dio, baseUrl: privateBaseUrl),
  );
}

_configureRepositories() {
  final RickAndMortyApiClient rickAndMortyApiClient = getIt.get<RickAndMortyApiClient>();

  getIt.registerLazySingleton<RickAndMortyRepository>(
    () => RickAndMortyRepository(apiClient: rickAndMortyApiClient),
  );
}

_configureUseCases() {
  final RickAndMortyRepository rickAndMortyRepository = getIt.get<RickAndMortyRepository>();

  getIt
    ..registerLazySingleton<GetCharacterDetailsUseCase>(
      () => GetCharacterDetailsUseCase(rickAndMortyRepository),
    )
    ..registerLazySingleton<GetCharactersUseCase>(
      () => GetCharactersUseCase(rickAndMortyRepository),
    );
}
