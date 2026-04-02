import 'package:json_annotation/json_annotation.dart';

part 'recent_coin_data.g.dart';

@JsonSerializable()
class CoinData {
  final double price;

  @JsonKey(name: 'price_btc')
  final String priceBtc;

  @JsonKey(name: 'price_change_percentage_24h')
  final Map<String, dynamic> priceRatio;

  @JsonKey(name: 'sparkline')
  final String chartImageUrl;

  CoinData({
    required this.price,
    required this.priceBtc,
    required this.priceRatio,
    required this.chartImageUrl,
  });

  factory CoinData.fromJson(Map<String, dynamic> json) =>
      _$CoinDataFromJson(json);

  Map<String, dynamic> toJson() => _$CoinDataToJson(this);
}
