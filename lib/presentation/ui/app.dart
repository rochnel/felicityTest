




import 'package:felicitytest/presentation/ui/feature/dashboard/home_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../app/config/app_routes.dart';
import '../../app/config/app_theme.dart';

class FelecityAppTest extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'kaarkoo',
      theme: theme(),
      initialRoute: "/",
      home: HomePage(),
      
      getPages: routes,
    );
  }
}