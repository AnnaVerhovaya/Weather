import 'package:intl/intl.dart';
class Unil {
  static String getFormatDate(DateTime dateTime) {
    return DateFormat('dd/MM/yyyy').format(dateTime);
  }

  static String getFormatDateWeek(DateTime dateTime) {
    return DateFormat('EEEE').format(dateTime);
  }
}