// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'MovieModel.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MovieModel _$MovieModelFromJson(Map<String, dynamic> json) => MovieModel(
      ref: json['ref'] as String?,
      nom: json['nom'] as String?,
      note: json['note'] as String?,
      urlImage: json['urlImage'] as String?,
      commentaire: json['commentaire'] as String?,
    );

Map<String, dynamic> _$MovieModelToJson(MovieModel instance) =>
    <String, dynamic>{
      'ref': instance.ref,
      'nom': instance.nom,
      'note': instance.note,
      'commentaire': instance.commentaire,
      'urlImage': instance.urlImage,
    };
