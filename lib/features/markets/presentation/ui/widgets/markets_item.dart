import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../../../core/theme/app_colors.dart';
import '../../../../../core/widgets/coin_icon.dart';
import '../../../../home/domain/models/coin.dart';

class MarketsItem extends StatelessWidget {
  final Coin coin;
  final bool isFavorite;
  final VoidCallback? onAddToWallet;

  const MarketsItem({super.key, required this.coin, this.onAddToWallet, this.isFavorite = false});

  @override
  Widget build(BuildContext context) {
    final isPositive = coin.priceRatio >= 0;

    return Container(
      decoration: BoxDecoration(
        color: AppColors.darkSurface,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        child: Row(
          children: [
            CoinIcon(iconUrl: coin.iconUrl),
            const SizedBox(width: 12),

            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    coin.name,
                    style: const TextStyle(
                      color: AppColors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      letterSpacing: 0.1,
                    ),
                  ),
                  const SizedBox(height: 3),
                  Text(
                    coin.symbol.toUpperCase(),
                    style: const TextStyle(color: AppColors.grey, fontSize: 12),
                  ),
                ],
              ),
            ),
            const SizedBox(width: 12),

            Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(
                  '\$${coin.price.toStringAsFixed(2)}',
                  style: const TextStyle(
                    color: AppColors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    letterSpacing: 0.2,
                  ),
                ),
                const SizedBox(height: 3),
                Text(
                  "${coin.priceRatio.toStringAsFixed(2)}%",
                  style: TextStyle(
                    fontSize: 12,
                    color: isPositive ? AppColors.primary : AppColors.error,
                  ),
                ),
              ],
            ),
            IconButton(
              onPressed: onAddToWallet,
              icon:AnimatedSwitcher(
                duration: const Duration(milliseconds: 300),
                transitionBuilder: (child, animation) => ScaleTransition(
                  scale: animation,
                  child: child,
                ),
                child: Icon(
                  isFavorite ? Icons.favorite : Icons.favorite_border_outlined,
                  key: ValueKey(isFavorite),
                  color: isFavorite ? AppColors.primary : AppColors.primary,
                  size: 22,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
