import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tminus1/core/theme/app_colors.dart';

class ActivityScreen extends StatelessWidget {
  const ActivityScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      backgroundColor: AppColors.darkBackground,
      body: const Center(
        child: Text(
          'Activity Screen',
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}
