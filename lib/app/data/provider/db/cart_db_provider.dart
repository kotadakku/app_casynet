import 'package:sqflite/sqflite.dart';
import 'dart:async';
import 'package:path/path.dart';

class CartDatabaseHelper{
  static final String _databaseName = "cart.db";

  static final _databaseVersion = 1;
  static final String table = 'cart';
  static final String columnId = 'id';
  static final String columnProductId = 'p_id';
  static final String columnProductSku = 'sku';
  static final String columnProductImage = 'p_image';
  static final String columnProductName = 'p_name';
  static final String columnStoreName = 's_name';
  static final String columnDiscountPrice = 'discount_price';
  static final String columnPrice = 'price';
  static final String columnQuantity = 'quantity';


  CartDatabaseHelper._privateContructor();

  static final CartDatabaseHelper instance = CartDatabaseHelper._privateContructor();

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
            $columnProductId INTEGER NOT NULL,
            $columnProductSku TEXT NOT NULL,
            $columnProductImage TEXT NOT NULL,
            $columnProductName TEXT NOT NULL,
            $columnPrice INTEGER NOT NULL,
            $columnDiscountPrice INTEGER NOT NULL,
            $columnStoreName TEXT NOT NULL,
            $columnQuantity INTEGER NOT NULL,   
          )
    ''');
  }


  // Future<int?> insert(Sales sale) async {
  //   Database? db = await instance.database;
  //   var res = await db?.insert(table, sale.toJson());
  //   return res;
  // }

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