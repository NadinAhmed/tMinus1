// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sparkline_data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SparklineData _$SparklineDataFromJson(Map<String, dynamic> json) =>
    SparklineData(
      price: (json['price'] as List<dynamic>)
          .map((e) => (e as num).toDouble())
          .toList(),
    );

Map<String, dynamic> _$SparklineDataToJson(SparklineData instance) =>
    <String, dynamic>{'price': instance.price};
