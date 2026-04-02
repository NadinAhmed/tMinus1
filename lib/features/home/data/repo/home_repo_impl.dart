import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:tminus1/core/failuers/remote_failure.dart';
import 'package:tminus1/features/home/domain/models/coin.dart';
import 'package:tminus1/features/home/domain/repo/home_repo.dart';

import '../datasource/home_remote_datasource.dart';
import '../models/recentcoins/recent_coins_response.dart';
import '../models/topcoins/top_coin_response.dart';

class HomeRepoImpl extends HomeRepo {
  final HomeRemoteDatasource _datasource;

  HomeRepoImpl({required HomeRemoteDatasource datasource})
    : _datasource = datasource;

  @override
  Future<Either<RemoteFailure, List<Coin>>> getRecentCoins() async {
    try {
      final response = await _datasource.getRecentCoins();
      return Right(response.toDomain());
    } on DioException catch (e) {
      return Left(NetworkFailure(e.message ?? "Network error"));
    } catch (e) {
      return Left(UnexpectedFailure("Unexpected error: $e"));
    }
  }

  @override
  Future<Either<RemoteFailure, List<Coin>>> getTopCoins() async {
    try {
      final response = await _datasource.getTopCoins();
      return Right(response.map((coin) => coin.toDomain()).toList());
    } on DioException catch (e) {
      return Left(NetworkFailure(e.message ?? "Network error"));
    } catch (e) {
      return Left(UnexpectedFailure("Unexpected error: $e"));
    }
  }
}
