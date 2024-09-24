import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/add_habit_controller.dart';
import '../../../../shared/constants/app_colors.dart';
import '../../../../shared/constants/app_constants.dart';
import '../../../../shared/widgets/neumorphic_button.dart';

class AddHabitView extends GetView<AddHabitController> {
  const AddHabitView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add New Habit'),
        leading: IconButton(
          icon: const Icon(Icons.close),
          onPressed: controller.cancel,
        ),
        actions: [
          Obx(() => TextButton(
            onPressed: controller.isLoading.value ? null : controller.saveHabit,
            child: controller.isLoading.value
                ? const SizedBox(
                    width: 16,
                    height: 16,
                    child: CircularProgressIndicator(strokeWidth: 2),
                  )
                : const Text(
                    'Save',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
          )),
        ],
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
              // Emoji Selection
              _buildEmojiSection(),
              
              const SizedBox(height: 24),
              
              // Color Selection
              _buildColorSection(),
              
              const SizedBox(height: 24),
              
              // Form Fields
              _buildFormSection(),
              
              const SizedBox(height: 24),
              
              // Frequency Selection
              _buildFrequencySection(),
              
              const SizedBox(height: 24),
              
              // Category Selection
              _buildCategorySection(),
              
              const SizedBox(height: 32),
              
              // Save Button
              NeumorphicButton(
                text: 'Create Habit',
                onPressed: controller.saveHabit,
                width: double.infinity,
                isLoading: controller.isLoading.value,
                icon: Icons.add_task,
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildEmojiSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Choose an Emoji',
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w600,
            color: AppColors.textPrimary,
          ),
        ),
        const SizedBox(height: 12),
        Obx(() => Text(
          controller.emojiError.value,
          style: const TextStyle(
            color: AppColors.error,
            fontSize: 12,
          ),
        )),
        const SizedBox(height: 8),
        Container(
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
          child: GridView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 8,
              crossAxisSpacing: 8,
              mainAxisSpacing: 8,
            ),
            itemCount: AppConstants.habitEmojis.length,
            itemBuilder: (context, index) {
              final emoji = AppConstants.habitEmojis[index];
              final isSelected = controller.selectedEmoji.value == emoji;
              
              return GestureDetector(
                onTap: () => controller.selectEmoji(emoji),
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    color: isSelected 
                        ? controller.selectedColor.value.withOpacity(0.2)
                        : AppColors.surfaceVariant,
                    border: isSelected
                        ? Border.all(
                            color: controller.selectedColor.value,
                            width: 2,
                          )
                        : null,
                  ),
                  child: Center(
                    child: Text(
                      emoji,
                      style: const TextStyle(fontSize: 20),
                    ),
                  ),
                ),
              );
            },
          ),
        ),
      ],
    );
  }

  Widget _buildColorSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Choose a Color',
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w600,
            color: AppColors.textPrimary,
          ),
        ),
        const SizedBox(height: 12),
        Container(
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
          child: GridView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 8,
              crossAxisSpacing: 8,
              mainAxisSpacing: 8,
            ),
            itemCount: AppColors.habitColors.length,
            itemBuilder: (context, index) {
              final color = AppColors.habitColors[index];
              final isSelected = controller.selectedColor.value == color;
              
              return GestureDetector(
                onTap: () => controller.selectColor(color),
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    color: color,
                    border: isSelected
                        ? Border.all(color: Colors.white, width: 3)
                        : null,
                    boxShadow: isSelected
                        ? [
                            BoxShadow(
                              color: color.withOpacity(0.5),
                              offset: const Offset(0, 4),
                              blurRadius: 12,
                            ),
                          ]
                        : null,
                  ),
                  child: isSelected
                      ? const Icon(
                          Icons.check,
                          color: Colors.white,
                          size: 20,
                        )
                      : null,
                ),
              );
            },
          ),
        ),
      ],
    );
  }

  Widget _buildFormSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Habit Details',
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w600,
            color: AppColors.textPrimary,
          ),
        ),
        const SizedBox(height: 16),
        
        // Title Field
        const Text(
          'Habit Title',
          style: TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w600,
            color: AppColors.textPrimary,
          ),
        ),
        const SizedBox(height: 8),
        TextField(
          controller: controller.titleController,
          decoration: InputDecoration(
            hintText: 'e.g., Morning Exercise',
            prefixIcon: const Icon(Icons.edit),
            errorText: controller.titleError.value.isEmpty 
                ? null 
                : controller.titleError.value,
          ),
        ),
        
        const SizedBox(height: 16),
        
        // Description Field
        const Text(
          'Description (Optional)',
          style: TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w600,
            color: AppColors.textPrimary,
          ),
        ),
        const SizedBox(height: 8),
        TextField(
          controller: controller.descriptionController,
          maxLines: 3,
          decoration: const InputDecoration(
            hintText: 'Add a description for your habit...',
            prefixIcon: Icon(Icons.description),
          ),
        ),
      ],
    );
  }

  Widget _buildFrequencySection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Frequency',
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w600,
            color: AppColors.textPrimary,
          ),
        ),
        const SizedBox(height: 12),
        Container(
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
          child: Obx(() => Column(
            children: AppConstants.habitFrequencies.map((frequency) {
              final isSelected = controller.selectedFrequency.value == frequency;
              
              return ListTile(
                leading: Radio<String>(
                  value: frequency,
                  groupValue: controller.selectedFrequency.value,
                  onChanged: (value) => controller.selectFrequency(value!),
                  activeColor: controller.selectedColor.value,
                ),
                title: Text(
                  frequency,
                  style: TextStyle(
                    fontWeight: isSelected ? FontWeight.w600 : FontWeight.w400,
                    color: isSelected ? controller.selectedColor.value : AppColors.textPrimary,
                  ),
                ),
                onTap: () => controller.selectFrequency(frequency),
              );
            }).toList(),
          )),
        ),
      ],
    );
  }

  Widget _buildCategorySection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Category',
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w600,
            color: AppColors.textPrimary,
          ),
        ),
        const SizedBox(height: 12),
        Container(
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
          child: Obx(() => Column(
            children: AppConstants.habitCategories.map((category) {
              final isSelected = controller.selectedCategory.value == category;
              
              return ListTile(
                leading: Radio<String>(
                  value: category,
                  groupValue: controller.selectedCategory.value,
                  onChanged: (value) => controller.selectCategory(value!),
                  activeColor: controller.selectedColor.value,
                ),
                title: Text(
                  category,
                  style: TextStyle(
                    fontWeight: isSelected ? FontWeight.w600 : FontWeight.w400,
                    color: isSelected ? controller.selectedColor.value : AppColors.textPrimary,
                  ),
                ),
                onTap: () => controller.selectCategory(category),
              );
            }).toList(),
          )),
        ),
      ],
    );
  }
} 