import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../routes/app_pages.dart';
import '../../../../shared/constants/app_colors.dart';
import '../../../../shared/constants/app_constants.dart';

class Habit {
  final String id;
  final String title;
  final String emoji;
  final Color color;
  final int streak;
  final bool isCompleted;
  final String? subtitle;

  Habit({
    required this.id,
    required this.title,
    required this.emoji,
    required this.color,
    required this.streak,
    required this.isCompleted,
    this.subtitle,
  });
}

class DashboardController extends GetxController {
  final currentIndex = 0.obs;
  final habits = <Habit>[].obs;
  final userName = 'Ayaz'.obs;
  final totalHabits = 0.obs;
  final completedHabits = 0.obs;

  @override
  void onInit() {
    super.onInit();
    _loadMockData();
  }

  void _loadMockData() {
    habits.value = [
      Habit(
        id: '1',
        title: 'Morning Exercise',
        emoji: '🏃‍♂️',
        color: AppColors.habitColors[0],
        streak: 7,
        isCompleted: true,
        subtitle: 'Daily workout routine',
      ),
      Habit(
        id: '2',
        title: 'Read Books',
        emoji: '📚',
        color: AppColors.habitColors[4],
        streak: 12,
        isCompleted: false,
        subtitle: '30 minutes daily',
      ),
      Habit(
        id: '3',
        title: 'Meditation',
        emoji: '🧘‍♀️',
        subtitle: 'Mindfulness practice',
        color: AppColors.habitColors[6],
        streak: 5,
        isCompleted: true,
      ),
      Habit(
        id: '4',
        title: 'Drink Water',
        emoji: '💧',
        color: AppColors.habitColors[8],
        streak: 21,
        isCompleted: false,
        subtitle: '8 glasses daily',
      ),
      Habit(
        id: '5',
        title: 'Learn Coding',
        emoji: '💻',
        color: AppColors.habitColors[10],
        streak: 3,
        isCompleted: true,
        subtitle: '1 hour daily',
      ),
    ];

    _updateStats();
  }

  void _updateStats() {
    totalHabits.value = habits.length;
    completedHabits.value = habits.where((habit) => habit.isCompleted).length;
  }

  void toggleHabit(String habitId) {
    final habitIndex = habits.indexWhere((habit) => habit.id == habitId);
    if (habitIndex != -1) {
      final habit = habits[habitIndex];
      habits[habitIndex] = Habit(
        id: habit.id,
        title: habit.title,
        emoji: habit.emoji,
        color: habit.color,
        streak: habit.isCompleted ? habit.streak : habit.streak + 1,
        isCompleted: !habit.isCompleted,
        subtitle: habit.subtitle,
      );
      _updateStats();
    }
  }

  void navigateToHabitDetail(String habitId) {
    Get.toNamed(Routes.HABIT_DETAIL, arguments: habitId);
  }

  void navigateToAddHabit() {
    Get.toNamed(Routes.ADD_HABIT);
  }

  void navigateToAiCoach() {
    Get.toNamed(Routes.AI_COACH);
  }

  void onBottomNavChanged(int index) {
    currentIndex.value = index;
    switch (index) {
      case 0:
        // Already on dashboard
        break;
      case 1:
        Get.toNamed(Routes.CALENDAR);
        break;
      case 2:
        Get.toNamed(Routes.AI_COACH);
        break;
      case 3:
        Get.toNamed(Routes.PROFILE);
        break;
    }
  }

  String get greeting {
    final hour = DateTime.now().hour;
    if (hour < 12) {
      return 'Good Morning';
    } else if (hour < 17) {
      return 'Good Afternoon';
    } else {
      return 'Good Evening';
    }
  }

  String get randomAiTip {
    final random = DateTime.now().millisecond % AppConstants.aiTips.length;
    return AppConstants.aiTips[random];
  }
} 