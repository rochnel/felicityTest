import 'dart:convert';

import 'package:felicitytest/data/models/MovieModel.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../presentation/widgets/widget_error.dart';

class MovieService extends GetxService {


  //add movie methode
  Future<bool?> addMovie({required MovieModel movie}) async {
    try {
      final prefs = await SharedPreferences.getInstance();
      final movieString = prefs.getString('Movie');
      if (movieString != null) {
        final movieMap = jsonDecode(movieString) as List<dynamic>;
        movieMap.add(movie.toJson());
        prefs.setString('Movie', jsonEncode(movieMap));
      } else {
        final nouvellesmovie = [movie.toJson()];
        prefs.setString('Movie', jsonEncode(nouvellesmovie));
      }
      showSuccessMessage(Get.context!,
          error: StoreError(
            type: 'Information',
            errorMessage: "Film ajouter avec succés!!",
          ));

      Get.offAndToNamed('/');
      return true;
    } catch (e) {
      print("erreur $e");
      return false;
    }
  }

//recuperrer tous les fimls en memoire
  Future<List<MovieModel>?> getAllMovie() async {
    final prefs = await SharedPreferences.getInstance();
    final movieString = prefs.getString('Movie');
    if (movieString != null) {
      final movieMap = jsonDecode(movieString) as List<dynamic>;
      final movie = movieMap
          .map((p) => MovieModel.fromJson(p as Map<String, dynamic>))
          .toList();
      GetStorage().remove('nbrFilms');
      GetStorage().write('nbrFilms', movie.length);
      return movie;
    } else {
      return [];
    }
  }


//modifier un film
  Future<bool?> updateMovie({required MovieModel movie}) async {
    print('update...');
    SharedPreferences prefs = await SharedPreferences.getInstance();
    final movieString = prefs.getString('Movie');
    final movieMap = jsonDecode(movieString!) as List<dynamic>;
    final movieL = movieMap
        .map((p) => MovieModel.fromJson(p as Map<String, dynamic>))
        .toList();
         print(movieL.length);
    MovieModel movieAModifier = movieL.firstWhere((p) => p.ref == movie.ref);
    MovieModel movieModifiee = MovieModel(
      ref: movieAModifier.ref,
      nom: movie.nom,
      note: movie.note,
      commentaire: movie.commentaire,
    ); // créer une nouvelle instance de Personne avec les modifications

    List<MovieModel> nouvelleListeMovie = movieL.map((p) {
      if (p.ref == movieAModifier.ref) {
        return movieModifiee;
      } else {
        return p;
      }
    }).toList(); // créer une nouvelle liste de Personne avec l'objet modifié
   
    final jsonString = jsonEncode(nouvelleListeMovie);
    prefs.setString("Movie", jsonString);
    Get.offAndToNamed('/');
    showSuccessMessage(Get.context!,
        error: StoreError(
          type: 'Information',
          errorMessage: "Film modifier avec succés!!",
        ));
    return true;
  }

// Supprime l'objet avec la ref de la liste d'objets stockée dans les SharedPreferences
  void removeMovie(String ref) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    final movieString = prefs.getString('Movie');
    final movieMap = jsonDecode(movieString!) as List<dynamic>;
    final movieL = movieMap
        .map((p) => MovieModel.fromJson(p as Map<String, dynamic>))
        .toList();
    print(movieL.length);
    MovieModel movieASupprimer = movieL.firstWhere((p) => p.ref == ref);
    movieL.remove(movieASupprimer);
    final jsonString = jsonEncode(movieL);
    prefs.setString("Movie", jsonString);
    Get.offAndToNamed('/');
    showSuccessMessage(Get.context!,
        error: StoreError(
          type: 'Information',
          errorMessage: "Film retirer avec succés!!",
        ));
  }


  //fonction pour uploade les images sur firebase
  final _storageRef = FirebaseStorage.instance.ref().child('images');
  final _databaseRef = FirebaseFirestore.instance.collection('Movie');


  Future<String> uploadImage(String imagePath) async {
    final file = File(imagePath);
    final storageRef = _storageRef.child('${DateTime.now().millisecondsSinceEpoch}.jpg');
    final uploadTask = storageRef.putFile(file);
    final snapshot = await uploadTask.whenComplete(() {});
    final downloadUrl = await snapshot.ref.getDownloadURL();
    return downloadUrl;
  }

  //fonction de synchronisation
  Future<void> syncData() async {
    final localData = await getAllMovie();
    final firebaseData = await _databaseRef.get();
    final firebaseList = firebaseData.docs.map((doc) => MovieModel.fromJson(doc.data())).toList();

    for (final localObj in localData) {
      final existingObj = firebaseList.firstWhere(
        (firebaseObj) => firebaseObj.nom == localObj.nom,
        orElse: () => null,
      );

      if (existingObj == null) {
        final imageUrl = await uploadImage(localObj.imageUrl);
        final newObj = MovieModel(nom: localObj.nom ,commentaire: localObj.commentaire, note:localObj.note, urlImage: imageUrl);
        await _databaseRef.add(newObj.toJson());
      }
    }
  }

}
