final class Tables {
  Tables._();

  static const String shopping = 'shopping';
  static const String products = 'products';
}

final class SqlTables {
  SqlTables._();

  static const String shopping = '''
    CREATE TABLE IF NOT EXISTS shopping (
      id TEXT NOT NULL PRIMARY KEY,
      name TEXT NOT NULL,
      description TEXT NOT NULL,
      price INTEGER NOT NULL,
      created_at TEXT NOT NULL,
      updated_at TEXT NOT NULL
    )''';

  static const String products = '''
    CREATE TABLE IF NOT EXISTS products (
      id TEXT NOT NULL PRIMARY KEY,
      name TEXT NOT NULL,
      bar_code TEXT NOT NULL,
      price INTEGER NOT NULL,
      created_at TEXT NOT NULL,
      updated_at TEXT NOT NULL
    )''';
}

final class ShoppingColumns {
  ShoppingColumns._();

  static const String id = 'id';
  static const String name = 'name';
  static const String description = 'description';
  static const String price = 'price';
  static const String createdAt = 'created_at';
  static const String updatedAt = 'updated_at';
}

final class ProductColumns {
  ProductColumns._();

  static const String id = 'id';
  static const String name = 'name';
  static const String barCode = 'bar_code';
  static const String price = 'price';
  static const String createdAt = 'created_at';
  static const String updatedAt = 'updated_at';
}
