import 'package:dartz/dartz.dart';
import 'package:tminus1/features/home/domain/repo/home_repo.dart';

import '../../../../core/failuers/remote_failure.dart';
import '../models/coin.dart';

class GetCoinsUseCase {
  final HomeRepo _repository;

  GetCoinsUseCase({required HomeRepo repository}) : _repository = repository;

  Future<Either<RemoteFailure, List<Coin>>> getRecentCoins() async {
    final result = await _repository.getRecentCoins();
    return result.map((coins) => coins.take(10).toList());
  }

  Future<Either<RemoteFailure, List<Coin>>> getTopCoins() async {
    final result = await _repository.getTopCoins();
    return result.map((coins) => coins.take(10).toList());
  }
}
