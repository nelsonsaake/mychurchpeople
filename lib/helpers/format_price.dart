import 'package:intl/intl.dart';

String formatPriceAmount(val) {
  final currencyFormatter = NumberFormat.currency(locale: 'en_US', symbol: '');
  return currencyFormatter.format(double.tryParse('$val') ?? 0);
}

String formatPrice(val) {
  return "GHS ${formatPriceAmount(val)}";
}
