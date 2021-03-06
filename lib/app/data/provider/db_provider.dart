import 'dart:async';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import 'package:app_casynet/app/config/config.dart';

class DatabaseHelper{


  DatabaseHelper._privateContructor();

  static final DatabaseHelper instance = DatabaseHelper._privateContructor();

  static Database? _database;

  Future<Database?> get database async {
    if(_database != null) return _database;
    _database = await _initDatabase();
    return _database;
  }

  _initDatabase() async {
    String path = join(await getDatabasesPath(), DBConfig.DATABASE_NAME);
    return await openDatabase(path, onCreate: _onCreate,
        version: DBConfig.DATABASE_VERSION
    );
  }

  static FutureOr<void> _onCreate(Database db, int version) async {
    db.execute(''' CREATE TABLE ${DBConfig.TABLE_BANNER} (
            ${DBConfig.BANNER_COLUMN_ID} INTEGER PRIMARY KEY AUTOINCREMENT,
            ${DBConfig.BANNER_COLUMN_IMAGE} TEXT NOT NULL
          )
    ''');
    db.execute(''' CREATE TABLE ${DBConfig.TABLE_SALE} (
            ${DBConfig.SALE_COLUMN_ID} INTEGER PRIMARY KEY AUTOINCREMENT,
            ${DBConfig.SALE_COLUMN_TITLE} TEXT NOT NULL,
            ${DBConfig.SALE_COLUMN_IMAGE} TEXT NOT NULL
          )
    ''');
    db.execute(''' CREATE TABLE ${DBConfig.TABLE_CATEGORY} (
            ${DBConfig.CATEGORY_COLUMN_ID} INTEGER PRIMARY KEY AUTOINCREMENT,
            ${DBConfig.CATEGORY_COLUMN_TITLE} TEXT NOT NULL,
            ${DBConfig.CATEGORY_COLUMN_IMAGE} TEXT NOT NULL
          )
    ''');
    db.execute(''' CREATE TABLE ${DBConfig.TABLE_CART} (
            ${DBConfig.CART_COLUMN_ITEM_ID} INTEGER PRIMARY KEY UNIQUE,
            ${DBConfig.CART_COLUMN_P_ID} INTEGER,
            ${DBConfig.CART_COLUMN_P_SKU} TEXT,
            ${DBConfig.CART_COLUMN_P_IMAGE} TEXT,
            ${DBConfig.CART_COLUMN_P_NAME} TEXT,
            ${DBConfig.CART_COLUMN_PRICE} INTEGER,
            ${DBConfig.CART_COLUMN_DIS_PRICE} INTEGER,
            ${DBConfig.CART_COLUMN_S_NAME} TEXT,
            ${DBConfig.CART_COLUMN_QUANTITY} INTEGER,
            ${DBConfig.CART_COLUMN_CART_ID} INTEGER  
          )
    ''');

    db.execute('''CREATE TABLE ${DBConfig.TABLE_NOTIFICATION}(
      ${DBConfig.NOTI_COLUMN_ID} INTEGER PRIMARY KEY UNIQUE,
      ${DBConfig.NOTI_COLUMN_TITLE} TEXT NULL,
      ${DBConfig.NOTI_COLUMN_BODY} TEXT NULL,
      ${DBConfig.NOTI_COLUMN_IMAGE_URL} TEXT NULL,
      ${DBConfig.NOTI_COLUMN_ISSEEN} TEXT NULL,
      ${DBConfig.NOTI_COLUMN_TIMERECEIVE} TEXT NULL
    )''');
    db.execute('''  CREATE TABLE ${DBConfig.TABLE_SELLER}(
      ${DBConfig.SELLER_ID} INTEGER PRIMARY KEY UNIQUE,
      ${DBConfig.SELLER_NAME} TEXT,
      ${DBConfig.SELLER_IMAGE} TEXT,
      ${DBConfig.SELLER_ADDRESS} TEXT,
      ${DBConfig.SELLER_LIKED} INTEGER,
      ${DBConfig.SELLER_COMMENT} INTEGER,
      ${DBConfig.SELLER_RATE} REAL,
      ${DBConfig.SELLER_PHONE} TEXT
     )
    ''');
    db.execute(''' CREATE TABLE ${DBConfig.TABLE_PRODUCT}(
      ${DBConfig.PRODUCT_ID} INTEGER,
      ${DBConfig.PRODUCT_NAME} TEXT,
      ${DBConfig.PRODUCT_IMAGE} TEXT,
      ${DBConfig.PRODUCT_LIKED} INTEGER,
      ${DBConfig.PRODUCT_COMMENT} INTEGER,
      ${DBConfig.PRODUCT_RATE} REAL,
      ${DBConfig.PRODUCT_PRICE} INTEGER,
      ${DBConfig.PRODUCT_OFF_PRICE} INTEGER,
      ${DBConfig.PRODUCT_SELLER_NAME} TEXT,
      ${DBConfig.PRODUCT_SELLER_PHONE} TEXT,
      ${DBConfig.PRODUCT_CATEGORY_ID} INTEGER
    )
    ''');
  }

  Future<int?> insert(tableName, data) async {
    Database? db = await instance.database;
    var res = await db?.insert(tableName, data);
    return res;
  }
// select * orderBy
  Future<List<Map<String, dynamic>>?> getAlls(String tableName,String orderBy) async {
    Database? db = await instance.database;
    var res = await db?.query(tableName, orderBy: "$orderBy DESC");
    return res;
  }
  Future<List<Map<String, dynamic>>?> filter(String tableName, String columnName, String columnValue) async {
    Database? db = await instance.database;
    var res = await db?.query(tableName,
        where: '$columnName = $columnValue');
    return res;
  }
  Future<void> deleteFilter(String tableName, String columnName, String columnValue) async {
    Database? db = await instance.database;
    await db?.delete(tableName,
      where: '$columnName = $columnValue'
    );
  }


  Future<void> clear(tableName) async {
    Database? db = await instance.database;
    await db?.delete(tableName);
  }

  Future<bool> checkExists(tableName, columnName, value) async {
    Database? db = await instance.database;
    var res = await db?.query(tableName, where: '$columnName = $value');
    print(res?.length);
    if(res?.length==0) return false;
    return true;
  }

  Future<void> updateQuantity(String tableName,String columnId, String columnUpdate, int id, int newValue) async{

    Database? db = await instance.database;
    var res = await db?.rawUpdate('''
            UPDATE $tableName
            SET $columnUpdate = ? 
            WHERE $columnId = ?
            ''',
        [newValue, id]);
  }

  Future<void> incrementQuantity(String tableName,String columnId, String columnUpdate, int? id) async {
    Database? db = await instance.database;

    await db?.rawUpdate('''
            UPDATE $tableName
            SET $columnUpdate = $columnUpdate + 1
            WHERE $columnId = $id
            ''',);
  }
  Future<void> decrementQuantity(String tableName,String columnId, String columnUpdate, int? id) async {
    Database? db = await instance.database;

    await db?.rawUpdate('''
            UPDATE $tableName
            SET $columnUpdate = $columnUpdate - 1
            WHERE $columnId = $id
            ''',);
  }
  Future<void> deleteRow(String tableName,String columnId, int? id) async{

    Database? db = await instance.database;

     db?.rawDelete('''
      DELETE FROM $tableName
      WHERE $columnId = ${id}
    ''');
  }

}