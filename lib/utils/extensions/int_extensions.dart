extension IntExtensions on int {
  String toCurrency() {
    final value = this / 100;
    return value.toStringAsFixed(2).replaceAll('.', ',');
  }

  String toCurrencyWithSymbol() {
    return '\$${toCurrency()}';
  }
}
