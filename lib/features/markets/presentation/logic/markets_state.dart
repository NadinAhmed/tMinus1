part of 'markets_cubit.dart';

abstract class MarketsState extends Equatable {
  const MarketsState();

  @override
  List<Object> get props => [];
}

final class MarketsInitial extends MarketsState {}

final class MarketsLoading extends MarketsState {}

class MarketsSuccess extends MarketsState {
  final List<Coin> allMarkets;
  final String? actionMessage;

  const MarketsSuccess(this.allMarkets, {this.actionMessage});

  MarketsSuccess copyWith({List<Coin>? allMarkets, String? actionMessage}) =>
      MarketsSuccess(
        allMarkets ?? this.allMarkets,
        actionMessage: actionMessage,
      );

  @override
  List<Object> get props => [allMarkets, actionMessage ?? ''];
}

final class MarketsError extends MarketsState {
  final String message;

  const MarketsError(this.message);

  @override
  List<Object> get props => [message];
}

class AssetAddedToWallet extends MarketsState {
  final WalletAsset asset;

  const AssetAddedToWallet(this.asset);

  @override
  List<Object> get props => [asset];
}

class AssetRemovedFromWallet extends MarketsState {
  final int assetId;

  const AssetRemovedFromWallet(this.assetId);

  @override
  List<Object> get props => [assetId];
}

class WalletActionError extends MarketsState {
  final String assetMessage;

  const WalletActionError(this.assetMessage);

  @override
  List<Object> get props => [assetMessage];
}
