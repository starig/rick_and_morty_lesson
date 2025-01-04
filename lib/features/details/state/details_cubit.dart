import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:rick_and_morty_lesson/dependency_injection/app_component.dart';
import 'package:rick_and_morty_lesson/domain/use_cases/get_character_details_use_case.dart';
import 'package:rick_and_morty_lesson/models/character/character.dart';

part 'details_state.dart';

class DetailsCubit extends Cubit<DetailsState> {
  DetailsCubit()
      : super(
          DetailsState(
            details: null,
          ),
        );

  final GetCharacterDetailsUseCase _getCharacterDetailsUseCase =
      getIt.get<GetCharacterDetailsUseCase>();

  getDetail(int id) async {
    try {
      final response = await _getCharacterDetailsUseCase.execute(id);
      state.details = response;
      emit(state.copyWith(details: state.details));
    } on DioException catch (e) {
      state.errorMessage = e.message;
      emit(state.copyWith(
        errorMessage: state.errorMessage,
      ));
    }
  }
}
