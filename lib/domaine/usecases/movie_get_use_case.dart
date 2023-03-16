
import 'package:felicitytest/data/models/MovieModel.dart';
import 'package:felicitytest/domaine/repository/movie_repositorie.dart';

import '../../app/core/usecases/no_param_usecase.dart';

class GetMovieUseCase extends NoParamUseCase<List<MovieModel>?> {
  final MovieRepository _repo;
  GetMovieUseCase(this._repo);

  @override
  Future<List<MovieModel>?> execute() {
    return _repo.getAllMovie();
  }

}