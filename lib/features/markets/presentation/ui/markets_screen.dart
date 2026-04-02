import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tminus1/core/widgets/error_screen.dart';
import 'package:tminus1/core/widgets/loading_screen.dart';
import 'package:tminus1/features/markets/presentation/logic/markets_cubit.dart';
import 'package:tminus1/features/markets/presentation/ui/widgets/markets_item.dart';

import '../../../../core/theme/app_colors.dart';

class MarketsScreen extends StatelessWidget {
  const MarketsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.darkBackground,
      body: BlocBuilder<MarketsCubit, MarketsState>(
        builder: (context, state) {
          if (state is MarketsLoading) {
            return const LoadingScreen();
          } else if (state is MarketsError) {
            return ErrorScreen(errorMessage: state.message);
          } else if (state is MarketsSuccess) {
            final markets = state.allMarkets;
            return Padding(
              padding: const EdgeInsetsDirectional.only(bottom: 80),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: ListView.separated(
                      padding: const EdgeInsets.symmetric(vertical: 12),
                      itemCount: markets.length,
                      itemBuilder: (context, index) {
                        final coin = markets[index];
                        return MarketsItem(coin: coin);
                      },
                      separatorBuilder: (BuildContext context, int index) =>
                          const Divider(
                            color: AppColors.overlay50,
                            height: 1,
                            thickness: 1,
                            indent: 20,
                            endIndent: 20,
                          ),
                    ),
                  ),
                ],
              ),
            );
          }
          return const SizedBox.shrink();
        },
      ),
    );
  }
}
