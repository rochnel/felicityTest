import 'package:felicitytest/domaine/usecases/movie_update_use_case.dart';
import 'package:felicitytest/presentation/controller/Update_movie/form_update_movie_controller.dart';
import 'package:get/get.dart';

import '../../../data/repositorie/movie_repositorie.dart';

class FormUpdateMovieBindings extends Bindings {
  @override
  void dependencies() {
        Get.lazyPut(() => UpdateMovieUseCase(Get.find<MovieRepositoryIml>()));
        Get.put(FormUpdateMovieController(Get.find()), permanent: true);
  }
}