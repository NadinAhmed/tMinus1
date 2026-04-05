import 'package:json_annotation/json_annotation.dart';
import 'package:tminus1/features/home/data/models/recentcoins/recent_coin.dart';

import '../../../domain/models/coin.dart';

part 'coins_wrapper.g.dart';

@JsonSerializable()
class CoinsWrapper {
  final RecentCoin item;

  CoinsWrapper({required this.item});

  factory CoinsWrapper.fromJson(Map<String, dynamic> json) =>
      _$CoinsWrapperFromJson(json);

  Map<String, dynamic> toJson() => _$CoinsWrapperToJson(this);
}


extension CoinsWrapperMapper on CoinsWrapper {
  Coin toDomain() {
    return Coin(
      id: item.id,
      name: item.name,
      symbol: item.symbol,
      iconUrl: item.icon,
      price: item.data.price,
      priceRatio: item.data.priceRatio['usd'] ?? 0.0,
      chartImageUrl: item.data.chartImageUrl,
    );
  }
}