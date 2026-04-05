class WalletAsset {
  final int? id;
  final String coinId;
  final String name;
  final String symbol;
  final double amount;
  final double usdValue;
  final String iconPath;

  const WalletAsset({
    this.id,
    required this.coinId,
    required this.name,
    required this.symbol,
    required this.amount,
    required this.usdValue,
    required this.iconPath,
  });

  double get totalUsd => usdValue;

  WalletAsset copyWith({
    int? id,
    String? coinId,
    String? name,
    String? symbol,
    double? amount,
    double? usdValue,
    String? iconPath,
  }) {
    return WalletAsset(
      id: id ?? this.id,
      coinId: coinId ?? this.coinId,
      name: name ?? this.name,
      symbol: symbol ?? this.symbol,
      amount: amount ?? this.amount,
      usdValue: usdValue ?? this.usdValue,
      iconPath: iconPath ?? this.iconPath,
    );
  }

  Map<String, dynamic> toMap() => {
        if (id != null) 'id': id,
        'coin_id': coinId,
        'name': name,
        'symbol': symbol,
        'amount': amount,
        'usd_value': usdValue,
        'icon_path': iconPath,
      };

  factory WalletAsset.fromMap(Map<String, dynamic> map) => WalletAsset(
        id: map['id'] as int?,
        coinId: map['coin_id'] as String,
        name: map['name'] as String,
        symbol: map['symbol'] as String,
        amount: (map['amount'] as num).toDouble(),
        usdValue: (map['usd_value'] as num).toDouble(),
        iconPath: map['icon_path'] as String,
      );
}
