import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:rick_and_morty_lesson/dependency_injection/app_component.dart';
import 'package:rick_and_morty_lesson/domain/use_cases/get_characters_use_case.dart';
import 'package:rick_and_morty_lesson/models/character/character.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit()
      : super(
          HomeState(
            isPending: false,
            characters: [],
            errorMessage: null,
          ),
        );

  final GetCharactersUseCase _getCharactersUseCase = getIt.get<GetCharactersUseCase>();

  getCharacters() async {
    try {
      final response = await _getCharactersUseCase.execute();
      state.characters = response.results;
      state.errorMessage = null;
      emit(state.copyWith(
        characters: state.characters,
        errorMessage: state.errorMessage,
      ));
    } on DioException catch (e) {
      state.errorMessage = e.message;
      emit(state.copyWith(
        errorMessage: state.errorMessage,
      ));
    }
  }
}
