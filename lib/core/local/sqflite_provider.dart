
import 'package:path/path.dart';
import 'package:flu_bloc_boilerplate/core/local/local_db_config.dart';
import 'package:sqflite/sqflite.dart';

class SQLiteDbProvider {

  static Database? db;
  
  static Future<void> open() async {
    db = await openDatabase(
      join(await getDatabasesPath(), LocalDatabaseConfig.databaseName),
      onCreate: (db, version) {
        return _createDb(db);
      },
      version: LocalDatabaseConfig.databaseVersion,
    );
  }

  static void _createDb(Database db) {
    LocalDatabaseConfig.createTablesQueries
        .forEach((createTableQuery) async {
      await db.execute(createTableQuery);
    });
  }
  
  static Future<void> clear() async {
    await deleteDatabase(join(await getDatabasesPath(), LocalDatabaseConfig.databaseName));
  }
}