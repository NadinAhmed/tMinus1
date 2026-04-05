import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:tminus1/core/theme/app_colors.dart';
import 'package:tminus1/features/activity/activity_screen.dart';
import 'package:tminus1/features/home/presentation/ui/home_screen.dart';
import 'package:tminus1/features/markets/presentation/logic/markets_cubit.dart';
import 'package:tminus1/features/markets/presentation/ui/markets_screen.dart';
import 'package:tminus1/features/wallets/presentation/logic/wallet_cubit.dart';
import 'package:tminus1/features/wallets/presentation/ui/wallet_screen.dart';

import '../core/di/depedancy_container.dart';
import 'home/presentation/logic/home_cubit.dart';

class MainLayout extends StatefulWidget {
  const MainLayout({super.key});

  @override
  State<MainLayout> createState() => _MainLayoutState();
}

class _MainLayoutState extends State<MainLayout> {
  int _currentIndex = 0;

  final List<Widget> _screens = [
    BlocProvider(
      create: (context) => sl<HomeCubit>()
        ..getRecentCoins()
        ..getTopCoins(),
      child: const HomeScreen(),
    ),
    MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => sl<WalletCubit>()..loadAssets()),
        BlocProvider(create: (_) => sl<MarketsCubit>()..getAllMarkets()),
      ],
      child: const MarketsScreen(),
    ),
    const ActivityScreen(),
    BlocProvider(
      create: (context) => sl<WalletCubit>()..loadAssets(),
      child: const WalletScreen(),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          SafeArea(child: _screens[_currentIndex]),
          Positioned(
            bottom: 24,
            left: 24,
            right: 24,
            child: Container(
              decoration: BoxDecoration(
                color: AppColors.darkSurface,
                borderRadius: BorderRadius.circular(32),
                boxShadow: [
                  BoxShadow(
                    color: AppColors.overlay50,
                    blurRadius: 20,
                    offset: const Offset(0, 8),
                  ),
                ],
              ),
              padding: const EdgeInsetsDirectional.symmetric(
                horizontal: 16,
                vertical: 12,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  _buildNavItem(0, "assets/icons/home.svg", "Home"),
                  _buildNavItem(1, "assets/icons/market.svg", "Markets"),
                  _buildNavItem(2, "assets/icons/activity.svg", "Activity"),
                  _buildNavItem(3, "assets/icons/wallets.svg", "Wallets"),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildNavItem(int index, String iconPath, String label) {
    final isSelected = _currentIndex == index;

    return InkWell(
      onTap: () => setState(() => _currentIndex = index),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SvgPicture.asset(
            iconPath,
            width: 22,
            height: 22,
            colorFilter: ColorFilter.mode(
              isSelected ? AppColors.primary : AppColors.grey,
              BlendMode.srcIn,
            ),
          ),
          const SizedBox(height: 4),
          AnimatedSize(
            duration: const Duration(milliseconds: 250),
            curve: Curves.easeInOut,
            child: isSelected
                ? Text(
                    label,
                    style: const TextStyle(
                      fontSize: 13,
                      fontWeight: FontWeight.w600,
                      color: AppColors.primary,
                    ),
                  )
                : const SizedBox.shrink(),
          ),
        ],
      ),
    );
  }
}
