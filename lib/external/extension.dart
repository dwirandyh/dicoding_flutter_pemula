import 'package:intl/intl.dart';

extension Converter on int {
  String toCurrency() {
    return NumberFormat.currency(locale: "id", symbol: "Rp", decimalDigits: 0)
        .format(this);
  }
}
