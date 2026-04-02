import 'package:dio/dio.dart';
import 'package:tminus1/features/markets/data/models/markets_response.dart';

class MarketsRemoteDatasource {
  final Dio _dio;

  MarketsRemoteDatasource({required Dio dio}) : _dio = dio;

  Future<List<MarketsResponse>> getMarkets() async {
    try {
      final response = await _dio.get(
        "coins/markets",
        queryParameters: {
          "vs_currency": "usd",
        },
      );
      final list = response.data as List;
      final markets = list.map((json) => MarketsResponse.fromJson(json)).toList();
      return markets;
    } on DioException catch (e) {
      throw Exception(e.message);
    }
  }
}