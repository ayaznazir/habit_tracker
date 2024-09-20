import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../routes/app_pages.dart';
import '../../../../shared/constants/app_colors.dart';
import '../../../../shared/constants/app_constants.dart';
import '../../../../shared/widgets/neumorphic_button.dart';

class WelcomeView extends StatelessWidget {
  const WelcomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: AppColors.backgroundGradient,
        ),
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(24.0),
            child: Column(
              children: [
                const Spacer(),
                
                // App Logo and Title
                Container(
                  padding: const EdgeInsets.all(32),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(24),
                    gradient: AppColors.primaryGradient,
                    boxShadow: [
                      BoxShadow(
                        color: AppColors.primary.withOpacity(0.3),
                        offset: const Offset(0, 8),
                        blurRadius: 24,
                      ),
                    ],
                  ),
                  child: Column(
                    children: [
                      const Text(
                        '🧠',
                        style: TextStyle(fontSize: 64),
                      ),
                      const SizedBox(height: 16),
                      Text(
                        AppConstants.appName,
                        style: const TextStyle(
                          fontSize: 32,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                      const SizedBox(height: 8),
                      const Text(
                        'Your personal habit companion',
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.white70,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                ),
                
                const SizedBox(height: 48),
                
                // Welcome Text
                const Text(
                  'Build lasting habits with beautiful tracking and AI-powered insights',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 18,
                    color: AppColors.textSecondary,
                    height: 1.5,
                  ),
                ),
                
                const Spacer(),
                
                // Action Buttons
                Column(
                  children: [
                    NeumorphicButton(
                      text: 'Get Started',
                      onPressed: () => Get.offAllNamed(Routes.ONBOARDING),
                      width: double.infinity,
                      icon: Icons.arrow_forward,
                    ),
                    const SizedBox(height: 16),
                    NeumorphicButton(
                      text: 'Sign In',
                      onPressed: () => Get.offAllNamed(Routes.AUTH),
                      width: double.infinity,
                      isOutlined: true,
                      icon: Icons.login,
                    ),
                  ],
                ),
                
                const SizedBox(height: 32),
              ],
            ),
          ),
        ),
      ),
    );
  }
} 