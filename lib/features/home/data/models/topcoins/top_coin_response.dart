import 'package:json_annotation/json_annotation.dart';
import 'package:tminus1/features/home/data/models/topcoins/sparkline_data.dart';

import '../../../domain/models/coin.dart';

part 'top_coin_response.g.dart';

@JsonSerializable()
class TopCoinResponse {
  final String id;
  final String symbol;
  final String name;
  @JsonKey(name: 'image')
  final String iconUrl;

  @JsonKey(name: 'current_price')
  final double currentPrice;

  @JsonKey(name: 'price_change_percentage_24h')
  final double? priceRatio;

  @JsonKey(name: 'sparkline_in_7d')
  final SparklineData sparklineData;

  TopCoinResponse({
    required this.id,
    required this.symbol,
    required this.name,
    required this.iconUrl,
    required this.currentPrice,
    required this.priceRatio,
    required this.sparklineData,
  });

  factory TopCoinResponse.fromJson(Map<String, dynamic> json) =>
      _$TopCoinResponseFromJson(json);

  Map<String, dynamic> toJson() => _$TopCoinResponseToJson(this);
}

extension TopCoinMapper on TopCoinResponse {
  Coin toDomain() {
    return Coin(
      name: name,
      symbol: symbol,
      iconUrl: iconUrl,
      price: currentPrice,
      priceRatio: priceRatio ?? 0.0,
      sparklineData: sparklineData.price,
    );
  }
}
