import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:tminus1/features/home/data/models/recentcoins/recent_coins_response.dart';
import 'package:tminus1/features/home/data/models/topcoins/top_coin_response.dart';

class HomeRemoteDatasource {
  final Dio _dio;

  HomeRemoteDatasource({required Dio dio}) : _dio = dio;

  Future<RecentCoinsResponse> getRecentCoins() async {
    try {
      final response = await _dio.get("search/trending");
      return RecentCoinsResponse.fromJson(response.data);
    } on DioException catch (e) {
      throw Exception(e.message);
    }
  }

  Future<List<TopCoinResponse>> getTopCoins() async {
    try {
      final response = await _dio.get(
        "coins/markets",
        queryParameters: {
          "vs_currency": "usd",
          "order": "market_cap_desc",
          "per_page": 10,
          "page": 1,
          "sparkline": true,
        },
      );
      final list = response.data as List;
      print("✅ Response length: ${list.length}");
      print("✅ First item: ${list.first}");

      final topCoins = list.map((json) => TopCoinResponse.fromJson(json)).toList();
      print("✅ Mapped coins: ${topCoins.first.name}");
      return topCoins;
    } on DioException catch (e) {
      print("❌ DioException: ${e.message}");
      print("❌ Response: ${e.response?.data}");
      throw Exception(e.message);
    }
  }
}
