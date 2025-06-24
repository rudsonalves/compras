import 'package:compras/data/services/database/database_service.dart';
import 'package:provider/single_child_widget.dart' show SingleChildWidget;

Future<List<SingleChildWidget>> dependencies() async {
  final database = DatabaseService();
  await database.initialize('compras.db');

  return <SingleChildWidget>[];
}
