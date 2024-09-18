import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'app/routes/app_pages.dart';
import 'app/themes/app_theme.dart';
import 'app/modules/onboarding/controllers/onboarding_controller.dart';
import 'app/modules/auth/controllers/auth_controller.dart';
import 'app/modules/dashboard/controllers/dashboard_controller.dart';
import 'app/modules/add_habit/controllers/add_habit_controller.dart';
import 'app/modules/ai_coach/controllers/ai_coach_controller.dart';

void main() {
  runApp(const HabitMindApp());
}

class HabitMindApp extends StatelessWidget {
  const HabitMindApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'HabitMind',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.lightTheme,
      darkTheme: AppTheme.darkTheme,
      themeMode: ThemeMode.light,
      
      // Initial route
      initialRoute: AppPages.INITIAL,
      
      // Routes
      getPages: AppPages.routes,
      
      // Initial bindings
      initialBinding: BindingsBuilder(() {
        Get.lazyPut<OnboardingController>(() => OnboardingController());
        Get.lazyPut<AuthController>(() => AuthController());
        Get.lazyPut<DashboardController>(() => DashboardController());
        Get.lazyPut<AddHabitController>(() => AddHabitController());
        Get.lazyPut<AiCoachController>(() => AiCoachController());
      }),
      
      // Default transitions
      defaultTransition: Transition.fadeIn,
      
      // Custom page transitions
      transitionDuration: const Duration(milliseconds: 300),
      
      // Error handling
      onUnknownRoute: (settings) {
        return GetPageRoute(
          page: () => const Scaffold(
            body: Center(
              child: Text('Page not found'),
            ),
          ),
        );
      },
    );
  }
}
