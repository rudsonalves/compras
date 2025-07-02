final class Tables {
  Tables._();

  static const String shopping = 'shopping';
  static const String products = 'products';
  static const String items = 'items';
  static const String lastPrice = 'last_price';
  static const String categories = 'categories';
  static const String subCategories = 'sub_categories';
}

final class CategoriesColumns {
  CategoriesColumns._();

  static const String id = 'id';
  static const String name = 'name';
}

final class SubCategoriesColumns {
  SubCategoriesColumns._();

  static const String id = 'id';
  static const String categoryId = 'category_id';
  static const String name = 'name';
}

final class ShoppingColumns {
  ShoppingColumns._();

  static const String id = 'id';
  static const String name = 'name';
  static const String description = 'description';
  static const String type = 'type';
  static const String totalPrice = 'total_price';
  static const String createdAt = 'created_at';
  static const String updatedAt = 'updated_at';
}

final class ProductColumns {
  ProductColumns._();

  static const String id = 'id';
  static const String name = 'name';
  static const String description = 'description';
  static const String barCode = 'bar_code';
  static const String saleBy = 'sale_by';
  static const String categoryId = 'category_id';
  static const String subCategoryId = 'sub_category_id';
  static const String createdAt = 'created_at';
  static const String updatedAt = 'updated_at';
}

final class ItemColumns {
  ItemColumns._();
  static const String shoppingId = 'shopping_id';
  static const String productId = 'product_id';
  static const String saleBy = 'sale_by';
  static const String unitPrince = 'unit_price';
  static const String quantity = 'quantity';
  static const String createdAt = 'created_at';
}

final class LastPriceColumns {
  LastPriceColumns._();

  static const String id = 'id';
  static const String productId = 'product_id';
  static const String saleBy = 'sale_by';
  static const String lastUnitPrice = 'last_unit_price';
  static const String createdAt = 'created_at';
}

final class SqlTables {
  SqlTables._();

  static const String shopping =
      '''
      CREATE TABLE IF NOT EXISTS ${Tables.shopping} (
        ${ShoppingColumns.id} TEXT NOT NULL PRIMARY KEY,
        ${ShoppingColumns.name} TEXT NOT NULL,
        ${ShoppingColumns.description} TEXT NOT NULL,
        ${ShoppingColumns.type} TEXT NOT NULL,
        ${ShoppingColumns.totalPrice} INTEGER NOT NULL,
        ${ShoppingColumns.createdAt} TEXT NOT NULL,
        ${ShoppingColumns.updatedAt} TEXT NOT NULL
      )''';

  static const String products =
      '''
      CREATE TABLE IF NOT EXISTS ${Tables.products} (
        ${ProductColumns.id} TEXT NOT NULL PRIMARY KEY,
        ${ProductColumns.name} TEXT NOT NULL,
        ${ProductColumns.description} TEXT,
        ${ProductColumns.barCode} TEXT NOT NULL,
        ${ItemColumns.saleBy} INTEGER DEFAULT "unit" NOT NULL,
        ${ProductColumns.categoryId} TEXT,
        ${ProductColumns.subCategoryId} TEXT,
        ${ProductColumns.createdAt} TEXT NOT NULL,
        ${ProductColumns.updatedAt} TEXT NOT NULL,
        FOREIGN KEY (${ProductColumns.categoryId}) 
          REFERENCES ${Tables.categories} (${CategoriesColumns.id})
          ON DELETE SET NULL,
        FOREIGN KEY (${ProductColumns.subCategoryId}) 
          REFERENCES ${Tables.subCategories} (${SubCategoriesColumns.id})
          ON DELETE SET NULL
      )''';

  static const String items =
      '''
      CREATE TABLE IF NOT EXISTS ${Tables.items} (
        ${ItemColumns.shoppingId} TEXT NOT NULL,
        ${ItemColumns.productId} TEXT NOT NULL,
        ${ItemColumns.saleBy} INTEGER DEFAULT 1 NOT NULL,
        ${ItemColumns.unitPrince} INTEGER NOT NULL,
        ${ItemColumns.quantity} INTEGER DEFAULT 1 NOT NULL,
        ${ItemColumns.createdAt} TEXT NOT NULL,
        PRIMARY KEY (${ItemColumns.shoppingId}, ${ItemColumns.productId}),
        FOREIGN KEY (${ItemColumns.shoppingId}) 
          REFERENCES ${Tables.shopping} (${ShoppingColumns.id})
          ON DELETE CASCADE,
        FOREIGN KEY (${ItemColumns.productId}) 
          REFERENCES ${Tables.products} (${ProductColumns.id})
          ON DELETE CASCADE
      )''';

  static const String lastPrices =
      '''
      CREATE TABLE IF NOT EXISTS ${Tables.lastPrice} (
        ${LastPriceColumns.id} TEXT NOT NULL PRIMARY KEY,
        ${LastPriceColumns.productId} TEXT NOT NULL,
        ${LastPriceColumns.saleBy} INTEGER DEFAULT 1 NOT NULL,
        ${LastPriceColumns.lastUnitPrice} INTEGER NOT NULL,
        ${LastPriceColumns.createdAt} TEXT NOT NULL,
        FOREIGN KEY (${LastPriceColumns.productId}) 
          REFERENCES ${Tables.products} (${ProductColumns.id})
          ON DELETE CASCADE
      )''';

  static const String categories =
      '''
      CREATE TABLE IF NOT EXISTS ${Tables.categories} (
        ${CategoriesColumns.id} TEXT NOT NULL PRIMARY KEY,
        ${CategoriesColumns.name} TEXT NOT NULL UNIQUE
      )''';

  static const String subCategories =
      '''
      CREATE TABLE IF NOT EXISTS ${Tables.subCategories} (
        ${SubCategoriesColumns.id} TEXT NOT NULL PRIMARY KEY,
        ${SubCategoriesColumns.categoryId} TEXT NOT NULL,
        ${SubCategoriesColumns.name} TEXT NOT NULL,
        UNIQUE (${SubCategoriesColumns.categoryId}, ${SubCategoriesColumns.name}),
        FOREIGN KEY (${SubCategoriesColumns.categoryId}) 
          REFERENCES ${Tables.categories} (${CategoriesColumns.id})
          ON DELETE CASCADE
      )''';

  static const String categoriesIndex = '''
    CREATE INDEX IF NOT EXISTS idx_categories_name 
      ON ${Tables.categories} (${CategoriesColumns.name})''';

  static const String subCategoriesIndex = '''
    CREATE INDEX IF NOT EXISTS idx_sub_categories_name 
      ON ${Tables.subCategories} (${SubCategoriesColumns.name})''';

  static const String productNameIndex = '''
    CREATE INDEX IF NOT EXISTS idx_products_name 
      ON ${Tables.products} (${ProductColumns.name})''';

  static const String productBarCodeIndex = '''
    CREATE INDEX IF NOT EXISTS idx_products_bar_code 
      ON ${Tables.products} (${ProductColumns.barCode})''';

  static const String lastPriceIndex = '''
    CREATE INDEX IF NOT EXISTS idx_last_price_product_id 
      ON ${Tables.lastPrice} (${LastPriceColumns.productId})''';
}
