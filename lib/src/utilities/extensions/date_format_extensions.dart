import 'package:intl/intl.dart';

extension DateFormatExtensions on String {
  String day() {
    return DateFormat('dd').format(DateTime.parse(this));
  }

  String hour() {
    return DateFormat('hh').format(DateTime.parse(this));
  }
  
   String minute() {
    return DateFormat('mm').format(DateTime.parse(this));
  }
}
