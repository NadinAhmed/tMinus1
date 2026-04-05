import '../../domian/wallet_repo.dart';
import '../datasorce/wallet_local_datasource.dart';
import '../models/wallet_asset.dart';

class WalletRepoImpl implements WalletRepo {
  final WalletLocalDataSource _localDataSource;

  WalletRepoImpl({required WalletLocalDataSource localDataSource})
    : _localDataSource = localDataSource;

  @override
  Future<List<WalletAsset>> fetchAllAssets() => _localDataSource.getAllAssets();

  @override
  Future<WalletAsset?> fetchAssetById(int id) =>
      _localDataSource.getAssetById(id);

  @override
  Future<WalletAsset> addAsset(WalletAsset asset) async {
    final newId = await _localDataSource.insertAsset(asset);
    return asset.copyWith(id: newId);
  }

  @override
  Future<WalletAsset> editAsset(WalletAsset asset) async {
    await _localDataSource.updateAsset(asset);
    return asset;
  }

  @override
  Future<void> removeAsset(int id) => _localDataSource.deleteAsset(id);
}
