import 'package:sqflite/sqflite.dart';

import '../../../../core/local/app_database.dart';
import '../models/wallet_asset.dart';


class WalletLocalDataSource{
  final AppDatabase _db;

  WalletLocalDataSource({AppDatabase? db})
      : _db = db ?? AppDatabase.instance;

  Future<Database> get _database => _db.database;

  Future<List<WalletAsset>> getAllAssets() async {
    final db = await _database;
    final rows = await db.query(AppDatabase.tableAssets);
    return rows.map(WalletAsset.fromMap).toList();
  }

  Future<WalletAsset?> getAssetById(int id) async {
    final db = await _database;
    final rows = await db.query(
      AppDatabase.tableAssets,
      where: '${AppDatabase.colId} = ?',
      whereArgs: [id],
      limit: 1,
    );
    if (rows.isEmpty) return null;
    return WalletAsset.fromMap(rows.first);
  }

  Future<int> insertAsset(WalletAsset asset) async {
    final db = await _database;
    return db.insert(
      AppDatabase.tableAssets,
      asset.toMap(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  Future<int> updateAsset(WalletAsset asset) async {
    assert(asset.id != null, 'Cannot update an asset without an id');
    final db = await _database;
    return db.update(
      AppDatabase.tableAssets,
      asset.toMap(),
      where: '${AppDatabase.colId} = ?',
      whereArgs: [asset.id],
    );
  }

  Future<int> deleteAsset(int id) async {
    final db = await _database;
    return db.delete(
      AppDatabase.tableAssets,
      where: '${AppDatabase.colId} = ?',
      whereArgs: [id],
    );
  }

  Future<void> deleteAllAssets() async {
    final db = await _database;
    await db.delete(AppDatabase.tableAssets);
  }
}
