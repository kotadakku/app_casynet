import 'dart:async';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

import '../model/banner_slider.dart';

class BannerDatabaseHelper{
  static final String _databaseName = "banner.db";

  static final _databaseVersion = 1;
  static final String table = 'banner';
  static final String columnId = 'id';
  static final String columnImage = 'image';

  BannerDatabaseHelper._privateContructor();

  static final BannerDatabaseHelper instance = BannerDatabaseHelper._privateContructor();

  static Database? _database;

  Future<Database?> get database async {
    if(_database != null) return _database;
    _database = await _initDatabase();
    return _database;
  }

  _initDatabase() async {
    String path = join(await getDatabasesPath(), _databaseName);
    return await openDatabase(path, onCreate: _onCreate,
        version: _databaseVersion
    );
  }

  static FutureOr<void> _onCreate(Database db, int version) async {
    await db.execute(''' CREATE TABLE $table (
            $columnId INTEGER PRIMARY KEY AUTOINCREMENT,
            $columnImage TEXT NOT NULL
          )
    ''');
  }


  Future<int?> insert(BannerSlider banner) async {
    Database? db = await instance.database;
    var res = await db?.insert(table, banner.toJson());
    return res;
  }

  Future<List<Map<String, dynamic>>?> queryAllRows() async {
    Database? db = await instance.database;
    var res = await db?.query(table, orderBy: "$columnId DESC");
    return res;
  }

  Future<void> clear() async {
    Database? db = await instance.database;
    await db?.delete(table);
  }

}