import 'package:felicitytest/presentation/ui/app.dart';
import 'package:flutter/material.dart';

import 'app/config/app_configs.dart';
import 'app/util/dependency.dart';

void main() async {
  await Configs.initApp();
  DenpendencyCreator.init();
  runApp(FelecityAppTest());
}
