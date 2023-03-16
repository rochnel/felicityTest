
import 'package:felicitytest/domaine/repository/movie_repositorie.dart';

import '../../../app/core/usecases/pram_usecase.dart';
import '../../data/models/MovieModel.dart';

class NewMovieUseCase extends ParamUseCase<bool?, MovieModel> {
  final MovieRepository _repo;
  NewMovieUseCase(this._repo);

  @override
  Future<bool?> execute(MovieModel movie) {
    return _repo.newMovie(movie);
  }
}