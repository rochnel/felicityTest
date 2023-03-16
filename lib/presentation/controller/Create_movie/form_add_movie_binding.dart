import 'package:felicitytest/data/repositorie/movie_repositorie.dart';
import 'package:get/get.dart';

import '../../../domaine/usecases/movie_add_use_case.dart';
import 'form_add_movie_controller.dart';

class FormAddMovieBindings extends Bindings {
  @override
  void dependencies() {
        Get.lazyPut(() => NewMovieUseCase(Get.find<MovieRepositoryIml>()));
        Get.put(FormAddMovieController(Get.find()), permanent: true);
  }
}