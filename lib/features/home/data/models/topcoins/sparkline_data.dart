import 'package:json_annotation/json_annotation.dart';

part 'sparkline_data.g.dart';

@JsonSerializable()
class SparklineData {
  final List<double> price;

  SparklineData({required this.price});

  factory SparklineData.fromJson(Map<String, List<double>> json) =>
      _$SparklineDataFromJson(json);

  Map<String, dynamic> toJson() => _$SparklineDataToJson(this);
}

