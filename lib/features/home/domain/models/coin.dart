class Coin {
  final String name;
  final String symbol;
  final String iconUrl;
  final double price;
  final double priceRatio;
  final String? chartImageUrl;
  final List<double>? sparklineData;

  Coin({
    required this.name,
    required this.symbol,
    required this.iconUrl,
    required this.price,
    required this.priceRatio,
    this.chartImageUrl,
    this.sparklineData,
  });
}