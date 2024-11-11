import 'package:intl/intl.dart';

class FormatDate {
  static format(DateTime date) {
    // 15/01/2000
    var formatter = DateFormat('d/MM/yyyy', "id_ID");

    return formatter.format(date);
  }

  static getDate(DateTime date) {
    var formatter1 = DateFormat('d', "id_ID");

    return formatter1.format(date);
  }

  static getMonth(DateTime date) {
    // 11
    var formatterMonth = DateFormat('MM', "id_ID");

    return formatterMonth.format(date);
  }

  static getYear(DateTime date) {
    // 1990
    var formatterYear = DateFormat('yyyy', "id_ID");

    return formatterYear.format(date);
  }
}
