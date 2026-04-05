import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tminus1/core/widgets/error_screen.dart';
import 'package:tminus1/core/widgets/loading_screen.dart';
import 'package:tminus1/features/markets/presentation/logic/markets_cubit.dart';
import 'package:tminus1/features/markets/presentation/ui/widgets/markets_item.dart';
import 'package:tminus1/features/wallets/presentation/logic/wallet_cubit.dart';
import 'package:tminus1/features/wallets/data/models/wallet_asset.dart';
import '../../../../core/theme/app_colors.dart';

class MarketsScreen extends StatelessWidget {
  const MarketsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.darkBackground,
      body:BlocListener<MarketsCubit, MarketsState>(
        listenWhen: (previous, current) =>
        current is MarketsSuccess && current.actionMessage != null,
        listener: (context, state) {
          if (state is MarketsSuccess && state.actionMessage != null) {
            context.read<WalletCubit>().loadAssets();
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text(state.actionMessage!)),
            );
          }
        },
        child: BlocBuilder<MarketsCubit, MarketsState>(
          builder: (context, state) {
            if (state is MarketsLoading) {
              return const LoadingScreen();
            } else if (state is MarketsError) {
              return ErrorScreen(errorMessage: state.message);
            } else if (state is MarketsSuccess) {
              final markets = state.allMarkets;
              final walletAssets =
                  context.watch<WalletCubit>().state.assets;
              final favoritedIds =
              walletAssets.map((a) => a.coinId).toSet();

              return Padding(
                padding: const EdgeInsetsDirectional.only(bottom: 80),
                child: ListView.separated(
                  padding: const EdgeInsets.symmetric(vertical: 12),
                  itemCount: markets.length,
                  separatorBuilder: (_, __) => SizedBox(
                    height: 8
                  ),
                  itemBuilder: (context, index) {
                    final coin = markets[index];
                    final isFav = favoritedIds.contains(coin.id);

                    return MarketsItem(
                      coin: coin,
                      isFavorite: isFav,
                      onAddToWallet: () {
                        final cubit = context.read<MarketsCubit>();
                        if (isFav) {
                          final asset = walletAssets
                              .firstWhere((a) => a.coinId == coin.id);
                          cubit.deleteAsset(asset.id!);
                        } else {
                          cubit.addAsset(
                            WalletAsset(
                              coinId: coin.id,
                              name: coin.name,
                              symbol: coin.symbol,
                              amount: 0,
                              usdValue: coin.price,
                              iconPath: coin.iconUrl,
                            ),
                          );
                        }
                      },
                    );
                  },
                ),
              );
            }
            return const SizedBox.shrink();
          },
        ),
      ),
    );
  }
}