import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/auth_controller.dart';
import '../../../../shared/constants/app_colors.dart';
import '../../../../shared/widgets/neumorphic_button.dart';

class AuthView extends GetView<AuthController> {
  const AuthView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: AppColors.backgroundGradient,
        ),
        child: SafeArea(
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(24.0),
            child: Column(
              children: [
                const SizedBox(height: 40),
                
                // App Logo
                Container(
                  width: 80,
                  height: 80,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    gradient: AppColors.primaryGradient,
                    boxShadow: [
                      BoxShadow(
                        color: AppColors.primary.withOpacity(0.3),
                        offset: const Offset(0, 8),
                        blurRadius: 24,
                      ),
                    ],
                  ),
                  child: const Center(
                    child: Text(
                      '🧠',
                      style: TextStyle(fontSize: 32),
                    ),
                  ),
                ),
                
                const SizedBox(height: 24),
                
                // Title
                Obx(() => Text(
                  controller.isSignIn.value ? 'Welcome Back' : 'Create Account',
                  style: const TextStyle(
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                    color: AppColors.textPrimary,
                  ),
                )),
                
                const SizedBox(height: 8),
                
                // Subtitle
                Obx(() => Text(
                  controller.isSignIn.value 
                      ? 'Sign in to continue your habit journey'
                      : 'Start building better habits today',
                  style: const TextStyle(
                    fontSize: 16,
                    color: AppColors.textSecondary,
                  ),
                )),
                
                const SizedBox(height: 40),
                
                // Google Sign In Button
                NeumorphicButton(
                  text: 'Continue with Google',
                  onPressed: controller.signInWithGoogle,
                  width: double.infinity,
                  icon: Icons.g_mobiledata,
                  color: AppColors.textPrimary,
                ),
                
                const SizedBox(height: 24),
                
                // Divider
                Row(
                  children: [
                    const Expanded(child: Divider()),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      child: Text(
                        'or',
                        style: TextStyle(
                          color: AppColors.textSecondary,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                    const Expanded(child: Divider()),
                  ],
                ),
                
                const SizedBox(height: 24),
                
                // Form
                _buildForm(),
                
                const SizedBox(height: 24),
                
                // Submit Button
                Obx(() => NeumorphicButton(
                  text: controller.isSignIn.value ? 'Sign In' : 'Sign Up',
                  onPressed: controller.isSignIn.value 
                      ? controller.signIn 
                      : controller.signUp,
                  width: double.infinity,
                  isLoading: controller.isLoading.value,
                  icon: controller.isSignIn.value 
                      ? Icons.login 
                      : Icons.person_add,
                )),
                
                const SizedBox(height: 24),
                
                // Toggle Auth Mode
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Obx(() => Text(
                      controller.isSignIn.value 
                          ? "Don't have an account? " 
                          : 'Already have an account? ',
                      style: const TextStyle(
                        color: AppColors.textSecondary,
                      ),
                    )),
                    Obx(() => TextButton(
                      onPressed: controller.toggleAuthMode,
                      child: Text(
                        controller.isSignIn.value ? 'Sign Up' : 'Sign In',
                        style: const TextStyle(
                          color: AppColors.primary,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    )),
                  ],
                ),
                
                const SizedBox(height: 40),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildForm() {
    return Column(
      children: [
        // Name Field (only for sign up)
        Obx(() => controller.isSignIn.value 
            ? const SizedBox()
            : Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Full Name',
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                      color: AppColors.textPrimary,
                    ),
                  ),
                  const SizedBox(height: 8),
                  TextField(
                    controller: controller.nameController,
                    decoration: InputDecoration(
                      hintText: 'Enter your full name',
                      prefixIcon: const Icon(Icons.person_outline),
                      errorText: controller.nameError.value.isEmpty 
                          ? null 
                          : controller.nameError.value,
                    ),
                  ),
                  const SizedBox(height: 16),
                ],
              )),
        
        // Email Field
        const Text(
          'Email',
          style: TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w600,
            color: AppColors.textPrimary,
          ),
        ),
        const SizedBox(height: 8),
        TextField(
          controller: controller.emailController,
          keyboardType: TextInputType.emailAddress,
          decoration: InputDecoration(
            hintText: 'Enter your email',
            prefixIcon: const Icon(Icons.email_outlined),
            errorText: controller.emailError.value.isEmpty 
                ? null 
                : controller.emailError.value,
          ),
        ),
        
        const SizedBox(height: 16),
        
        // Password Field
        const Text(
          'Password',
          style: TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w600,
            color: AppColors.textPrimary,
          ),
        ),
        const SizedBox(height: 8),
        Obx(() => TextField(
          controller: controller.passwordController,
          obscureText: controller.obscurePassword.value,
          decoration: InputDecoration(
            hintText: 'Enter your password',
            prefixIcon: const Icon(Icons.lock_outline),
            suffixIcon: IconButton(
              icon: Icon(
                controller.obscurePassword.value 
                    ? Icons.visibility_outlined
                    : Icons.visibility_off_outlined,
              ),
              onPressed: controller.togglePasswordVisibility,
            ),
            errorText: controller.passwordError.value.isEmpty 
                ? null 
                : controller.passwordError.value,
          ),
        )),
      ],
    );
  }
} 