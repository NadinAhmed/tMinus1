// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'recent_coin_data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CoinData _$CoinDataFromJson(Map<String, dynamic> json) => CoinData(
  price: (json['price'] as num).toDouble(),
  priceBtc: json['price_btc'] as String,
  priceRatio: json['price_change_percentage_24h'] as Map<String, dynamic>,
  chartImageUrl: json['sparkline'] as String,
);

Map<String, dynamic> _$CoinDataToJson(CoinData instance) => <String, dynamic>{
  'price': instance.price,
  'price_btc': instance.priceBtc,
  'price_change_percentage_24h': instance.priceRatio,
  'sparkline': instance.chartImageUrl,
};
