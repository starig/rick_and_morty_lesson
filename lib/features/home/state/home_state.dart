part of 'home_cubit.dart';

class HomeState {
  bool isPending;
  List<Character> characters;
  String? errorMessage;

  HomeState({
    required this.isPending,
    required this.characters,
    this.errorMessage,
  });

  HomeState copyWith({
    bool? isPending,
    List<Character>? characters,
    String? errorMessage,
  }) {
    return HomeState(
      isPending: isPending ?? this.isPending,
      characters: characters ?? this.characters,
      errorMessage: errorMessage ?? this.errorMessage,
    );
  }
}
