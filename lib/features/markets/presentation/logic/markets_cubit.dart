import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:tminus1/features/markets/domain/usecase/get_markets_usecase.dart';

import '../../../home/domain/models/coin.dart';
import '../../../wallets/data/models/wallet_asset.dart';
import '../../../wallets/domian/wallet_repo.dart';

part 'markets_state.dart';

class MarketsCubit extends Cubit<MarketsState> {
  final GetMarketsUseCase _getAllMarketsUseCase;
  final WalletRepo _repo;

  MarketsCubit({
    required GetMarketsUseCase getAllMarketsUseCase,
    required WalletRepo repository,
  }) : _repo = repository,
       _getAllMarketsUseCase = getAllMarketsUseCase,
       super(MarketsInitial());

  Future<void> getAllMarkets() async {
    emit(MarketsLoading());
    final result = await _getAllMarketsUseCase();
    result.fold((failure) => emit(MarketsError(failure.message)), (coins) {
      emit(MarketsSuccess(coins));
    });
  }

  Future<void> addAsset(WalletAsset asset) async {
    final currentCoins = state is MarketsSuccess
        ? (state as MarketsSuccess).allMarkets
        : <Coin>[];

    try {
      await _repo.addAsset(asset);
      emit(MarketsSuccess(currentCoins, actionMessage: '${asset.name} added to favorites'));
    } catch (e) {
      emit(MarketsSuccess(currentCoins, actionMessage: 'Error: ${e.toString()}'));
    }
  }

  Future<void> deleteAsset(int id) async {
    final currentCoins = state is MarketsSuccess
        ? (state as MarketsSuccess).allMarkets
        : <Coin>[];

    try {
      await _repo.removeAsset(id);
      emit(MarketsSuccess(currentCoins, actionMessage: 'Removed from favorites'));
    } catch (e) {
      emit(MarketsSuccess(currentCoins, actionMessage: 'Error: ${e.toString()}'));
    }
  }
}
