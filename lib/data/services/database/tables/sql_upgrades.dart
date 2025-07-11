import '/data/services/database/tables/sql_tables.dart';

final class SqlUpgrades {
  SqlUpgrades._();

  static const dbVersion = 4;

  static const Map<int, List<String>> upgrades = {
    3: [
      '''
      ALTER TABLE ${Tables.lastPrice} 
        ADD COLUMN ${LastPriceColumns.shoppingId} TEXT NOT NULL''',
      SqlTables.lastPriceProductIndex,
    ],
    4: [
      SqlTables.listItems,
      SqlTables.listItemsNameIndex,
    ],
  };
}
