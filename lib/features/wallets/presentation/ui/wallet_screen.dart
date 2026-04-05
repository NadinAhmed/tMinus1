import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:path/path.dart';
import 'package:tminus1/core/theme/app_colors.dart';
import 'package:tminus1/core/widgets/error_screen.dart';
import 'package:tminus1/core/widgets/loading_screen.dart';
import 'package:tminus1/features/wallets/presentation/ui/widgets/asset_list_tile.dart';

import '../logic/wallet_cubit.dart';

class WalletScreen extends StatelessWidget {
  const WalletScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.darkBackground,
      body: SafeArea(child: _buildBody()),
    );
  }

  Widget _buildBody() {
    return BlocBuilder<WalletCubit, WalletState>(
      builder: (context, state) {
        return CustomScrollView(
          slivers: [
            SliverToBoxAdapter(child: _buildHeader(state)),
            SliverToBoxAdapter(child: _buildActionButtons()),
            const SliverToBoxAdapter(child: SizedBox(height: 8)),
            if (state.status == WalletStatus.loading)
              const SliverFillRemaining(child: LoadingScreen())
            else if (state.status == WalletStatus.error)
              SliverFillRemaining(
                child: ErrorScreen(
                  errorMessage: state.errorMessage ?? 'An error occurred',
                ),
              )
            else if (state.assets.isEmpty)
              SliverFillRemaining(
                child: Center(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Icon(
                        Icons.account_balance_wallet_outlined,
                        color: AppColors.grey,
                        size: 60,
                      ),
                      const SizedBox(height: 12),
                      Text(
                        'No assets yet.',
                        textAlign: TextAlign.center,
                        style: TextStyle(color: AppColors.grey, fontSize: 15),
                      ),
                    ],
                  ),
                ),
              )
            else
              SliverList(
                delegate: SliverChildBuilderDelegate((ctx, i) {
                  final asset = state.assets[i];
                  return Column(
                    children: [
                      AssetListTile(
                        asset: asset,
                        onLongPress: () => _confirmDelete(context, asset.id!),
                      ),
                      if (i < state.assets.length - 1)
                        Divider(
                          color: AppColors.overlay50,
                          height: 1,
                          indent: 20,
                          endIndent: 20,
                        ),
                    ],
                  );
                }, childCount: state.assets.length),
              ),
          ],
        );
      },
    );
  }

  Widget _buildHeader(WalletState state) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(22, 24, 22, 4),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Current Balance',
                style: TextStyle(color: AppColors.grey, fontSize: 14),
              ),
            ],
          ),
          const SizedBox(height: 8),
          Text(
            _fmt(state.totalBalance),
            style: TextStyle(
              color: AppColors.white,
              fontSize: 34,
              fontWeight: FontWeight.bold,
              letterSpacing: -1,
            ),
          ),
          const SizedBox(height: 4),
          Text(
            '\$${_fmt(state.totalUsd)}',
            style: TextStyle(color: AppColors.grey, fontSize: 15),
          ),
          const SizedBox(height: 24),
        ],
      ),
    );
  }

  Widget _buildActionButtons() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 22),
      child: Container(
        height: 48,
        decoration: BoxDecoration(
          color: AppColors.darkSurface,
          borderRadius: BorderRadius.circular(14),
        ),
        child: Row(
          children: [
            _actionBtn('Deposit', active: true),
            _actionBtn('Withdraw'),
            _actionBtn('Transfer'),
          ],
        ),
      ),
    );
  }

  Widget _actionBtn(String label, {bool active = false}) {
    return Expanded(
      child: GestureDetector(
        onTap: () {},
        child: Container(
          decoration: BoxDecoration(
            color: active ? AppColors.primary : Colors.transparent,
            borderRadius: BorderRadius.circular(12),
          ),
          margin: const EdgeInsets.all(4),
          alignment: Alignment.center,
          child: Text(
            label,
            style: TextStyle(
              color: active ? AppColors.black : AppColors.white,
              fontWeight: FontWeight.w700,
              fontSize: 14,
            ),
          ),
        ),
      ),
    );
  }

  Future<void> _confirmDelete(BuildContext context, int id) async {
    final confirmed = await showDialog<bool>(
      context: context,
      builder: (ctx) => AlertDialog(
        backgroundColor: AppColors.darkSurface,
        title: Text('Delete Asset', style: TextStyle(color: AppColors.white)),
        content: Text(
          'Remove this asset from your wallet?',
          style: TextStyle(color: AppColors.grey),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(ctx, false),
            child: Text('Cancel', style: TextStyle(color: AppColors.white)),
          ),
          TextButton(
            onPressed: () => Navigator.pop(ctx, true),
            child: Text('Delete', style: TextStyle(color: AppColors.error)),
          ),
        ],
      ),
    );
    if (confirmed == true) {
      context.read<WalletCubit>().deleteAsset(id);
    }
  }

  String _fmt(double v) => v
      .toStringAsFixed(2)
      .replaceAllMapped(RegExp(r'(\d)(?=(\d{3})+\.)'), (m) => '${m[1]},');
}
