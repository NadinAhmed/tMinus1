import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:tminus1/core/theme/app_colors.dart';
import 'package:tminus1/core/widgets/coin_icon.dart';
import 'package:tminus1/core/widgets/coins_chart.dart';
import 'package:tminus1/features/home/domain/models/coin.dart';

class CoinCard extends StatelessWidget {
  final Coin coin;
  final bool drawCoinsChart;

  const CoinCard({super.key, required this.coin, this.drawCoinsChart = false});

  @override
  Widget build(BuildContext context) {
    final isPositive = coin.priceRatio >= 0;

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
      decoration: BoxDecoration(
        color: AppColors.lightSurface,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            children: [
              Text(
                "${coin.price.toStringAsFixed(2)} USD",
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: isPositive ? AppColors.primary : AppColors.error,
                ),
              ),
              Spacer(),
              CoinIcon(iconUrl: coin.iconUrl)
            ],
          ),
          Row(
            children: [
              Text(
                coin.symbol.toUpperCase(),
                style: TextStyle(fontSize: 14, color: AppColors.black),
              ),
              const SizedBox(width: 8),
              Text(
                "${coin.priceRatio.toStringAsFixed(2)}%",
                style: TextStyle(
                  fontSize: 12,
                  color: isPositive ? AppColors.primary : AppColors.error,
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),
          drawCoinsChart
              ? CoinsChart(prices: coin.sparklineData!)
              : SvgPicture.network(
                  coin.chartImageUrl!,
                  placeholderBuilder: (context) =>
                      CircularProgressIndicator(color: AppColors.primary),
                  errorBuilder: (context, error, stackTrace) =>
                      SvgPicture.asset(
                        isPositive
                            ? "assets/svg/green_chart.svg"
                            : "assets/svg/red_chart.svg",
                      ),
                  width: double.infinity,
                  height: 40,
                  fit: BoxFit.cover,
                  colorFilter: ColorFilter.mode(
                    isPositive ? AppColors.primary : AppColors.error,
                    BlendMode.srcIn,
                  ),
                ),
        ],
      ),
    );
  }
}
