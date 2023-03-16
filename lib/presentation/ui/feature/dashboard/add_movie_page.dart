import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../app/config/app_colors.dart';
import '../../../../app/extensions/loading.dart';
import '../../../controller/Create_movie/form_add_movie_controller.dart';
import '../../../widgets/text_field_widget.dart';

class AddMovie extends GetView<FormAddMovieController> {
  TextEditingController nomController = TextEditingController();
  TextEditingController noteController = TextEditingController();
  TextEditingController commentaireController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height * (1 / 812.0);
    var width = MediaQuery.of(context).size.width * (1 / 375.0);
    return Scaffold(
      appBar: AppBar(
          title: Text(
            "AJOUTER UN NOUVEAU FILMS",
            style: TextStyle(fontSize: 12),
          ),
          centerTitle: true),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              SizedBox(
                height: height * 20,
              ),
              ElevatedButton(
                onPressed: () async {
                  await controller.getImage();
                },
                child: Text('Select Image'),
              ),
              Obx(() {
                if (controller.image.value != null) {
                  return Container(
                    width: 200,
                    height: 200,
                    child: Image.file(
                      controller.image.value!,
                      fit: BoxFit.cover,
                    ),
                  );
                } else {
                  return Text('No image selected');
                }
              }),
              SizedBox(
                height: height * 10,
              ),
              Obx(() {
                return TextFildWidget(
                  textInputType: TextInputType.text,
                  controller: nomController,
                  onChanged: controller.nomChanged,
                  isPassword: false,
                  labelText: "Nom du film",
                  hintText: "nom",
                  messageErro: controller.errornom.value,
                );
              }),
              SizedBox(
                height: height * 10,
              ),
              Obx(() {
                return TextFildWidget(
                  textInputType: TextInputType.number,
                  controller: noteController,
                  onChanged: controller.noteChanged,
                  isPassword: false,
                  labelText: "Note du film",
                  hintText: "note",
                  messageErro: controller.errornote.value,
                );
              }),
              SizedBox(
                height: height * 10,
              ),
              Obx(() {
                return TextFildWidget(
                  textInputType: TextInputType.text,
                  controller: commentaireController,
                  onChanged: controller.commantaireChanged,
                  isPassword: false,
                  labelText: "Commentaire du film",
                  hintText: "commentaire",
                  messageErro: controller.errorcommentaire.value,
                );
              }),
              SizedBox(
                height: height * 10,
              ),
              Obx(
                () => Padding(
                  padding: EdgeInsets.only(top: height * 10),
                  child: (controller.loadinAddMovie.value == false)
                      ? ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            primary: AppColors.primaryColor,
                            onSurface: const Color.fromARGB(
                                255, 166, 203, 233), // Disable color
                          ),
                          child: Container(
                            width: width * 305,
                            height: height * 56,
                            decoration: const BoxDecoration(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(8))),
                            child: Center(child: Text("Enregistrer le film")),
                          ),
                          onPressed: controller.submitFunc.value,
                        )
                      : LoadingBlue(),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
