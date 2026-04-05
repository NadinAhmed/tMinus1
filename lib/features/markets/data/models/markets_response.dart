import 'package:json_annotation/json_annotation.dart';

import '../../../home/domain/models/coin.dart';

part 'markets_response.g.dart';
@JsonSerializable()
class MarketsResponse {
  final String id;
  final String symbol;
  final String name;
  @JsonKey(name: 'image')
  final String iconUrl;
  @JsonKey(name: 'current_price')
  final double currentPrice;
  @JsonKey(name: 'price_change_percentage_24h')
  final double? priceRatio;

  MarketsResponse({
    required this.id,
    required this.symbol,
    required this.name,
    required this.iconUrl,
    required this.currentPrice,
    required this.priceRatio,
  });

  factory MarketsResponse.fromJson(Map<String, dynamic> json) =>
      _$MarketsResponseFromJson(json);

  Map<String, dynamic> toJson() => _$MarketsResponseToJson(this);
}

extension MarketsMapper on MarketsResponse {
  Coin toDomain() {
    return Coin(
      id: id,
      name: name,
      symbol: symbol,
      iconUrl: iconUrl,
      price: currentPrice,
      priceRatio: priceRatio ?? 0.0,
    );
  }
}