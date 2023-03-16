import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

import '../config/app_colors.dart';

class Loading extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return const Center(
      child: SpinKitCircle(
        color: Colors.white,
        size: 50.0,
      ),
    );
  }
}


class LoadingBlue extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return const Center(
      child: SpinKitCircle(
        color: AppColors.primaryColor,
        size: 50.0,
      ),
    );
  }
}