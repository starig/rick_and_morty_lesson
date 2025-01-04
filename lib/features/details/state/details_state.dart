part of 'details_cubit.dart';

class DetailsState {
  Character? details;
  String? errorMessage;

  DetailsState({
    this.details,
    this.errorMessage,
  });

  DetailsState copyWith({
    Character? details,
    String? errorMessage,
  }) {
    return DetailsState(
      details: details ?? this.details,
      errorMessage: errorMessage ?? this.errorMessage,
    );
  }
}
