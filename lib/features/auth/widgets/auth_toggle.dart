import 'package:animated_toggle_switch/animated_toggle_switch.dart';
import 'package:flutter/material.dart';

import '../../../core/theme/app_colors.dart';

class AuthToggle extends StatefulWidget {
  /// callback return: 0 = Sign in, 1 = Sign up
  final ValueChanged<int>? onChanged;
  final int initialIndex;

  const AuthToggle({
    super.key,
    this.onChanged,
    this.initialIndex = 1,
  });

  @override
  State<AuthToggle> createState() => _AuthToggleState();
}

class _AuthToggleState extends State<AuthToggle> {
  late int _current;

  final List<String> _labels = ['Sign in', 'Sign up'];

  @override
  void initState() {
    super.initState();
    _current = widget.initialIndex;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.darkSurface,
        borderRadius: BorderRadius.circular(15),
      ),
      padding: const EdgeInsets.all(4),
      child: AnimatedToggleSwitch<int>.rolling(
        current: _current,
        values: const [0, 1],
        onChanged: (val) {
          setState(() => _current = val);
          widget.onChanged?.call(val);
        },
        iconBuilder: (val, size) {
          final isSelected = val == _current;
          return Text(
            _labels[val],
            style: TextStyle(
              fontSize: 16,
              fontWeight:
              isSelected ? FontWeight.w500 : FontWeight.w400,
              color: isSelected ? AppColors.white : AppColors.grey,
            ),
          );
        },
        style: ToggleStyle(
          backgroundColor: AppColors.darkSurface,
          indicatorColor: AppColors.darkBackground,
          borderColor: Colors.transparent,
          borderRadius: BorderRadius.circular(15),
          indicatorBorderRadius: BorderRadius.circular(15),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.25),
              blurRadius: 8,
              offset: const Offset(0, 2),
            ),
          ],
        ),
        height: 52,
        indicatorSize: const Size.fromWidth(double.infinity),
        loading: null,
      ),
    );
  }
}