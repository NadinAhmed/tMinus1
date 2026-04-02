import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:tminus1/features/markets/domain/usecase/get_markets_usecase.dart';

import '../../../home/domain/models/coin.dart';

part 'markets_state.dart';

class MarketsCubit extends Cubit<MarketsState> {
  final GetMarketsUseCase _getAllMarketsUseCase;

  MarketsCubit({required GetMarketsUseCase getAllMarketsUseCase})
    : _getAllMarketsUseCase = getAllMarketsUseCase,
      super(MarketsInitial());

  Future<void> getAllMarkets() async {
    emit(MarketsLoading());
    final result = await _getAllMarketsUseCase();
    result.fold((failure) => emit(MarketsError(failure.message)), (coins) {
      emit(MarketsSuccess(coins));
    });
  }
}
