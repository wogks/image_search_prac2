// GENERATED CODE - DO NOT MODIFY BY HAND

// ignore_for_file: non_constant_identifier_names

part of 'photo_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_PhotoModel _$$_PhotoModelFromJson(Map<String, dynamic> json) =>
    _$_PhotoModel(
      tags: json['tags'] as String,
      previewURL: json['previewURL'] as String,
      id: json['id'] as int,
      largeImageURL: json['largeImageURL'] as String,
    );

Map<String, dynamic> _$$_PhotoModelToJson(_$_PhotoModel instance) =>
    <String, dynamic>{
      'tags': instance.tags,
      'previewURL': instance.previewURL,
      'id': instance.id,
      'largeImageURL': instance.largeImageURL,
    };
