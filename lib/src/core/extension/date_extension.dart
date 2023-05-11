import 'package:intl/intl.dart';

extension AppDateExt on DateTime {
  /// Format to show fay,month,year of the date
  ///
  /// Eje: 1/10/2021 => **1 oct. 2021**
  String get formatDate => DateFormat.yMMMd('es').format(this);
}
