

import 'dart:async';
import 'package:another_flushbar/flushbar_helper.dart';
import 'package:flutter/material.dart';

import '../../../app/config/app_colors.dart';
import '../../../app/config/font_family.dart';


class StoreError{
  String? type;
  String? errorMessage;
  StoreError({this.type, this.errorMessage});
}


showErrorMessage(BuildContext context,{required StoreError error}) {
  Future.delayed(const Duration(milliseconds: 0), () {
    if (error != null && error.errorMessage!.isNotEmpty) {
      FlushbarHelper.createError(
        message: error.errorMessage!,
        title: error.type,
        duration: Duration(seconds: 3),
      ).show(context);
    }
  });
  return SizedBox.shrink();
}

showSuccessMessage(BuildContext context,{required StoreError error}) {
  Future.delayed(const Duration(milliseconds: 0), () {
    if (error != null && error.errorMessage!.isNotEmpty) {
      FlushbarHelper.createSuccess(
        message: error.errorMessage!,
        title: error.type,
        duration: Duration(seconds: 3),
      ).show(context);
    }
  });
  return SizedBox.shrink();
}


showActionMessage(BuildContext context,{required Widget child,required StoreError error}) {
  Future.delayed(const Duration(milliseconds: 0), () {
    if (error != null && error.errorMessage!.isNotEmpty) {
      FlushbarHelper.createAction(
        message: error.errorMessage!,
        title: error.type,
        duration: Duration(seconds: 3),
        button: child,
      ).show(context);
    }
  });
  return SizedBox.shrink();
}

showInformationMessage(BuildContext context,{required StoreError error}) {
  Future.delayed(const Duration(milliseconds: 0), () {
    if (error != null && error.errorMessage!.isNotEmpty) {
      FlushbarHelper.createInformation(
        message: error.errorMessage!,
        title: error.type,
        duration: Duration(seconds: 3),
      ).show(context);
    }
  });
  return SizedBox.shrink();
}


showLoadingMessage(BuildContext context,{required StoreError error}) {
  Future.delayed(const Duration(milliseconds: 0), () {
    if (error != null && error.errorMessage!.isNotEmpty) {
      FlushbarHelper.createLoading(
        message: error.errorMessage!,
        title: error.type,
        duration: Duration(seconds: 3),
        linearProgressIndicator: LinearProgressIndicator(),
      ).show(context);
    }
  });
  return SizedBox.shrink();
}


showInputFlushbarMessage(BuildContext context,{required Form textForm,required StoreError error}) {
  Future.delayed(const Duration(milliseconds: 0), () {
    if (error != null && error.errorMessage!.isNotEmpty) {
      FlushbarHelper.createInputFlushbar(
        textForm:textForm ,
      ).show(context);
    }
  });
  return SizedBox.shrink();
}

class DataNotFoundScreen extends StatelessWidget {
  final String? name;
  final String? description;

  const DataNotFoundScreen({this.name, this.description});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
              name??"Pas d’événements disponible",
              textAlign: TextAlign.center,
              style: const TextStyle(
                color: AppColors.primaryColor,
                fontSize: 20,
                fontFamily: AppFonts.montserratBold,
              )
          ),
          const SizedBox(
            height: 10,
          ),
          Center(
            child: Text(
                description??"Veuillez créer des événements",
                textAlign: TextAlign.center,
                style: const TextStyle(
                  color: AppColors.primaryColor,
                  fontSize: 14,
                  fontWeight: FontWeight.normal
                )),
          ),
        ],
      ),
    );
  }
}

Widget buildText(String text) => Center(
  child: Text(
    text,
    textAlign: TextAlign.center,
    style: TextStyle(fontSize: 24, color: Colors.black),
  ),
);