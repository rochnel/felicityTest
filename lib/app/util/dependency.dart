import 'package:felicitytest/data/repositorie/movie_repositorie.dart';
import 'package:get/get.dart';

import '../../presentation/controller/Read_movie/list_movie_binding.dart';



class DenpendencyCreator {
  static init() {
    Get.lazyPut(() => MovieRepositoryIml());
    MovieBindings().dependencies();
  
  }
}
