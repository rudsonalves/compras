final class Tables {
  Tables._();

  static const String shopping = 'shopping';
  static const String products = 'products';
  static const String items = 'items';
  static const String lastPrice = 'last_price';
  static const String categories = 'categories';
  static const String subCategories = 'sub_categories';
  static const String listItems = 'list_items';
}

final class ListItemsColumns {
  ListItemsColumns._();

  static const String id = 'id';
  static const String shoppingId = 'shopping_id';
  static const String productId = 'product_id';
  static const String name = 'name';
  static const String quantity = 'quantity';
  static const String createdAt = 'created_at';
}

final class CatsColumns {
  CatsColumns._();

  static const String id = 'id';
  static const String name = 'name';
}

final class SubCatsColumns {
  SubCatsColumns._();

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
  static const String categoryName = 'category_name';
  static const String subCategoryId = 'sub_category_id';
  static const String subCategoryName = 'sub_category_name';
  static const String createdAt = 'created_at';
  static const String updatedAt = 'updated_at';
}

final class ItemColumns {
  ItemColumns._();
  static const String shoppingId = 'shopping_id';
  static const String productId = 'product_id';
  static const String name = 'name';
  static const String saleBy = 'sale_by';
  static const String unitPrince = 'unit_price';
  static const String quantity = 'quantity';
  static const String priceVariation = 'price_variation';
  static const String createdAt = 'created_at';
}

final class LastPriceColumns {
  LastPriceColumns._();

  static const String id = 'id';
  static const String shoppingId = 'shopping_id';
  static const String productId = 'product_id';
  static const String saleBy = 'sale_by';
  static const String lastUnitPrice = 'last_unit_price';
  static const String createdAt = 'created_at';
}

final class SqlTables {
  SqlTables._();

  static const String listItems =
      '''
      CREATE TABLE IF NOT EXISTS ${Tables.listItems} (
        ${ListItemsColumns.id} TEXT NOT NULL PRIMARY KEY,
        ${ListItemsColumns.shoppingId} TEXT NOT NULL,
        ${ListItemsColumns.productId} TEXT,
        ${ListItemsColumns.name} TEXT NOT NULL,
        ${ListItemsColumns.quantity} INTEGER DEFAULT 1,
        ${ListItemsColumns.createdAt} TEXT NOT NULL
      )''';

  static const String listItemsNameIndex = '''
    CREATE INDEX IF NOT EXISTS idx_list_items_name 
      ON ${Tables.listItems} (${ListItemsColumns.name})''';

  static const String shopping =
      '''
      CREATE TABLE IF NOT EXISTS ${Tables.shopping} (
        ${ShoppingColumns.id} TEXT NOT NULL PRIMARY KEY,
        ${ShoppingColumns.name} TEXT NOT NULL,
        ${ShoppingColumns.description} TEXT,
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
        ${ProductColumns.barCode} TEXT UNIQUE,
        ${ItemColumns.saleBy} INTEGER DEFAULT "unit" NOT NULL,
        ${ProductColumns.categoryId} TEXT NOT NULL,
        ${ProductColumns.categoryName} TEXT NOT NULL,
        ${ProductColumns.subCategoryId} TEXT NOT NULL,
        ${ProductColumns.subCategoryName} TEXT NOT NULL,
        ${ProductColumns.createdAt} TEXT NOT NULL,
        ${ProductColumns.updatedAt} TEXT NOT NULL,
        FOREIGN KEY (${ProductColumns.categoryId}) 
          REFERENCES ${Tables.categories} (${CatsColumns.id})
          ON DELETE SET NULL,
        FOREIGN KEY (${ProductColumns.subCategoryId}) 
          REFERENCES ${Tables.subCategories} (${SubCatsColumns.id})
          ON DELETE SET NULL
      )''';

  static const String productNameIndex = '''
    CREATE INDEX IF NOT EXISTS idx_products_name 
      ON ${Tables.products} (${ProductColumns.name})''';

  static const String productBarCodeIndex = '''
    CREATE INDEX IF NOT EXISTS idx_products_bar_code 
      ON ${Tables.products} (${ProductColumns.barCode})''';

  static const String items =
      '''
      CREATE TABLE IF NOT EXISTS ${Tables.items} (
        ${ItemColumns.shoppingId} TEXT NOT NULL,
        ${ItemColumns.productId} TEXT NOT NULL,
        ${ItemColumns.name} TEXT NOT NULL,
        ${ItemColumns.saleBy} INTEGER DEFAULT 1 NOT NULL,
        ${ItemColumns.unitPrince} INTEGER NOT NULL,
        ${ItemColumns.quantity} INTEGER DEFAULT 1 NOT NULL,
        ${ItemColumns.priceVariation} REAL DEFAULT 0.0 NOT NULL,
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
        ${LastPriceColumns.shoppingId} TEXT NOT NULL,
        ${LastPriceColumns.productId} TEXT NOT NULL,
        ${LastPriceColumns.saleBy} INTEGER DEFAULT 1 NOT NULL,
        ${LastPriceColumns.lastUnitPrice} INTEGER NOT NULL,
        ${LastPriceColumns.createdAt} TEXT NOT NULL,
        FOREIGN KEY (${LastPriceColumns.productId}) 
          REFERENCES ${Tables.products} (${ProductColumns.id})
          ON DELETE CASCADE
      )''';

  static const String lastPriceProductIndex = '''
    CREATE INDEX IF NOT EXISTS idx_last_price_product_id 
      ON ${Tables.lastPrice} (${LastPriceColumns.productId})''';

  static const String lastPriceShoppingIndex = '''
    CREATE INDEX IF NOT EXISTS idx_last_price_shopping_id 
      ON ${Tables.lastPrice} (${LastPriceColumns.shoppingId})''';

  static const String categories =
      '''
      CREATE TABLE IF NOT EXISTS ${Tables.categories} (
        ${CatsColumns.id} TEXT NOT NULL PRIMARY KEY,
        ${CatsColumns.name} TEXT NOT NULL UNIQUE
      )''';

  static const String subCategories =
      '''
      CREATE TABLE IF NOT EXISTS ${Tables.subCategories} (
        ${SubCatsColumns.id} TEXT NOT NULL PRIMARY KEY,
        ${SubCatsColumns.categoryId} TEXT NOT NULL,
        ${SubCatsColumns.name} TEXT NOT NULL,
        UNIQUE (${SubCatsColumns.categoryId}, ${SubCatsColumns.name}),
        FOREIGN KEY (${SubCatsColumns.categoryId}) 
          REFERENCES ${Tables.categories} (${CatsColumns.id})
          ON DELETE CASCADE
      )''';

  static const String categoriesIndex = '''
    CREATE INDEX IF NOT EXISTS idx_categories_name 
      ON ${Tables.categories} (${CatsColumns.name})''';

  static const String subCategoriesIndex = '''
    CREATE INDEX IF NOT EXISTS idx_sub_categories_name 
      ON ${Tables.subCategories} (${SubCatsColumns.name})''';
}
