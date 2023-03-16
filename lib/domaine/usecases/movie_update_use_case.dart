
import '../../app/core/usecases/pram_usecase.dart';
import '../../data/models/MovieModel.dart';
import '../repository/movie_repositorie.dart';

class UpdateMovieUseCase extends ParamUseCase<bool?, MovieModel> {
  final MovieRepository _repo;
  UpdateMovieUseCase(this._repo);

  @override
  Future<bool?> execute(MovieModel movie) {
    return _repo.updateMovie(movie);
  }
}