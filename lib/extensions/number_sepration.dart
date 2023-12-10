import 'package:intl/intl.dart';

extension RialExtension on int {
  String get seperatednumber {
    final numberformat = NumberFormat.decimalPattern();
    return numberformat.format(this);
  }
}
