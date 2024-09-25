import 'package:flutter/material.dart';
import '../constants/app_colors.dart';

class StreakProgress extends StatelessWidget {
  final int currentStreak;
  final int targetStreak;
  final double size;
  final Color? color;
  final bool showText;

  const StreakProgress({
    super.key,
    required this.currentStreak,
    required this.targetStreak,
    this.size = 80,
    this.color,
    this.showText = true,
  });

  @override
  Widget build(BuildContext context) {
    final progressColor = color ?? AppColors.primary;
    final progress = currentStreak / targetStreak;
    
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Stack(
          alignment: Alignment.center,
          children: [
            // Background Circle
            SizedBox(
              width: size,
              height: size,
              child: CircularProgressIndicator(
                value: 1.0,
                strokeWidth: 8,
                backgroundColor: progressColor.withOpacity(0.2),
                valueColor: AlwaysStoppedAnimation<Color>(progressColor),
              ),
            ),
            
            // Progress Circle
            SizedBox(
              width: size,
              height: size,
              child: CircularProgressIndicator(
                value: progress.clamp(0.0, 1.0),
                strokeWidth: 8,
                backgroundColor: Colors.transparent,
                valueColor: AlwaysStoppedAnimation<Color>(progressColor),
              ),
            ),
            
            // Center Content
            Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  '$currentStreak',
                  style: TextStyle(
                    fontSize: size * 0.25,
                    fontWeight: FontWeight.bold,
                    color: progressColor,
                  ),
                ),
                if (showText) ...[
                  const SizedBox(height: 2),
                  Text(
                    'days',
                    style: TextStyle(
                      fontSize: size * 0.12,
                      color: AppColors.textSecondary,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ],
            ),
          ],
        ),
        
        if (showText) ...[
          const SizedBox(height: 8),
          Text(
            'Target: $targetStreak days',
            style: TextStyle(
              fontSize: 12,
              color: AppColors.textSecondary,
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ],
    );
  }
} 