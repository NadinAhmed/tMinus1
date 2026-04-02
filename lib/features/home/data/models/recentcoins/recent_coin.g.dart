// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'recent_coin.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RecentCoin _$RecentCoinFromJson(Map<String, dynamic> json) => RecentCoin(
  id: json['id'] as String,
  coinId: (json['coin_id'] as num).toInt(),
  name: json['name'] as String,
  symbol: json['symbol'] as String,
  icon: json['thumb'] as String,
  data: CoinData.fromJson(json['data'] as Map<String, dynamic>),
);

Map<String, dynamic> _$RecentCoinToJson(RecentCoin instance) =>
    <String, dynamic>{
      'id': instance.id,
      'coin_id': instance.coinId,
      'name': instance.name,
      'symbol': instance.symbol,
      'thumb': instance.icon,
      'data': instance.data,
    };
