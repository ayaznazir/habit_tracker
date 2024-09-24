import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../shared/constants/app_colors.dart';
import '../../../../shared/constants/app_constants.dart';

class AddHabitController extends GetxController {
  final titleController = TextEditingController();
  final descriptionController = TextEditingController();
  
  final selectedEmoji = ''.obs;
  final selectedColor = AppColors.habitColors[0].obs;
  final selectedFrequency = 'Daily'.obs;
  final selectedCategory = 'Other'.obs;
  
  final titleError = ''.obs;
  final descriptionError = ''.obs;
  final emojiError = ''.obs;
  
  final isLoading = false.obs;

  @override
  void onInit() {
    super.onInit();
    selectedEmoji.value = AppConstants.habitEmojis[0];
  }

  @override
  void onClose() {
    titleController.dispose();
    descriptionController.dispose();
    super.onClose();
  }

  void selectEmoji(String emoji) {
    selectedEmoji.value = emoji;
    emojiError.value = '';
  }

  void selectColor(Color color) {
    selectedColor.value = color;
  }

  void selectFrequency(String frequency) {
    selectedFrequency.value = frequency;
  }

  void selectCategory(String category) {
    selectedCategory.value = category;
  }

  bool validateForm() {
    bool isValid = true;
    
    // Clear previous errors
    titleError.value = '';
    descriptionError.value = '';
    emojiError.value = '';

    // Title validation
    if (titleController.text.trim().isEmpty) {
      titleError.value = 'Habit title is required';
      isValid = false;
    } else if (titleController.text.trim().length < 3) {
      titleError.value = 'Title must be at least 3 characters';
      isValid = false;
    }

    // Emoji validation
    if (selectedEmoji.value.isEmpty) {
      emojiError.value = 'Please select an emoji';
      isValid = false;
    }

    return isValid;
  }

  Future<void> saveHabit() async {
    if (!validateForm()) return;

    isLoading.value = true;

    // Simulate API call
    await Future.delayed(const Duration(seconds: 2));

    isLoading.value = false;

    // Show success message
    Get.snackbar(
      'Success',
      'Habit created successfully!',
      backgroundColor: AppColors.success,
      colorText: Colors.white,
      snackPosition: SnackPosition.TOP,
    );

    // Navigate back
    Get.back();
  }

  void cancel() {
    Get.back();
  }
} 