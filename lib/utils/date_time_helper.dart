import 'package:intl/intl.dart';

extension DateTimeExtension on DateTime {
  String get toFormattedString {
    return DateFormat('yyyy-MM-dd').format(this);
  }
}