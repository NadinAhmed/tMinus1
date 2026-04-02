import 'package:flutter/material.dart';

import '../../../core/theme/app_colors.dart';
import '../settings_item_model.dart';

class SettingsItem extends StatelessWidget {
  final SettingsItemModel item;
  final bool showDivider;

  const SettingsItem({
    super.key,
    required this.item,
    this.showDivider = true,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        InkWell(
          onTap: item.onTap,
          borderRadius: BorderRadius.circular(12),
          splashColor: AppColors.primary.withOpacity(0.08),
          highlightColor: AppColors.primary.withOpacity(0.04),
          child: Padding(
            padding: const EdgeInsetsDirectional.symmetric(horizontal: 20, vertical: 18),
            child: Row(
              children: [
                Icon(
                  item.icon,
                  color: AppColors.primary,
                  size: 22,
                ),
                const SizedBox(width: 16),

                Expanded(
                  child: Text(
                    item.title,
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                      color: AppColors.white,
                    ),
                  ),
                ),

                if (item.trailingText != null) ...[
                  Text(
                    item.trailingText!,
                    style: const TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                      color: AppColors.grey,
                    ),
                  ),
                  const SizedBox(width: 6),
                ],

                const Icon(
                  Icons.arrow_forward,
                  color: AppColors.grey,
                  size: 18,
                ),
              ],
            ),
          ),
        ),

        if (showDivider)
          const Divider(
            color: AppColors.overlay50,
            height: 1,
            thickness: 1,
            indent: 20,
            endIndent: 20,
          ),
      ],
    );
  }
}
