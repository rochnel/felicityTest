

import '../../domaine/entities/MovieEntity.dart';
import 'package:json_annotation/json_annotation.dart';
part 'MovieModel.g.dart';

@JsonSerializable()
class MovieModel extends MovieEntity{
  String? ref;
  String? nom;
  String? note;
  String? commentaire;
  String? urlImage;
 


  MovieModel({
    this.ref,
    this.nom,
    this.note,
    this.urlImage,
    this.commentaire
   
  }):super(

  );

  
   factory MovieModel.fromJson(Map<String, dynamic> json) => _$MovieModelFromJson(json);
  Map<String, dynamic> toJson() => _$MovieModelToJson(this);

}