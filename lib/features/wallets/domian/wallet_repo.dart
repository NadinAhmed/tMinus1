import '../data/models/wallet_asset.dart';

abstract class WalletRepo {
  Future<List<WalletAsset>> fetchAllAssets();
  Future<WalletAsset?> fetchAssetById(int id);
  Future<WalletAsset> addAsset(WalletAsset asset);
  Future<WalletAsset> editAsset(WalletAsset asset);
  Future<void> removeAsset(int id);
}