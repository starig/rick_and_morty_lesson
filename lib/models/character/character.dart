import 'package:json_annotation/json_annotation.dart';

part 'character.g.dart';

enum CharacterStatus {
  @JsonValue('Alive')
  alive,

  @JsonValue('Dead')
  dead,

  @JsonValue('unknown')
  unknown,
}

enum CharacterGender {
  @JsonValue('Male')
  male,

  @JsonValue('Female')
  female,

  @JsonValue('Genderless')
  genderless,

  @JsonValue('unknown')
  unknown,
}

enum CharacterSpecies {
  @JsonValue('Human')
  human,

  @JsonValue('Alien')
  alien,

  other
}

@JsonSerializable()
class Character {
  final int id;
  final String name;
  final CharacterStatus status;
  @CharacterSpeciesConverter()
  final CharacterSpecies species;
  final String type;
  final CharacterGender gender;
  final Origin origin;
  final Location location;
  final String image;
  final List<String> episode;
  final String url;
  final DateTime created;

  Character({
    required this.id,
    required this.name,
    required this.status,
    required this.species,
    required this.type,
    required this.gender,
    required this.origin,
    required this.location,
    required this.image,
    required this.episode,
    required this.url,
    required this.created,
  });

  factory Character.fromJson(Map<String, dynamic> json) => _$CharacterFromJson(json);

  Map<String, dynamic> toJson() => _$CharacterToJson(this);
}

@JsonSerializable()
class Origin {
  final String name;
  final String url;

  Origin({
    required this.name,
    required this.url,
  });

  factory Origin.fromJson(Map<String, dynamic> json) => _$OriginFromJson(json);

  Map<String, dynamic> toJson() => _$OriginToJson(this);
}

@JsonSerializable()
class Location {
  final String name;
  final String url;

  Location({
    required this.name,
    required this.url,
  });

  factory Location.fromJson(Map<String, dynamic> json) => _$LocationFromJson(json);

  Map<String, dynamic> toJson() => _$LocationToJson(this);
}

class CharacterSpeciesConverter implements JsonConverter<CharacterSpecies, String> {
  const CharacterSpeciesConverter();

  @override
  CharacterSpecies fromJson(String json) {
    switch (json) {
      case 'Human':
        return CharacterSpecies.human;
      case 'Alien':
        return CharacterSpecies.alien;
      default:
        return CharacterSpecies.other;
    }
  }

  @override
  String toJson(CharacterSpecies object) {
    return object.name;
  }
}
