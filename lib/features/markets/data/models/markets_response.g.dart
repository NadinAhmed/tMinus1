// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'markets_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MarketsResponse _$MarketsResponseFromJson(Map<String, dynamic> json) =>
    MarketsResponse(
      id: json['id'] as String,
      symbol: json['symbol'] as String,
      name: json['name'] as String,
      iconUrl: json['image'] as String,
      currentPrice: (json['current_price'] as num).toDouble(),
      priceRatio: (json['price_change_percentage_24h'] as num?)?.toDouble(),
    );

Map<String, dynamic> _$MarketsResponseToJson(MarketsResponse instance) =>
    <String, dynamic>{
      'id': instance.id,
      'symbol': instance.symbol,
      'name': instance.name,
      'image': instance.iconUrl,
      'current_price': instance.currentPrice,
      'price_change_percentage_24h': instance.priceRatio,
    };
