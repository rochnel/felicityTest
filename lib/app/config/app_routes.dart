import 'package:felicitytest/presentation/controller/Read_movie/list_movie_binding.dart';
import 'package:felicitytest/presentation/ui/feature/dashboard/add_movie_page.dart';
import 'package:felicitytest/presentation/ui/feature/dashboard/home_page.dart';
import 'package:get/get.dart';


final List<GetPage<dynamic>> routes = [

  GetPage(
    name: '/',
    page: () => HomePage(),
    binding: MovieBindings()
  ),
  GetPage(
    name: '/add_movie',
    page: () => AddMovie(),
  ),

 

];
