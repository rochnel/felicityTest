import 'dart:io';

import 'package:felicitytest/app/util/date/date_utils.dart';
import 'package:felicitytest/data/models/MovieModel.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:image_picker/image_picker.dart';

import '../../../app/util/device_utils.dart';
import '../../../domaine/usecases/movie_add_use_case.dart';

class FormAddMovieController extends GetxController {
  FormAddMovieController(
    this._addMovieUseCase,
  );

  //////////////////////////////////////////////////////////////////////////////
  /////////////////// DECLARATION ALL USE CASE
  //////////////////////////////////////////////////////////////////////////////

  NewMovieUseCase _addMovieUseCase;

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

  RxBool canAddMovie = RxBool(false);
   final picker = ImagePicker();
 // final _image = Rxn<File>();
  Rx<File?> image = Rx<File?>(null);

  var loadinAddMovie = false.obs;
  Rxn<Function()> submitFunc = Rxn<Function()>(null);

  GetStorage box = GetStorage();

  @override
  void onInit() {
    super.onInit();
    //resetData();
    debounce<String>(nom, validationsNom,
        time: const Duration(milliseconds: 500));
    debounce<String>(note, validationsNote,
        time: const Duration(milliseconds: 500));
    debounce<String>(commentaire, validationsCommentaire,
        time: const Duration(milliseconds: 500));
    everAll([isNomOk, isNoteOk, isCommentaireOk],
        (value) => validationFormOK(value));
  }

  //////////////////////////////////////////////////////////////////////////////
  /////////////////// FUNCTION GET VALUE FIELD
  //////////////////////////////////////////////////////////////////////////////

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


  ////
  ///
  ///


  Future getImage() async {
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);

    if (pickedFile != null) {
    //  _image.value = File(pickedFile.path);
       image.value = File(pickedFile.path);
     saveImage(image.value!);
    } else {
      print('No image selected.');
    }
  }
  Future saveImage(File image) async {
  imageUrl.value = image.path;
}
  

  //////////////////////////////////////////////////////////////////////////////
  /////////////////// FUNCTION VALIDATED FIELD
  //////////////////////////////////////////////////////////////////////////////

  void validationsNom(String val) async {
    if (val.isEmpty) {
      errornom.value = "Nom est un champs obligatoire";
      isNomOk.value = false;
    } else {
      errornom.value = null;
      isNomOk.value = true;
    }
  }

  void validationsNote(String val) async {
    if (val.isEmpty) {
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
    if (isNomOk.value == true &&
        isNoteOk.value == true &&
        isimageUrlOk.value == true &&
        isCommentaireOk.value == true) {
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
          //  DateManageUtils.hideKeyboard(Get.context!);
          // Récupérer la date courante
          DateTime now = DateTime.now();

// Récupérer l'année courante
          int currentYear = now.year;
          var data = GetStorage().read('nbrFilms');
          String nomF = nom.value.substring(0, 2).toUpperCase();
          print("$currentYear$nomF${(data + 1)}");
          MovieModel model = MovieModel(
              ref: "$currentYear$nomF${(data + 1)}",
              nom: nom.value,
              urlImage: imageUrl.value,
              commentaire: commentaire.value,
              note: note.value);
          print("object");
          loadinAddMovie(true);
          await _addMovieUseCase.execute(model).then((result) {
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

  void resetData() {
    isNomOk.value = false;
    isNoteOk.value = false;
    isimageUrlOk.value = false;
    isCommentaireOk.value = false;
  }
}
