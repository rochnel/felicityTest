import 'package:felicitytest/presentation/ui/app.dart';
import 'package:flutter/material.dart';

import 'app/config/app_configs.dart';
import 'app/util/dependency.dart';
  //////////////////////////////////////////////////////////////////////////////////////////////
  /////////////////// POUR LA REALISATION DE SE PROJET, UN ACCENT PARTICULIER A ETE MIS SUR //////////
  /////////////////// L'architecture du projet et les mise en PRATIQUE DES BEST PRATIC /////////
  ////////////////////////////////////////////////////////////////////////////////////////////

void main() async {
  await Configs.initApp();
  DenpendencyCreator.init();
  runApp(FelecityAppTest());
}
