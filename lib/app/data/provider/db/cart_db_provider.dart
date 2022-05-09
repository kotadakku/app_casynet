import 'package:app_casynet/app/data/model/item_product_in_cart.dart';
import 'package:sqflite/sqflite.dart';
import 'dart:async';
import 'package:path/path.dart';

class CartDatabaseHelper{
  static final String _databaseName = "cart.db";

  static final _databaseVersion = 1;
  static final String table = 'cart';
  static final String columnProductId = 'p_id';
  static final String columnProductSku = 'p_sku';
  static final String columnProductImage = 'p_image';
  static final String columnProductName = 'p_name';
  static final String columnStoreName = 's_name';
  static final String columnDiscountPrice = 'discount_price';
  static final String columnPrice = 'price';
  static final String columnQuantity = 'quantity';
  static final String columnCartId = 'cartId';


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
            $columnProductId INTEGER PRIMARY KEY UNIQUE,
            $columnProductSku TEXT NOT NULL,
            $columnProductImage TEXT NOT NULL,
            $columnProductName TEXT NOT NULL,
            $columnPrice INTEGER NOT NULL,
            $columnDiscountPrice INTEGER NOT NULL,
            $columnStoreName TEXT NOT NULL,
            $columnQuantity INTEGER NOT NULL,
            $columnCartId INTEGER NOT NULL  
          )
    ''');
  }


  Future<int?> insert(ProductCart cart) async {
    Database? db = await instance.database;
    var res = await db?.insert(table, cart.toJson());
    return res;
  }

  Future<List<Map<String, dynamic>>?> queryAllRows() async {
    Database? db = await instance.database;
    var res = await db?.query(table, orderBy: "$columnProductId DESC");
    return res;
  }
  Future<bool> checkExists(int? id) async {
    Database? db = await instance.database;
    var res = await db?.query(table, where: '$columnProductId = $id');
    print(res?.length);
    if(res?.length==0) return false;
    return true;
  }

  Future<void> clear() async {
    Database? db = await instance.database;
    await db?.delete(table);
  }
  Future<void> updateQuantity(int qty, int id) async{

    Database? db = await instance.database;
    int? updateCount = await db?.rawUpdate('''
            UPDATE $table 
            SET $columnQuantity = ? 
            WHERE $columnProductId = ?
            ''',
        [qty, id]);

    // show the results: print all rows in the db
    print(await db?.query(table));
  }

  Future<void> addQuantity(int? id) async{

    Database? db = await instance.database;
    int? updateCount = await db?.rawUpdate('''
            UPDATE $table 
            SET $columnQuantity = $columnQuantity + 1 
            WHERE $columnProductId = $id
            ''',);

    // show the results: print all rows in the db
    print(await db?.query(table));
  }
  Future<void> deleteRow(int? id) async{

    Database? db = await instance.database;

    int? deleteRow = await db?.rawDelete('''
      DELETE FROM $table
      WHERE $columnProductId = ${id}
    ''');
  }

}