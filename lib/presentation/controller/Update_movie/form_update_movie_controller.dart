


import 'package:felicitytest/app/util/device_utils.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import '../../../data/models/MovieModel.dart';
import '../../../domaine/usecases/movie_update_use_case.dart';

class FormUpdateMovieController extends GetxController {

  FormUpdateMovieController(this._updateMovieUseCase,);

  //////////////////////////////////////////////////////////////////////////////
  /////////////////// DECLARATION ALL USE CASE
  //////////////////////////////////////////////////////////////////////////////

  UpdateMovieUseCase _updateMovieUseCase;
 


  //////////////////////////////////////////////////////////////////////////////
  /////////////////// DECLARATION RX VARIABLE
  //////////////////////////////////////////////////////////////////////////////

  RxString nom = RxString('');
  RxString note = RxString('');
  RxString imageUrl = RxString('');
  RxString commentaire = RxString('');

  RxnString errornom = RxnString(null);
  RxnString errornote = RxnString(null);
  RxnString errorcommentaire = RxnString(null);


  RxBool isNomOk = RxBool(false);
  RxBool isNoteOk = RxBool(false);
  RxBool isimageUrlOk = RxBool(true);
  RxBool isCommentaireOk = RxBool(false);

  TextEditingController nomController = TextEditingController();

  TextEditingController noteController = TextEditingController();

  TextEditingController commentaireController = TextEditingController();

  RxBool canAddMovie = RxBool(false);
  Rxn<MovieModel> currentMovie = Rxn<MovieModel>(null);

  var loadinAddMovie = false.obs;
  Rxn<Function()> submitFunc = Rxn<Function()>(null);


  @override
  void onInit() {
    super.onInit();
    //resetData();
    debounce<String>(nom, validationsNom, time: const Duration(milliseconds: 500));
    debounce<String>(note, validationsNote, time: const Duration(milliseconds: 500));
    debounce<String>(commentaire, validationsCommentaire, time: const Duration(milliseconds: 500));
    everAll([isNomOk,isNoteOk,isCommentaireOk],(value) => validationFormOK(value));

  }



  //////////////////////////////////////////////////////////////////////////////
  /////////////////// FUNCTION GET VALUE FIELD
  //////////////////////////////////////////////////////////////////////////////


 void initData(MovieModel movie) {
    
    currentMovie.value = movie;
    nom.value = movie.nom!;
    note.value = movie.note!;
    commentaire.value = movie.commentaire!;
    nomController.text = movie.nom!;
    noteController.text = movie.note!;
    commentaireController.text = movie.commentaire!;
   
  }
  void nomChanged(String val) {
    nom.value = val;
  }

  void noteChanged(String val) {
    note.value = val;
  }
   void imageUrlChanged(String val) {
    imageUrl.value = val;
  }
   void commantaireChanged(String val) {
    commentaire.value = val;
  }

  //////////////////////////////////////////////////////////////////////////////
  /////////////////// FUNCTION VALIDATED FIELD
  //////////////////////////////////////////////////////////////////////////////

void validationsNom(String val) async {
    if (val.isEmpty ) {
      errornom.value = "Nom est un champs obligatoire";
      isNomOk.value = false;
    } else {
      errornom.value = null;
      isNomOk.value = true;
    } 
  }

void validationsNote(String val) async {
    if (val.isEmpty ) {
      errornote.value = "Note est un champs obligatoire";
      isNoteOk.value = false;
    } else {
      errornote.value = null;
      isNoteOk.value = true;
    } 
  }

  

  void validationsCommentaire(String val) async {
    if (val.isEmpty) {
      errorcommentaire.value = "Commentaire est un champs obligatoire";
      isCommentaireOk.value = false;
    } else if (val.length <= 5) {
      errorcommentaire.value = "Le champs doit avoir au mois 5 caractére";
      isCommentaireOk.value = false;
    } else {
      errorcommentaire.value = null;
      isCommentaireOk.value = true;
    }
  }



  void validationFormOK(bool val) async {
    if (isNomOk.value == true && isNoteOk.value == true && isimageUrlOk.value == true && isCommentaireOk.value == true) {
      canAddMovie.value = true;
      submitFunc.value = submitAddMovieFunction();
    } else {
      canAddMovie.value = false;
      submitFunc.value = null;
    }
  }





  //////////////////////////////////////////////////////////////////////////////
  /////////////////// FUNCTION CONTROLLER
  //////////////////////////////////////////////////////////////////////////////

  Future<bool> Function() submitAddMovieFunction() {
     return () async {
      await Future.delayed(const Duration(seconds: 1), () async {
        try {
          DeviceUtils.hideKeyboard(Get.context!);
          MovieModel model =  MovieModel(
           ref: currentMovie.value!.ref!,
            nom: nom.value,
            urlImage: imageUrl.value,
            commentaire: commentaire.value,
            note: note.value

          );
         
          loadinAddMovie(true);
          await _updateMovieUseCase.execute(model).then((result) {
            if (result!) {
              loadinAddMovie(false);
            
            } else {
              loadinAddMovie(false);
            }
          });
        } catch (error) {
          loadinAddMovie(false);
        }
      });
      return true;
    };
  }



  void resetData()  {
    isNomOk.value = false;
    isNoteOk.value = false;
    isimageUrlOk.value = false;
    isCommentaireOk.value = false;
     nom.value = "";
    note.value = "";
    commentaire.value = "";
  }

  static GetStorage() {}


}


