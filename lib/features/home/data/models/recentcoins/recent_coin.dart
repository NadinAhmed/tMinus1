import 'package:json_annotation/json_annotation.dart';

import 'recent_coin_data.dart';

part 'recent_coin.g.dart';

@JsonSerializable()
class RecentCoin {
  final String id;
  @JsonKey(name: 'coin_id')
  final int coinId;
  final String name;
  final String symbol;
  @JsonKey(name: 'thumb')
  final String icon;
  final CoinData data;

  RecentCoin({
    required this.id,
    required this.coinId,
    required this.name,
    required this.symbol,
    required this.icon,
    required this.data,
  });

  factory RecentCoin.fromJson(Map<String, dynamic> json) =>
      _$RecentCoinFromJson(json);

  Map<String, dynamic> toJson() => _$RecentCoinToJson(this);
}
