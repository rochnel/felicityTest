
import 'package:felicitytest/presentation/controller/Read_movie/list_movie_controller.dart';
import 'package:get/get.dart';

import '../../../data/repositorie/movie_repositorie.dart';
import '../../../domaine/usecases/movie_get_use_case.dart';

class MovieBindings extends Bindings {
  @override
  void dependencies() {
     Get.lazyPut(()=> MovieRepositoryIml());
        Get.lazyPut(() => GetMovieUseCase(Get.find<MovieRepositoryIml>()));
        Get.put(MovieController(Get.find()), permanent: true);
  }
}