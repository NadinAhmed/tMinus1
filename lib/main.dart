import 'package:flutter/material.dart';
import 'package:tminus1/core/di/depedancy_container.dart';
import 'package:tminus1/core/routing/app_router.dart';
import 'package:tminus1/features/settings/settings_screen.dart';
import 'package:tminus1/features/splash_screen.dart';

import 'core/routing/routes.dart';
import 'core/theme/app_colors.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await initDi();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: Routes.splash,
      onGenerateRoute: AppRouter.generateRoute,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: AppColors.primary),
        useMaterial3: true,
        fontFamily: "NeueMontreal",
      ),
    );
  }
}
