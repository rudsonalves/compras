import 'package:compras/data/services/database/tables/sql_tables.dart';

final class SqlUpgrades {
  SqlUpgrades._();

  static const dbVersion = 3;

  static const Map<int, String> upgrades = <int, String>{
    3:
        '''
      ALTER TABLE ${Tables.lastPrice} 
        ADD COLUMN ${LastPriceColumns.shoppingId} TEXT NOT NULL;

      CREATE INDEX IF NOT EXISTS idx_last_price_shopping_id 
        ON ${Tables.lastPrice} (${LastPriceColumns.shoppingId});
      ''',
  };
}
