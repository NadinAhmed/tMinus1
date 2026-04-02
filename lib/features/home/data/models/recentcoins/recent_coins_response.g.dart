// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'recent_coins_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RecentCoinsResponse _$RecentCoinsResponseFromJson(Map<String, dynamic> json) =>
    RecentCoinsResponse(
      coins: (json['coins'] as List<dynamic>)
          .map((e) => CoinsWrapper.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$RecentCoinsResponseToJson(
  RecentCoinsResponse instance,
) => <String, dynamic>{'coins': instance.coins};
