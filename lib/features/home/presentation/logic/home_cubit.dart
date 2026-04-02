import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:tminus1/features/home/domain/models/coin.dart';
import 'package:tminus1/features/home/domain/usecase/get_coins_usecase.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  final GetCoinsUseCase _getCoinsUseCase;

  HomeCubit({required GetCoinsUseCase getCoinsUseCase})
    : _getCoinsUseCase = getCoinsUseCase,
      super(HomeInitial());

  Future<void> getRecentCoins() async {
    emit(HomeLoading());
    final result = await _getCoinsUseCase.getRecentCoins();
    result.fold((failure) => emit(HomeError(failure.message)), (coins) {
      final currentTopCoins = state is HomeSuccess
          ? (state as HomeSuccess).topCoins
          : <Coin>[];
      emit(HomeSuccess(topCoins: currentTopCoins, recentCoins: coins));
    });
  }

  Future<void> getTopCoins() async {
    emit(HomeLoading());
    final result = await _getCoinsUseCase.getTopCoins();
    result.fold((failure) => emit(HomeError(failure.message)), (coins) {
      final currentRecentCoins = state is HomeSuccess
          ? (state as HomeSuccess).recentCoins
          : <Coin>[];
      emit(HomeSuccess(topCoins: coins, recentCoins: currentRecentCoins));
    });
  }
}
