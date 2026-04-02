import 'package:dartz/dartz.dart';
import 'package:tminus1/core/failuers/remote_failure.dart';
import 'package:tminus1/features/home/domain/models/coin.dart';

abstract class HomeRepo {
  Future<Either<RemoteFailure, List<Coin>>> getRecentCoins();
  Future<Either<RemoteFailure, List<Coin>>> getTopCoins();
}