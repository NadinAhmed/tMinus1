import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tminus1/core/widgets/error_screen.dart';
import 'package:tminus1/core/widgets/loading_screen.dart';
import 'package:tminus1/features/home/presentation/logic/home_cubit.dart';
import 'package:tminus1/features/home/presentation/ui/widgets/coin_card.dart';
import 'package:tminus1/features/home/presentation/ui/widgets/grid_item.dart';
import 'package:tminus1/features/home/presentation/ui/widgets/transfer_card.dart';

import '../../../../core/routing/routes.dart';
import '../../../../core/theme/app_colors.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.darkBackground,
      body: BlocBuilder<HomeCubit, HomeState>(
        builder: (context, state) {
          if (state is HomeLoading) {
            return LoadingScreen();
          } else if (state is HomeError) {
            return ErrorScreen(errorMessage: state.message);
          } else if (state is HomeSuccess) {
            final recentCoins = state.recentCoins;
            final topCoins = state.topCoins;
            return SingleChildScrollView(
              physics: const ClampingScrollPhysics(),
              padding: EdgeInsetsDirectional.only(bottom: 100),
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsetsDirectional.symmetric(
                      horizontal: 24,
                      vertical: 18,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        CircleAvatar(
                          child: Image.asset(
                            "assets/images/circular_avatar.png",
                          ),
                        ),
                        IconButton(
                          onPressed: () {
                            Navigator.pushNamed(context, Routes.settings);
                          },
                          icon: const Icon(
                            Icons.settings,
                            color: AppColors.primary,
                          ),
                        ),
                      ],
                    ),
                  ),

                  GridView.count(
                    shrinkWrap: true,
                    crossAxisCount: 4,
                    mainAxisSpacing: 8,
                    crossAxisSpacing: 8,
                    children: [
                      GridItem(
                        imagePath: "assets/icons/deposit.svg",
                        label: "Deposit",
                      ),
                      GridItem(
                        imagePath: "assets/icons/referral.svg",
                        label: "Referral",
                      ),
                      GridItem(
                        imagePath: "assets/icons/grid_trading.svg",
                        label: "Grid Trading",
                      ),
                      GridItem(
                        imagePath: "assets/icons/margin.svg",
                        label: "Margin",
                      ),
                      GridItem(
                        imagePath: "assets/icons/launchpad.svg",
                        label: "Launchpad",
                      ),
                      GridItem(
                        imagePath: "assets/icons/savings.svg",
                        label: "Savings",
                      ),
                      GridItem(
                        imagePath: "assets/icons/liquid_swap.svg",
                        label: "Liquid Swap",
                      ),
                      GridItem(
                        imagePath: "assets/icons/more.svg",
                        label: "More",
                      ),
                    ],
                  ),

                  const SizedBox(height: 16),
                  Padding(
                    padding: EdgeInsetsDirectional.symmetric(horizontal: 24),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        TransferCard(
                          imagePath: "assets/images/rocket.png",
                          tittle: "P2P Trading",
                          description: "Bank Transfer, Paypal Revolut and more",
                        ),
                        const SizedBox(height: 12),
                        TransferCard(
                          imagePath: "assets/images/card.png",
                          tittle: "Credit/Debit Card",
                          description: "Visa, Mastercard",
                        ),
                        const SizedBox(height: 24),
                        Text(
                          "Recent Coin",
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: AppColors.white,
                          ),
                        ),
                        const SizedBox(height: 12),
                        SizedBox(
                          height: 140,
                          child: ListView.separated(
                            scrollDirection: Axis.horizontal,
                            itemCount: recentCoins.length,
                            separatorBuilder: (_, __) =>
                                const SizedBox(width: 12),
                            itemBuilder: (context, index) {
                              return SizedBox(
                                width: 200,
                                child: CoinCard(coin: recentCoins[index]),
                              );
                            },
                          ),
                        ),
                        const SizedBox(height: 24),
                        Text(
                          "Top Coin",
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: AppColors.white,
                          ),
                        ),
                        const SizedBox(height: 12),
                        SizedBox(
                          height: 140,
                          child: ListView.separated(
                            scrollDirection: Axis.horizontal,
                            itemCount: topCoins.length,
                            separatorBuilder: (_, __) =>
                                const SizedBox(width: 12),
                            itemBuilder: (context, index) {
                              return SizedBox(
                                width: 200,
                                child: CoinCard(
                                  coin: topCoins[index],
                                  drawCoinsChart: true,
                                ),
                              );
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            );
          } else {
            return Container();
          }
        },
      ),
    );
  }
}
