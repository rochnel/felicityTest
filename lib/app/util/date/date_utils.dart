//
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

/// Helper class for device related operations.
///
class DateManageUtils {


  //static final ddMMYYFormat = DateFormat('dd-MM-yyyy');
  //static final hhMMFormat = DateFormat('h:m');

  static getFormatedDate(_date) {
    //var inputFormat = DateFormat('yyyy-MM-dd HH:mm');
    //var inputDate = inputFormat.parse(_date);
    //var outputFormat = DateFormat('dd-MM-yyy');

    String formattedDate = DateFormat('dd-MM-yyy').format(_date);

    return formattedDate;
  }

  static getParseDate(String? date) {
    DateTime parseDate = DateFormat('dd-MM-yyy').parse(date!);
    DateTime inputDate = DateTime.parse(parseDate.toString());
    DateFormat outputFormat = DateFormat('dd-MM-yyy');
    var outputDate = outputFormat.format(inputDate);
    return outputDate.toString();
  }

  static getParseHour(String? date) {
    DateTime parseDate = DateFormat('dd-MM-yyy').parse(date!);
    DateTime inputDate = DateTime.parse(parseDate.toString());

    DateFormat outputFormat = DateFormat('hh:mm a');
    var outputTime = outputFormat.format(inputDate);
    return outputTime.toString();
  }

  static getFormatedHour(_date) {
    //var inputFormat = DateFormat('yyyy-MM-dd HH:mm');
    //var inputDate = inputFormat.parse(_date);
    //var outputFormat = DateFormat('h:m');

    String formattedDate = DateFormat('h:m').format(_date);
    return formattedDate;
  }

  static getDifferenceTwoDate(DateTime startTime) {
    DateTime currentTime = DateTime.now();
    if (currentTime.difference(startTime).inMinutes < 2) {
      return "a few seconds ago";
    } else if (currentTime.difference(startTime).inMinutes < 60) {
      return "${currentTime.difference(startTime).inHours} min";
    } else if (currentTime.difference(startTime).inMinutes < 1440) {
      return "${currentTime.difference(startTime).inHours} hours";
    } else if (currentTime.difference(startTime).inMinutes > 1440) {
      return "${currentTime.difference(startTime).inDays} days";
    }
  }

  static String getVerboseDateTimeRepresentation(DateTime dateTime) {
    DateTime now = DateTime.now();
    DateTime justNow = now.subtract(Duration(minutes: 1));
    DateTime localDateTime = dateTime.toLocal();

    if (!localDateTime.difference(justNow).isNegative) {
      return 'Maintenant';
    }

    String roughTimeString = DateFormat('jm').format(dateTime);

    if (localDateTime.day == now.day && localDateTime.month == now.month && localDateTime.year == now.year) {
      return roughTimeString;
    }

    DateTime yesterday = now.subtract(Duration(days: 1));

    if (localDateTime.day == yesterday.day && localDateTime.month == now.month && localDateTime.year == now.year) {
      return 'Hier';
    }

    if (now.difference(localDateTime).inDays < 4) {
      String weekday = DateFormat('EEEE', 'fr').format(localDateTime);

      return '$weekday, $roughTimeString';
    }

    return '${DateFormat('yMd', 'fr').format(dateTime)}, $roughTimeString';
  }
  ///
  /// hides the keyboard if its already open
  ///
  static hideKeyboard(BuildContext context) {
    FocusScope.of(context).unfocus();
  }

  static Future selectDate({required BuildContext context,DateTime? initDate}) async {
    DateTime? picked = await showDatePicker(
        context: context,
        initialDate: initDate == null ? DateTime.now() : initDate ,
        firstDate: new DateTime(1970),
        lastDate: new DateTime(2022));
    if (picked != null) {
      // import 'package:intl/intl.dart';
      // DateFormat dateFormat = DateFormat("yyyy-MM-dd HH:mm:ss");
      //String formattedDate = DateFormat('yyyy-MM-dd – kk:mm').format(now); for use this i need the library intl
      //String convertedDateTime = "${picked.year.toString()}-${picked.month.toString().padLeft(2,'0')}-${picked.day.toString().padLeft(2,'0')} ${picked.hour.toString()}-${picked.minute.toString()}";
      String convertedDateTime = "${picked.year.toString()}-${picked.month.toString().padLeft(2,'0')}-${picked.day.toString().padLeft(2,'0')}";

      return convertedDateTime;
     }

    return null;
  }


  static bool statusDaysBetweenTwoDates(String from,String to) {
    DateTime nowDate = DateTime.now();
    DateTime startDate,endDate;

    startDate = DateTime.parse(from).subtract(const Duration(days: 7));
    endDate = DateTime.parse(to).add(const Duration(days: 7));

    if((nowDate.isBefore(endDate) && nowDate.isAfter(startDate) )) {
      print("*******Je suis dans l intervalle *****debut********${startDate.toString()}****fin*********${endDate.toString()}*******");
      return true;
    }
    print("*******Je suis pas dans l intervalle*****debut********${startDate.toString()}****fin*********${endDate.toString()}*******");
    return false;
  }
}