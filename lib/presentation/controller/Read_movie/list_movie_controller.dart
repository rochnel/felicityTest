
import 'package:felicitytest/data/service/movie_service.dart';
import 'package:felicitytest/domaine/usecases/movie_get_use_case.dart';
import 'package:get/get.dart';


class MovieController extends GetxController {

  final GetMovieUseCase _getMovieUseCase;
  MovieController(this._getMovieUseCase);

  RxBool isLoading = RxBool(false);

  Rxn<Function()> submitFunc = Rxn<Function()>(null);
final store = Get.put(MovieService());


  @override
  void onInit() async{
    super.onInit();
   /* await _getMovieUseCase.execute().then((result) {
           print(result);
          });*/

  }



}