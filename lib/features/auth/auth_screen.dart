import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:tminus1/core/widgets/app_background.dart';
import 'package:tminus1/core/widgets/build_text_field.dart';
import 'package:tminus1/core/widgets/primary_button.dart';
import 'package:tminus1/features/auth/widgets/auth_toggle.dart';
import 'package:tminus1/features/auth/widgets/social_button.dart';

import '../../core/routing/routes.dart';
import '../../core/theme/app_colors.dart';

class AuthScreen extends StatefulWidget {
  const AuthScreen({super.key});

  @override
  State<AuthScreen> createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  bool _obscurePassword = true;

  @override
  Widget build(BuildContext context) {
    return AppBackground(
      child: SingleChildScrollView(
        padding: const EdgeInsetsDirectional.symmetric(
          horizontal: 24,
          vertical: 46,
        ),
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              AuthToggle(
                initialIndex: 1, // 0 = Sign in | 1 = Sign up
                onChanged: (index) {
                  // index == 0 → change to Sign in
                  // index == 1 → change to Sign up
                  debugPrint(index == 0 ? 'Sign in' : 'Sign up');
                },
              ),
              const SizedBox(height: 40),
              const Text(
                'Sign up',
                style: TextStyle(
                  fontSize: 32,
                  fontWeight: FontWeight.w700,
                  color: AppColors.white,
                  letterSpacing: -0.5,
                ),
              ),
              const SizedBox(height: 36),
              const Text(
                'Email',
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                  color: AppColors.lightGrey,
                ),
              ),
              const SizedBox(height: 10),
          
              BuildTextField(
                controller: _emailController,
                hint: 'Please enter email',
                keyboardType: TextInputType.emailAddress,
              ),
              const SizedBox(height: 24),
          
              const Text(
                'Password',
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                  color: AppColors.lightGrey,
                ),
              ),
              const SizedBox(height: 10),
          
              BuildTextField(
                controller: _passwordController,
                hint: 'Please enter password',
                obscureText: _obscurePassword,
                suffix: GestureDetector(
                  onTap: () => setState(() => _obscurePassword = !_obscurePassword),
                  child: Icon(
                    _obscurePassword
                        ? Icons.visibility_off_outlined
                        : Icons.visibility_outlined,
                    color: AppColors.grey,
                    size: 22,
                  ),
                ),
              ),
              const SizedBox(height: 36),
          
              PrimaryButton(text: "Sign Up", onClick: () {
                Navigator.pushReplacementNamed(context, Routes.mainLayout);
              }),
              const SizedBox(height: 28),
          
              Row(
                children: [
                  Expanded(
                    child: Divider(color: AppColors.grey, thickness: 1),
                  ),
                  const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 16),
                    child: Text(
                      'Or login with',
                      style: TextStyle(fontSize: 13, color: AppColors.grey),
                    ),
                  ),
                  Expanded(
                    child: Divider(color: AppColors.grey, thickness: 1),
                  ),
                ],
              ),
              const SizedBox(height: 24),
          
              // ── Social Buttons ──
              Row(
                children: [
                  Expanded(
                    child: SocialButton(
                      label: 'Facebook',
                      icon: SvgPicture.asset("assets/icons/facebook.svg"),
                      onTap: () {},
                    ),
                  ),
                  const SizedBox(width: 16),
                  Expanded(
                    child: SocialButton(
                      label: 'Google',
                      icon: SvgPicture.asset("assets/icons/google.svg"),
                      onTap: () {},
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
