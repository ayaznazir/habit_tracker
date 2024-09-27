import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../shared/constants/app_colors.dart';

class CalendarView extends StatelessWidget {
  const CalendarView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Calendar'),
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: Container(
        decoration: const BoxDecoration(
          gradient: AppColors.backgroundGradient,
        ),
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Month Header
              _buildMonthHeader(),
              
              const SizedBox(height: 24),
              
              // Calendar Grid
              _buildCalendarGrid(),
              
              const SizedBox(height: 24),
              
              // Legend
              _buildLegend(),
              
              const SizedBox(height: 24),
              
              // Stats
              _buildStats(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildMonthHeader() {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        gradient: AppColors.primaryGradient,
        boxShadow: [
          BoxShadow(
            color: AppColors.primary.withOpacity(0.3),
            offset: const Offset(0, 8),
            blurRadius: 24,
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.chevron_left, color: Colors.white),
          ),
          const Column(
            children: [
              Text(
                'December 2024',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                'Track your habit progress',
                style: TextStyle(
                  color: Colors.white70,
                  fontSize: 14,
                ),
              ),
            ],
          ),
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.chevron_right, color: Colors.white),
          ),
        ],
      ),
    );
  }

  Widget _buildCalendarGrid() {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        color: AppColors.surface,
        boxShadow: [
          BoxShadow(
            color: AppColors.textTertiary.withOpacity(0.1),
            offset: const Offset(0, 4),
            blurRadius: 12,
          ),
        ],
      ),
      child: Column(
        children: [
          // Day headers
          Row(
            children: ['S', 'M', 'T', 'W', 'T', 'F', 'S'].map((day) {
              return Expanded(
                child: Container(
                  padding: const EdgeInsets.symmetric(vertical: 8),
                  child: Text(
                    day,
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      fontWeight: FontWeight.w600,
                      color: AppColors.textSecondary,
                    ),
                  ),
                ),
              );
            }).toList(),
          ),
          
          const SizedBox(height: 8),
          
          // Calendar days
          GridView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 7,
              childAspectRatio: 1,
              crossAxisSpacing: 4,
              mainAxisSpacing: 4,
            ),
            itemCount: 35, // 5 weeks
            itemBuilder: (context, index) {
              final day = index - 3; // Adjust for first week
              final isCurrentMonth = day > 0 && day <= 31;
              final isToday = day == 15; // Mock today
              final completionLevel = _getCompletionLevel(day);
              
              if (!isCurrentMonth) {
                return Container();
              }
              
              return GestureDetector(
                onTap: () => _showDayDetails(day),
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    color: _getDayColor(completionLevel, isToday),
                    border: isToday
                        ? Border.all(color: AppColors.primary, width: 2)
                        : null,
                  ),
                  child: Center(
                    child: Text(
                      '$day',
                      style: TextStyle(
                        color: isToday ? AppColors.primary : AppColors.textPrimary,
                        fontWeight: isToday ? FontWeight.bold : FontWeight.w500,
                      ),
                    ),
                  ),
                ),
              );
            },
          ),
        ],
      ),
    );
  }

  Widget _buildLegend() {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        color: AppColors.surface,
        boxShadow: [
          BoxShadow(
            color: AppColors.textTertiary.withOpacity(0.1),
            offset: const Offset(0, 4),
            blurRadius: 12,
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Legend',
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w600,
              color: AppColors.textPrimary,
            ),
          ),
          const SizedBox(height: 12),
          Row(
            children: [
              _buildLegendItem('No activity', AppColors.surfaceVariant),
              const SizedBox(width: 16),
              _buildLegendItem('Low', AppColors.success.withOpacity(0.3)),
              const SizedBox(width: 16),
              _buildLegendItem('Medium', AppColors.success.withOpacity(0.6)),
              const SizedBox(width: 16),
              _buildLegendItem('High', AppColors.success),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildLegendItem(String label, Color color) {
    return Row(
      children: [
        Container(
          width: 16,
          height: 16,
          decoration: BoxDecoration(
            color: color,
            borderRadius: BorderRadius.circular(4),
          ),
        ),
        const SizedBox(width: 4),
        Text(
          label,
          style: const TextStyle(
            fontSize: 12,
            color: AppColors.textSecondary,
          ),
        ),
      ],
    );
  }

  Widget _buildStats() {
    return Row(
      children: [
        Expanded(
          child: _buildStatCard(
            title: 'Days Active',
            value: '24',
            icon: Icons.calendar_today,
            color: AppColors.primary,
          ),
        ),
        const SizedBox(width: 12),
        Expanded(
          child: _buildStatCard(
            title: 'Best Streak',
            value: '7',
            icon: Icons.local_fire_department,
            color: AppColors.warning,
          ),
        ),
        const SizedBox(width: 12),
        Expanded(
          child: _buildStatCard(
            title: 'Completion Rate',
            value: '85%',
            icon: Icons.trending_up,
            color: AppColors.success,
          ),
        ),
      ],
    );
  }

  Widget _buildStatCard({
    required String title,
    required String value,
    required IconData icon,
    required Color color,
  }) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        color: AppColors.surface,
        boxShadow: [
          BoxShadow(
            color: AppColors.textTertiary.withOpacity(0.1),
            offset: const Offset(0, 4),
            blurRadius: 12,
          ),
        ],
      ),
      child: Column(
        children: [
          Icon(
            icon,
            color: color,
            size: 24,
          ),
          const SizedBox(height: 8),
          Text(
            value,
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: color,
            ),
          ),
          const SizedBox(height: 4),
          Text(
            title,
            style: const TextStyle(
              fontSize: 12,
              color: AppColors.textSecondary,
            ),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }

  int _getCompletionLevel(int day) {
    // Mock completion levels
    if (day % 7 == 0) return 0; // No activity on Sundays
    if (day % 3 == 0) return 3; // High activity
    if (day % 2 == 0) return 2; // Medium activity
    return 1; // Low activity
  }

  Color _getDayColor(int completionLevel, bool isToday) {
    switch (completionLevel) {
      case 0:
        return AppColors.surfaceVariant;
      case 1:
        return AppColors.success.withOpacity(0.3);
      case 2:
        return AppColors.success.withOpacity(0.6);
      case 3:
        return AppColors.success;
      default:
        return AppColors.surfaceVariant;
    }
  }

  void _showDayDetails(int day) {
    Get.dialog(
      AlertDialog(
        title: Text('December $day, 2024'),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text('Habits completed:'),
            const SizedBox(height: 8),
            _buildHabitItem('🏃‍♂️ Morning Exercise', true),
            _buildHabitItem('📚 Read Books', false),
            _buildHabitItem('🧘‍♀️ Meditation', true),
            _buildHabitItem('💧 Drink Water', true),
            _buildHabitItem('💻 Learn Coding', false),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () => Get.back(),
            child: const Text('Close'),
          ),
        ],
      ),
    );
  }

  Widget _buildHabitItem(String habit, bool completed) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Row(
        children: [
          Icon(
            completed ? Icons.check_circle : Icons.circle_outlined,
            color: completed ? AppColors.success : AppColors.textTertiary,
            size: 16,
          ),
          const SizedBox(width: 8),
          Text(
            habit,
            style: TextStyle(
              color: completed ? AppColors.textPrimary : AppColors.textSecondary,
              decoration: completed ? null : TextDecoration.lineThrough,
            ),
          ),
        ],
      ),
    );
  }
} 