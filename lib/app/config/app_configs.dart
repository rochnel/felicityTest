import 'package:algolia/algolia.dart';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:get_storage/get_storage.dart';
import 'package:jiffy/jiffy.dart';
import 'package:path_provider/path_provider.dart' as path_provider;


class Configs {
  static Algolia? algolia;

  Configs._();

  static Future<void> initApp() async {
    WidgetsFlutterBinding.ensureInitialized();
    setPreferredOrientations();
    //initStripe();
    
    await Jiffy.locale('fr');
    await GetStorage.init();

  }

  // static void setAuthuser(UserModel? val) async {
  //   profileAuthUser = val;
  // }

  static Future<void> setPreferredOrientations() {
    return SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
      DeviceOrientation.landscapeRight,
      DeviceOrientation.landscapeLeft,
    ]);
  }

}
