// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'character_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CharacterResponse _$CharacterResponseFromJson(Map<String, dynamic> json) =>
    CharacterResponse(
      info:
          CharacterResponseInfo.fromJson(json['info'] as Map<String, dynamic>),
      results: (json['results'] as List<dynamic>)
          .map((e) => Character.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$CharacterResponseToJson(CharacterResponse instance) =>
    <String, dynamic>{
      'results': instance.results,
      'info': instance.info,
    };

CharacterResponseInfo _$CharacterResponseInfoFromJson(
        Map<String, dynamic> json) =>
    CharacterResponseInfo(
      count: (json['count'] as num).toInt(),
      pages: (json['pages'] as num).toInt(),
      next: json['next'] as String?,
      prev: json['prev'] as String?,
    );

Map<String, dynamic> _$CharacterResponseInfoToJson(
        CharacterResponseInfo instance) =>
    <String, dynamic>{
      'count': instance.count,
      'pages': instance.pages,
      'next': instance.next,
      'prev': instance.prev,
    };
