final class Tables {
  Tables._();

  static const String shopping = 'shopping';
  static const String products = 'products';
  static const String items = 'items';
  static const String lastPrice = 'last_price';
  static const String categories = 'categories';
  static const String subCategories = 'sub_categories';
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
  static const String productId = 'product_id';
  static const String saleBy = 'sale_by';
  static const String lastUnitPrice = 'last_unit_price';
  static const String createdAt = 'created_at';
}

final class SqlTables {
  SqlTables._();

  // Shopping table
  // Contains shopping details like id, name, description, type, total price,
  // created and updated timestamps.
  // The table is used to manage shopping lists or carts.
  // Each shopping entry is uniquely identified by its id.
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

  // Products table
  // Contains product details like id, name, description, bar code, sale type,
  // category and sub-category information, and timestamps for creation and
  // update.
  // The table is used to manage products available for shopping.
  // Each product is uniquely identified by its id and bar code.
  // Foreign keys link products to categories and sub-categories.
  // Indexes are created for product name and bar code for faster search.
  // Sale type is represented by an enum, with a default value of "unit".
  // The table allows for products to be categorized and sub-categorized,
  // enabling better organization and retrieval of products.
  // The `createdAt` and `updatedAt` fields are used to track when the
  // product was added or last modified, respectively.
  // The `categoryId` and `subCategoryId` fields are nullable, allowing products
  // to exist without being assigned to a category or sub-category.
  static const String products =
      '''
      CREATE TABLE IF NOT EXISTS ${Tables.products} (
        ${ProductColumns.id} TEXT NOT NULL PRIMARY KEY,
        ${ProductColumns.name} TEXT NOT NULL,
        ${ProductColumns.description} TEXT,
        ${ProductColumns.barCode} TEXT UNIQUE,
        ${ItemColumns.saleBy} INTEGER DEFAULT "unit" NOT NULL,
        ${ProductColumns.categoryId} TEXT,
        ${ProductColumns.categoryName} TEXT,
        ${ProductColumns.subCategoryId} TEXT,
        ${ProductColumns.subCategoryName} TEXT,
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

  // Items table
  // Contains items in a shopping cart, linking to products and shopping
  // entries.
  // Each item is uniquely identified by a combination of shopping ID and
  // product ID.
  // The table includes details like item name, sale type, unit price, quantity,
  // price variation, and creation timestamp.
  // Foreign keys link items to shopping entries and products.
  // The `saleBy` field indicates how the item is sold (e.g., by unit or
  // weight), with a default value of 1 (unit).
  // The `unitPrice` field represents the price per unit of the item.
  // The `quantity` field indicates how many units of the item are in the cart,
  // with a default value of 1.
  // The `priceVariation` field allows for tracking price changes over time,
  // with a default value of 0.0.
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
        ${LastPriceColumns.productId} TEXT NOT NULL,
        ${LastPriceColumns.saleBy} INTEGER DEFAULT 1 NOT NULL,
        ${LastPriceColumns.lastUnitPrice} INTEGER NOT NULL,
        ${LastPriceColumns.createdAt} TEXT NOT NULL,
        FOREIGN KEY (${LastPriceColumns.productId}) 
          REFERENCES ${Tables.products} (${ProductColumns.id})
          ON DELETE CASCADE
      )''';

  static const String lastPriceIndex = '''
    CREATE INDEX IF NOT EXISTS idx_last_price_product_id 
      ON ${Tables.lastPrice} (${LastPriceColumns.productId})''';

  // Categories and Sub-Categories tables
  // These tables manage product categories and sub-categories.
  // Categories table contains unique categories, each identified by an ID and
  // name.
  // Sub-Categories table contains sub-categories linked to categories by
  // category ID.
  // Each sub-category is uniquely identified by its ID and has a name.
  // Foreign keys ensure that sub-categories cannot exist without their parent
  // category.
  // Indexes are created for category and sub-category names to speed up
  // searches.
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
