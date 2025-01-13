import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:rick_and_morty_lesson/data/sqflite/favorite_characters/schema.dart';
import 'package:rick_and_morty_lesson/dependency_injection/app_component.dart';
import 'package:rick_and_morty_lesson/domain/use_cases/add_to_favorite_characters_use_case.dart';
import 'package:rick_and_morty_lesson/domain/use_cases/delete_favorite_character_use_case.dart';
import 'package:rick_and_morty_lesson/domain/use_cases/get_characters_use_case.dart';
import 'package:rick_and_morty_lesson/domain/use_cases/get_favorite_characters_use_case.dart';
import 'package:rick_and_morty_lesson/models/character/character.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit()
      : super(
          HomeState(
            isPending: false,
            characters: [],
            favoriteCharacters: [],
            errorMessage: null,
            currentPage: 40,
            totalPages: 0,
            isAllLoaded: false,
            isLoadingMore: false,
          ),
        );

  final GetCharactersUseCase _getCharactersUseCase = getIt.get<GetCharactersUseCase>();
  final GetFavoriteCharactersUseCase _getFavoriteCharactersUseCase =
      getIt.get<GetFavoriteCharactersUseCase>();
  final DeleteFavoriteCharactersUseCase _deleteFavoriteCharactersUseCase =
      getIt.get<DeleteFavoriteCharactersUseCase>();
  final AddToFavoriteCharactersUseCase _addToFavoriteCharactersUseCase =
      getIt.get<AddToFavoriteCharactersUseCase>();

  getCharacters() async {
    state.currentPage = 1;
    state.isAllLoaded = false;
    state.characters = [];
    emit(state.copyWith(
      currentPage: state.currentPage,
      isAllLoaded: state.isAllLoaded,
      characters: state.characters,
    ));
    try {
      final response = await _getCharactersUseCase.execute(state.currentPage);
      state.characters = response.results;
      state.totalPages = response.info.pages;
      state.errorMessage = null;
      emit(state.copyWith(
        characters: state.characters,
        totalPages: state.totalPages,
        errorMessage: state.errorMessage,
      ));
      await getFavoriteCharacters();
    } on DioException catch (e) {
      state.errorMessage = e.message;
      emit(state.copyWith(
        errorMessage: state.errorMessage,
      ));
    }
  }

  loadMoreCharacters() async {
    state.currentPage += 1;
    state.isLoadingMore = true;
    emit(state.copyWith(
      isLoadingMore: state.isLoadingMore,
    ));
    if (state.currentPage == state.totalPages) {
      state.isAllLoaded = true;
      emit(state.copyWith(isAllLoaded: state.isAllLoaded));
    }
    try {
      final response = await _getCharactersUseCase.execute(state.currentPage);
      state.totalPages = response.info.pages;
      state.isLoadingMore = false;
      response.results.forEach((character) {
        state.characters = [...state.characters, character];
      });
    } catch (e) {
      state.isLoadingMore = false;
      emit(state.copyWith(isLoadingMore: state.isLoadingMore));
      inspect(e);
    }
    emit(state.copyWith(
      characters: state.characters,
      totalPages: state.totalPages,
      currentPage: state.currentPage,
      isLoadingMore: state.isLoadingMore,
    ));
  }

  Future<void> getFavoriteCharacters() async {
    try {
      List<int> _favoriteCharacters = [];
      final data = await _getFavoriteCharactersUseCase.execute();
      data.forEach((item) {
        _favoriteCharacters.add(item.characterId);
      });
      state.favoriteCharacters = _favoriteCharacters;
      emit(state.copyWith(favoriteCharacters: state.favoriteCharacters));
    } catch (e) {
      inspect(e);
    }
  }

  Future<void> toggleFavoriteCharacter(int id) async {
    final FavoriteCharacterModel favoriteCharacter = FavoriteCharacterModel(characterId: id);
    if (state.favoriteCharacters.contains(id)) {
      await _deleteFavoriteCharactersUseCase.execute(favoriteCharacter);
    } else {
      await _addToFavoriteCharactersUseCase.execute(favoriteCharacter);
    }
    await getFavoriteCharacters();
  }
}
