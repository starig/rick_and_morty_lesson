class FavoriteCharactersFields {
  static const String tableName = 'favoriteCharacters';
  static const String idType = 'INTEGER PRIMARY KEY';
  static const String characterId = 'character_id';
}

class FavoriteCharacterModel {
  final int characterId;

  FavoriteCharacterModel({required this.characterId});

  Map<String, Object?> toJson() => {
        FavoriteCharactersFields.characterId: characterId,
      };

  factory FavoriteCharacterModel.fromJson(Map<String, dynamic> json) {
    return FavoriteCharacterModel(
      characterId: json[FavoriteCharactersFields.characterId] as int,
    );
  }

  FavoriteCharacterModel copyWith({
    int? characterId,
  }) {
    return FavoriteCharacterModel(characterId: characterId ?? this.characterId);
  }
}
