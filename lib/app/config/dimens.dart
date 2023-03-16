
import 'package:flutter/cupertino.dart';

class Dimens {
  Dimens._();

  //for all screens
  static const double horizontal_padding = 20.0;
  static const double vertical_padding = 20.0;
  static const double rotation = 8.0;
  static const double title = 20.0;
  static const double icon = 25.0;
  static const double raduis20 = 20.0;
  static const double appBarHeight = 62.0;
  static const double size10 = 10.0;
  static const double size15 = 15.0;
  static const double size25 = 25.0;
  static const double size20 = 20.0;
  static const double size30 = 30.0;

  static double fullwidth(BuildContext context){
    return MediaQuery.of(context).size.width;
  }
  static double fullheight(BuildContext context){
    return MediaQuery.of(context).size.height;
  }
}