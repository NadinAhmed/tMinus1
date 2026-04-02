import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tminus1/features/settings/settings_item_model.dart';
import 'package:tminus1/features/settings/widgets/settings_item.dart';

import '../../core/theme/app_colors.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  List<SettingsItemModel> _buildItems(BuildContext context) => [
    SettingsItemModel(
      icon: Icons.language_outlined,
      title: 'Language',
      trailingText: 'English',
      onTap: () {},
    ),
    SettingsItemModel(
      icon: Icons.monetization_on_outlined,
      title: 'Currency',
      trailingText: 'USD',
      onTap: () {},
    ),
    SettingsItemModel(
      icon: Icons.brightness_medium_outlined,
      title: 'Appearance',
      trailingText: 'Use Device Settings',
      onTap: () {},
    ),
    SettingsItemModel(
      icon: Icons.tune_outlined,
      title: 'Preference',
      trailingText: 'Customize',
      onTap: () {},
    ),
    SettingsItemModel(
      icon: Icons.people_outline,
      title: 'About Us',
      trailingText: 'v1.2.3',
      onTap: () {},
    ),
  ];

  @override
  Widget build(BuildContext context) {
    final items = _buildItems(context);

    return Scaffold(
      backgroundColor: AppColors.darkBackground,
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsetsDirectional.symmetric(
                horizontal: 8,
                vertical: 8,
              ),
              child: Row(
                children: [
                  IconButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    icon: const Icon(
                      Icons.arrow_back,
                      color: AppColors.white,
                      size: 22,
                    ),
                  ),
                  const SizedBox(width: 4),
                  const Text(
                    'Settings',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w700,
                      color: AppColors.white,
                    ),
                  ),
                ],
              ),
            ),
        
            const SizedBox(height: 8),
        
            ListView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: items.length,
              itemBuilder: (context, index) => SettingsItem(
                item: items[index],
                showDivider: index != items.length - 1,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
