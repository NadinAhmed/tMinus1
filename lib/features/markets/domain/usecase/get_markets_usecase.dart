import 'package:dartz/dartz.dart';
import 'package:tminus1/core/failuers/remote_failure.dart';
import 'package:tminus1/features/markets/domain/repo/markets_repo.dart';

import '../../../home/domain/models/coin.dart';

class GetMarketsUseCase {
  final MarketsRepo _repository;

  GetMarketsUseCase({required MarketsRepo repository}) : _repository = repository;

  Future<Either<RemoteFailure, List<Coin>>> call() async {
    final result = await _repository.getMarkets();
    return result.map((coins) => coins.take(20).toList());
  }
}