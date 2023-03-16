import 'dart:ui';

import 'package:felicitytest/data/models/MovieModel.dart';
import 'package:felicitytest/presentation/controller/Create_movie/form_add_movie_binding.dart';
import 'package:felicitytest/presentation/ui/feature/dashboard/update_movi_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../controller/Read_movie/list_movie_controller.dart';
import '../../../controller/Update_movie/form_update_movie_binding.dart';
import '../../../widgets/Card_movie.dart';
import '../../../widgets/widget_error.dart';

class HomePage extends StatelessWidget {
  // Accéder au contrôleur
  final MovieController controller = Get.find<MovieController>();

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height * (1 / 812.0);
    var width = MediaQuery.of(context).size.width * (1 / 375.0);

    return Scaffold(
      appBar: AppBar(
          title: Text("LISTE DES FIMLS"),
          actions: [
            IconButton(onPressed: (){

            }, icon: Icon(Icons.sync))
          ],
          centerTitle: true),
      body: FutureBuilder<List<MovieModel>?>(
        future: controller.store
            .getAllMovie(), // appel de votre feature qui retourne une Future<List<MyObject>>
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return CircularProgressIndicator(); // affichage d'un indicateur de chargement pendant l'attente de la réponse
          } else if (snapshot.hasError) {
            return Text(
                'Erreur: ${snapshot.error}'); // affichage d'un message d'erreur si la requête a échoué
          } else {
            final List<MovieModel> myObjects =
                snapshot.data!; // récupération de la liste d'objets
            return(myObjects.isEmpty)? Center(child: Text("Aucun film enregistré", style: TextStyle(fontSize: 16),)):
            ListView.builder(
              itemCount: myObjects.length,
              itemBuilder: (context, index) {
                final MovieModel myObject = myObjects[index];
                return CardMovie(
                    height: height,
                    width: width,
                    movie: myObject,
                    pressDelete: () {
                      controller.store.removeMovie(myObject.ref!);
                    },
                    pressUpdate: () {
                      FormUpdateMovieBindings().dependencies();
                      Navigator.of(context).push(new MaterialPageRoute(
                          builder: (context) => UpdateMovie(
                                movie: myObject,
                              )));
                    });
              },
            )
            ;
          }
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          FormAddMovieBindings().dependencies();
          Get.toNamed('/add_movie');
        },
        backgroundColor: Colors.blue,
        child: const Icon(Icons.add),
      ),
    );
  }
}
