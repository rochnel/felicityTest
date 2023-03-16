import '../../data/models/MovieModel.dart';

abstract class MovieRepository {
  Future<bool?> newMovie(MovieModel movieModel);
  Future<List<MovieModel>?> getAllMovie();
  Future<bool?> updateMovie(MovieModel movieModel);
 
}