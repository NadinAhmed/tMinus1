import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../data/models/wallet_asset.dart';
import '../../domian/wallet_repo.dart';

part 'wallet_state.dart';

class WalletCubit extends Cubit<WalletState> {
  final WalletRepo _repo;

  WalletCubit({required WalletRepo repository})
    : _repo = repository,
      super(const WalletState());

  Future<void> loadAssets() async {
    emit(state.copyWith(status: WalletStatus.loading));
    try {
      final assets = await _repo.fetchAllAssets();
      emit(state.copyWith(status: WalletStatus.success, assets: assets));
    } catch (e) {
      emit(
        state.copyWith(status: WalletStatus.error, errorMessage: e.toString()),
      );
    }
  }

  Future<void> deleteAsset(int id) async {
    try {
      await _repo.removeAsset(id);
      await loadAssets();
    } catch (e) {
      emit(
        state.copyWith(status: WalletStatus.error, errorMessage: e.toString()),
      );
    }
  }
}
