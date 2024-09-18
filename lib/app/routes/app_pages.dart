import 'package:get/get.dart';
import '../modules/welcome/views/welcome_view.dart';
import '../modules/auth/views/auth_view.dart';
import '../modules/onboarding/views/onboarding_view.dart';
import '../modules/dashboard/views/dashboard_view.dart';
import '../modules/habit_detail/views/habit_detail_view.dart';
import '../modules/add_habit/views/add_habit_view.dart';
import '../modules/calendar/views/calendar_view.dart';
import '../modules/profile/views/profile_view.dart';
import '../modules/settings/views/settings_view.dart';
import '../modules/ai_coach/views/ai_coach_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.WELCOME;

  static final routes = [
    GetPage(
      name: Routes.WELCOME,
      page: () => const WelcomeView(),
      transition: Transition.fadeIn,
    ),
    GetPage(
      name: Routes.AUTH,
      page: () => const AuthView(),
      transition: Transition.fadeIn,
    ),
    GetPage(
      name: Routes.ONBOARDING,
      page: () => const OnboardingView(),
      transition: Transition.fadeIn,
    ),
    GetPage(
      name: Routes.DASHBOARD,
      page: () => const DashboardView(),
      transition: Transition.fadeIn,
    ),
    GetPage(
      name: Routes.HABIT_DETAIL,
      page: () => const HabitDetailView(),
      transition: Transition.rightToLeft,
    ),
    GetPage(
      name: Routes.ADD_HABIT,
      page: () => const AddHabitView(),
      transition: Transition.rightToLeft,
    ),
    GetPage(
      name: Routes.CALENDAR,
      page: () => const CalendarView(),
      transition: Transition.fadeIn,
    ),
    GetPage(
      name: Routes.PROFILE,
      page: () => const ProfileView(),
      transition: Transition.fadeIn,
    ),
    GetPage(
      name: Routes.SETTINGS,
      page: () => const SettingsView(),
      transition: Transition.rightToLeft,
    ),
    GetPage(
      name: Routes.AI_COACH,
      page: () => const AiCoachView(),
      transition: Transition.rightToLeft,
    ),
  ];
} 