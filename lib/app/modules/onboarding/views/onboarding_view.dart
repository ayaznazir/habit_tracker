import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/onboarding_controller.dart';
import '../../../../shared/constants/app_colors.dart';
import '../../../../shared/widgets/neumorphic_button.dart';

class OnboardingView extends GetView<OnboardingController> {
  const OnboardingView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: AppColors.backgroundGradient,
        ),
        child: SafeArea(
          child: Column(
            children: [
              // Skip Button
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    TextButton(
                      onPressed: controller.skipOnboarding,
                      child: const Text(
                        'Skip',
                        style: TextStyle(
                          color: AppColors.textSecondary,
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              
              // Page View
              Expanded(
                child: PageView.builder(
                  controller: controller.pageController,
                  onPageChanged: controller.onPageChanged,
                  itemCount: controller.onboardingContent.length,
                  itemBuilder: (context, index) {
                    final content = controller.onboardingContent[index];
                    return _OnboardingSlide(
                      title: content['title']!,
                      subtitle: content['subtitle']!,
                      description: content['description']!,
                      emoji: content['emoji']!,
                    );
                  },
                ),
              ),
              
              // Bottom Section
              Padding(
                padding: const EdgeInsets.all(24.0),
                child: Column(
                  children: [
                    // Page Indicators
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: List.generate(
                        controller.onboardingContent.length,
                        (index) => Obx(() => Container(
                          margin: const EdgeInsets.symmetric(horizontal: 4),
                          width: controller.currentPage.value == index ? 24 : 8,
                          height: 8,
                          decoration: BoxDecoration(
                            color: controller.currentPage.value == index
                                ? AppColors.primary
                                : AppColors.textTertiary,
                            borderRadius: BorderRadius.circular(4),
                          ),
                        )),
                      ),
                    ),
                    
                    const SizedBox(height: 32),
                    
                    // Navigation Buttons
                    Row(
                      children: [
                        // Previous Button
                        Obx(() => controller.currentPage.value > 0
                            ? Expanded(
                                child: NeumorphicButton(
                                  text: 'Previous',
                                  onPressed: controller.previousPage,
                                  isOutlined: true,
                                  icon: Icons.arrow_back,
                                ),
                              )
                            : const Expanded(child: SizedBox())),
                        
                        const SizedBox(width: 16),
                        
                        // Next/Get Started Button
                        Expanded(
                          flex: 2,
                          child: Obx(() => NeumorphicButton(
                            text: controller.currentPage.value == 
                                controller.onboardingContent.length - 1
                                ? 'Get Started'
                                : 'Next',
                            onPressed: controller.nextPage,
                            icon: controller.currentPage.value == 
                                controller.onboardingContent.length - 1
                                ? Icons.rocket_launch
                                : Icons.arrow_forward,
                          )),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _OnboardingSlide extends StatelessWidget {
  final String title;
  final String subtitle;
  final String description;
  final String emoji;

  const _OnboardingSlide({
    required this.title,
    required this.subtitle,
    required this.description,
    required this.emoji,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(24.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // Emoji Icon
          Container(
            width: 120,
            height: 120,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(60),
              gradient: AppColors.primaryGradient,
              boxShadow: [
                BoxShadow(
                  color: AppColors.primary.withOpacity(0.3),
                  offset: const Offset(0, 8),
                  blurRadius: 24,
                ),
              ],
            ),
            child: Center(
              child: Text(
                emoji,
                style: const TextStyle(fontSize: 48),
              ),
            ),
          ),
          
          const SizedBox(height: 48),
          
          // Title
          Text(
            title,
            textAlign: TextAlign.center,
            style: const TextStyle(
              fontSize: 28,
              fontWeight: FontWeight.bold,
              color: AppColors.textPrimary,
            ),
          ),
          
          const SizedBox(height: 8),
          
          // Subtitle
          Text(
            subtitle,
            textAlign: TextAlign.center,
            style: const TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w600,
              color: AppColors.primary,
            ),
          ),
          
          const SizedBox(height: 24),
          
          // Description
          Text(
            description,
            textAlign: TextAlign.center,
            style: const TextStyle(
              fontSize: 16,
              color: AppColors.textSecondary,
              height: 1.6,
            ),
          ),
        ],
      ),
    );
  }
} 