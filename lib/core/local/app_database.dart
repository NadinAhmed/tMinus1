import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';

class AppDatabase {
  AppDatabase._();
  static final AppDatabase instance = AppDatabase._();

  static const _dbName = 'crypto_wallet.db';
  static const _dbVersion = 1;

  // Table & column constants
  static const tableAssets = 'wallet_assets';
  static const colId = 'id';
  static const colCoinId = 'coin_id';
  static const colName = 'name';
  static const colSymbol = 'symbol';
  static const colAmount = 'amount';
  static const colUsdValue = 'usd_value';
  static const colIconPath = 'icon_path';

  Database? _db;

  Future<Database> get database async {
    _db ??= await _initDb();
    return _db!;
  }

  Future<Database> _initDb() async {
    final dir = await getApplicationDocumentsDirectory();
    final path = join(dir.path, _dbName);

    return openDatabase(
      path,
      version: _dbVersion,
      onCreate: _onCreate,
    );
  }

  Future<void> _onCreate(Database db, int version) async {
    await db.execute('''
      CREATE TABLE $tableAssets (
        $colId       INTEGER PRIMARY KEY AUTOINCREMENT,
        $colCoinId   TEXT    NOT NULL,
        $colName     TEXT    NOT NULL,
        $colSymbol   TEXT    NOT NULL,
        $colAmount   REAL    NOT NULL DEFAULT 0,
        $colUsdValue REAL    NOT NULL DEFAULT 0,
        $colIconPath TEXT    NOT NULL DEFAULT ''
      )
    ''');
  }

  Future<void> close() async {
    final db = _db;
    if (db != null) {
      await db.close();
      _db = null;
    }
  }
}
