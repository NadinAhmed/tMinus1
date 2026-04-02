// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'top_coin_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TopCoinResponse _$TopCoinResponseFromJson(Map<String, dynamic> json) =>
    TopCoinResponse(
      id: json['id'] as String,
      symbol: json['symbol'] as String,
      name: json['name'] as String,
      iconUrl: json['image'] as String,
      currentPrice: (json['current_price'] as num).toDouble(),
      priceRatio: (json['price_change_percentage_24h'] as num?)?.toDouble(),
      sparklineData: SparklineData.fromJson(
        (json['sparkline_in_7d'] as Map<String, dynamic>).map(
          (k, e) => MapEntry(
            k,
            (e as List<dynamic>).map((e) => (e as num).toDouble()).toList(),
          ),
        ),
      ),
    );

Map<String, dynamic> _$TopCoinResponseToJson(TopCoinResponse instance) =>
    <String, dynamic>{
      'id': instance.id,
      'symbol': instance.symbol,
      'name': instance.name,
      'image': instance.iconUrl,
      'current_price': instance.currentPrice,
      'price_change_percentage_24h': instance.priceRatio,
      'sparkline_in_7d': instance.sparklineData,
    };
