
import 'dart:async';

import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class BannerDatabaseHelper{

  BannerDatabaseHelper._privateContructor();

  static final BannerDatabaseHelper instance = BannerDatabaseHelper._privateContructor();

  static Database? _database;
// Khởi tạo database
  Future<Database?> get database async{
    if(_database != null ) return _database;
    _database = await _initDatabase();
    return _database;
  }

  _initDatabase() async{
    String path = join(await getDatabasesPath(), "banner.db");
    return await openDatabase(path, onOpen: (db){},
      version: 1, onCreate: _onCreate,
    );
  }
// tạo bảng
  static FutureOr<void> _onCreate(Database db, int version) async {
    db.execute(''' CREATE TABLE bannertb (
      id INTERGER PRIMARY KEY AUTOINCREMENT,
      image TEXT NOT NULL
    )''');
  }

// insert db
  Future<int?> insert() async{
    Database? db = await instance.database;

    Map<String, dynamic> row = {
      'id' : '2',
      'image'  : '23'
    };

    var res = await db?.insert('bannertb', row);
    // int? id = await db?.insert('bannertb', row);
    //
    print(await db?.query('bannertb'));
  }

//select  id from bannertb
  Future<List<Map<String, dynamic>>?> _selectId(String bannertb, String orderById) async{
    Database? db = await instance.database;
    var res = await db?.query('SELECT id FROM bannertb ORDER BY DESC');
    return res;
  }

// update
 Future<void> update() async{
    Database? db = await instance.database;
    // Map<String, dynamic> row = {
    //   'id' : '3',
    //   'image'  : 'mothaibabonnamsaubaytamchinmuoi'
    // };
    int? update = await db?.rawUpdate('''
        UPDATE bannertb
        SET image = ?
        WHERE id = ?
    ''',['muoimuoimotmuoihaimuoibamuoibonmuoinam']);

 }
  //delete table
  Future<void> deleteTable() async{
    Database? db = await instance.database;
    await db?.delete('bannertb');
  }

  // delete
  Future<void> delete() async{

    Database? db = await instance.database;

    db?.rawDelete('''
    DELETE FROM bannertb
    WHERE id = 2
    ''');
  }

  Future<List<Map<String, dynamic?>>?> getAll() async {
    Database? db = await instance.database;
    var res = await db?.rawQuery('''
      SELECT * FROM bannertb 
    ''');
    return res?.toList();
  }




}