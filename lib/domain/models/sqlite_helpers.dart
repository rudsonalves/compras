// helpers.dart
class SqliteHelpers {
  SqliteHelpers._();

  static int boolToInt(bool b) => b ? 1 : 0;
  static bool intToBool(int i) => i == 1;
}
