import 'package:json_annotation/json_annotation.dart';

import '../../../domain/models/coin.dart';
import 'coins_wrapper.dart';

part 'recent_coins_response.g.dart';

@JsonSerializable()
class RecentCoinsResponse {
  final List<CoinsWrapper> coins;

  RecentCoinsResponse({required this.coins});

  factory RecentCoinsResponse.fromJson(Map<String, dynamic> json) =>
      _$RecentCoinsResponseFromJson(json);

  Map<String, dynamic> toJson() => _$RecentCoinsResponseToJson(this);
}

extension RecentCoinsResponseMapper on RecentCoinsResponse {
  List<Coin> toDomain() {
    return coins.map((wrapper) => wrapper.toDomain()).toList();
  }
}
