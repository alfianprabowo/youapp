import 'package:intl/intl.dart';

calculateAge(String birth) {
  DateFormat format = DateFormat("dd/MM/yyyy");
  var dateTime = format.parse(birth);
  DateTime now = DateTime.now();
  Duration age = now.difference(dateTime);

  return age.inDays ~/ 365;
}
