import 'package:flu_bloc_boilerplate/core/local/sqflite_provider.dart';
import 'package:sqflite/sqflite.dart';

import '../../features/domain/entities/base/base_model.dart';

abstract class LocalDataSource {
  Database? db;

  String get tableName;

  String get primaryKey;

  // connect to database
  Future<void> open() async {
    if (SQLiteDbProvider.db == null ||
        !(SQLiteDbProvider.db != null && SQLiteDbProvider.db!.isOpen)) {
      await SQLiteDbProvider.open();
    }
    db = SQLiteDbProvider.db;
  }

  // get a record in the table
  Future<dynamic> get(int id) async {
    return null;
  }

  // get all records in the table
  Future<List<dynamic>?> all() async {
    return null;
  }

  // insert a record into the table
  Future<void> insert(BaseModel model) async {
    checkDatabaseConnection();

    await db?.insert(
      tableName,
      model.toJson(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  // update a record in the table
  Future<void> update(BaseModel model, int id) async {
    checkDatabaseConnection();

    await db?.update(
      tableName,
      model.toJson(),
      where: '$primaryKey = ?',
      whereArgs: [id],
    );
  }

  // delete a record in the table
  Future<void> delete(int id) async {
    checkDatabaseConnection();

    await db?.delete(
      tableName,
      where: '$primaryKey = ?',
      whereArgs: [id],
    );
  }

  // delete all records in the table
  Future<void> deleteAll() async {
    checkDatabaseConnection();

    await db?.rawDelete('DELETE FROM $tableName');
  }

  // close database connection
  Future<void> close() async {
    checkDatabaseConnection();
    await db?.close();
  }

  void checkDatabaseConnection() {
    if (db == null) {
      throw Exception(
          'No open connection to database - call .open() on the datasource to establish a connection to the database');
    }
  }
}
