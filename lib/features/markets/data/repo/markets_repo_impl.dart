import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:tminus1/core/failuers/remote_failure.dart';
import 'package:tminus1/features/home/domain/models/coin.dart';
import 'package:tminus1/features/markets/domain/repo/markets_repo.dart';

import '../datasource/markets_remote_datasource.dart';
import '../models/markets_response.dart';

class MarketsRepoImpl extends MarketsRepo {
  final MarketsRemoteDatasource _datasource;

  MarketsRepoImpl({required MarketsRemoteDatasource datasource})
    : _datasource = datasource;

  @override
  Future<Either<RemoteFailure, List<Coin>>> getMarkets() async {
    try {
      final response = await _datasource.getMarkets();
      return Right(response.map((coin) => coin.toDomain()).toList());
    } on DioException catch (e) {
      return Left(NetworkFailure(e.message ?? "Network error"));
    } catch (e) {
      return Left(UnexpectedFailure("Unexpected error: $e"));
    }
  }
}
