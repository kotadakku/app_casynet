
import 'dart:async';

import 'package:app_casynet/app/data/model/user.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class UserDatabaseHelperProvider {
  static final String _databaseName = "user.db";

  static final _databaseVersion = 1;

  static final String table = "user";
  static final String columnId = "id";
  static final String columnEmail = "email";
  static final String columnPassword = "password";
  static final String columnToken = "token";
  static final String columnUserName = "username";
  static final String columnFirstName = "firstname";
  static final String columnLastName = "lastname";
  static final String columnPhone = "phone";
  static final String columnGender = "gender";
  static final String columnStoreId = "storeId";
  static final String columnBirthday = "birthday";
  static final String columnImage = "image";
  static final String columnCreateAt = "createAt";
  static final String columnReceiveNotification = "receiveNotification";
  static final String columnFollowSeller = "followSeller";

  UserDatabaseHelperProvider._privateController();

  static final UserDatabaseHelperProvider instance = UserDatabaseHelperProvider
      ._privateController();

  static Database? _database;

  Future<Database?> get database async {
    if (_database != null) return _database;
    _database = await _initDatabase();
    return _database;
  }

  _initDatabase() async {
    String path = join(await getDatabasesPath(), _databaseName);
    return await openDatabase(
        path, onCreate: _onCreate, version: _databaseVersion);
  }

  static FutureOr<void> _onCreate(Database db, int version) async {
    await db.execute('''CREATE TABLE $table (
      $columnId INTEGER PRIMARY KEY AUTOINCREMENT,
      $columnEmail TEXT,
      $columnPassword TEXT,
      $columnToken TEXT,
      $columnUserName TEXT,
      $columnFirstName TEXT,
      $columnLastName TEXT,
      $columnPhone TEXT,
      $columnGender INTEGER,
      $columnStoreId INTEGER,
      $columnBirthday TEXT,
      $columnImage TEXT,
      $columnCreateAt TEXT,
      $columnReceiveNotification TEXT,
      $columnFollowSeller TEXT
    )
    ''');
  }

  Future<int?> insert(User user) async {
    Database? db = await instance.database;
    var res = await db?.insert(table, user.toJsonUserDb());
    print("result insert : --  $res " + " --");
    return res;
  }

  Future<List<Map<String, dynamic>>?> queryAllRows() async{
    Database? db = await instance.database;
    var res = await db?.query(table, orderBy: "$columnId DESC");
    print("result query : --  $res " + " --");
    return res;
  }

  Future<void> clear() async{
    Database? db = await instance.database;
    await db?.delete(table);
  }
}