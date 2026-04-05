part of 'wallet_cubit.dart';

enum WalletStatus { initial, loading, success, error }

final class WalletState extends Equatable {
  final WalletStatus status;
  final List<WalletAsset> assets;
  final String? errorMessage;

  const WalletState({
    this.status = WalletStatus.initial,
    this.assets = const [],
    this.errorMessage,
  });

  double get totalUsd => assets.fold(0, (sum, a) => sum + a.usdValue);
  double get totalBalance => assets.fold(0, (sum, a) => sum + a.amount);

  WalletState copyWith({
    WalletStatus? status,
    List<WalletAsset>? assets,
    String? errorMessage,
  }) =>
      WalletState(
        status: status ?? this.status,
        assets: assets ?? this.assets,
        errorMessage: errorMessage,
      );

  @override
  List<Object?> get props => [status, assets, errorMessage];
}
