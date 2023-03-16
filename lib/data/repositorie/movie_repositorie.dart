

import 'package:felicitytest/domaine/repository/movie_repositorie.dart';
import 'package:get/get.dart';

import '../models/MovieModel.dart';
import '../service/movie_service.dart';

class MovieRepositoryIml extends MovieRepository {

  final store = Get.put(MovieService());

  @override
  Future<bool?> newMovie(MovieModel movie) async {
    return await store.addMovie(movie: movie);
  }
   @override
  Future<List<MovieModel>?> getAllMovie() {
    return store.getAllMovie();
  }
   @override
  Future<bool?> updateMovie(MovieModel movie,) async{
    return await store.updateMovie(movie: movie);
  }

 


}