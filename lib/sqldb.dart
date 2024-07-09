import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class Sqldb {
  static Database? _db;

  Future<Database?> get db async {
    if (_db == null) {
      _db = await initialDb();
      return _db;
    } else {
      return _db;
    }
  }

  initialDb() async {
    String databasepath = await getDatabasesPath();
    String path = join(databasepath, 'brimo.db');
    Database mydb = await openDatabase(path,
        onCreate: _onCreate, version: 0, onUpgrade: _onUpgrade);
    return mydb;
  }

  _onUpgrade(Database db , int oldversion , int newversion)async{
  //await db.execute("ALTER TABLE users ADD COLUMN number TEXT");
  }

  _onCreate(Database db, int version) async {

    Batch batch =db.batch();

    batch.execute('''
      CREATE TABLE "products"(
        "id" INTEGER AUTOINCREMENT NOT NULL PRIMARY KEY, 
        "product"  TEXT NOT NULL,
      )
    ''');
    batch.execute('''
      CREATE TABLE "users"(
        "id" INTEGER AUTOINCREMENT NOT NULL PRIMARY KEY, 
        "product"  TEXT NOT NULL,
      )
    ''');
    await batch.commit();
    // print("create db w table");
  }
//raw sql methods 
readData(String sql) async {
    Database? mydb = await db;
    List<Map> response = await mydb!.rawQuery(sql);
    return response;
  }

  insertData(String sql) async {
    Database? mydb = await db;
    int response = await mydb!.rawInsert(sql);
    return response;
  }

  updateData(String sql) async {
    Database? mydb = await db;
    int response = await mydb!.rawUpdate(sql);
    return response;
  }

  deleteData(String sql) async {
    Database? mydb = await db;
    int response = await mydb!.rawDelete(sql);
    return response;
  }

//shortcuts Methods SQLFLITE
  read(String table) async {
    Database? mydb = await db;
    List<Map> response = await mydb!.query(table);
    return response;
  }

  insert(String table,Map<String, Object?> values) async {
    Database? mydb = await db;
    int response = await mydb!.insert(table , values);
    return response;
  }

  update(String table,Map<String, Object?> value,String? mywhere ) async {
    Database? mydb = await db;
    int response = await mydb!.update(table,value , where: mywhere);
    return response;
  }

  delete(String table,String? mywhere) async {
    Database? mydb = await db;
    int response = await mydb!.delete(table,where: mywhere);
    return response;
  }

//delete Database
  mydeleteDatabase() async{
    String databasepath = await getDatabasesPath();
    String path = join(databasepath, 'brimo.db');
    await deleteDatabase(path);
  }
}
