import 'package:intl/intl.dart';

abstract class RupiahFormatter{
  static final _formatter = NumberFormat.currency(
    locale: 'id',
    symbol: 'Rp',
    decimalDigits: 0
  );

  static String formatToRupiah(int number){
    return _formatter.format(number);
  }
}