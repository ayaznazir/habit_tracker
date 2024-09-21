import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../routes/app_pages.dart';

class AuthController extends GetxController {
  final isSignIn = true.obs;
  final isLoading = false.obs;
  final obscurePassword = true.obs;
  
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final nameController = TextEditingController();
  
  final emailError = ''.obs;
  final passwordError = ''.obs;
  final nameError = ''.obs;

  @override
  void onClose() {
    emailController.dispose();
    passwordController.dispose();
    nameController.dispose();
    super.onClose();
  }

  void toggleAuthMode() {
    isSignIn.value = !isSignIn.value;
    clearErrors();
  }

  void togglePasswordVisibility() {
    obscurePassword.value = !obscurePassword.value;
  }

  void clearErrors() {
    emailError.value = '';
    passwordError.value = '';
    nameError.value = '';
  }

  bool validateForm() {
    clearErrors();
    bool isValid = true;

    // Email validation
    if (emailController.text.isEmpty) {
      emailError.value = 'Email is required';
      isValid = false;
    } else if (!GetUtils.isEmail(emailController.text)) {
      emailError.value = 'Please enter a valid email';
      isValid = false;
    }

    // Password validation
    if (passwordController.text.isEmpty) {
      passwordError.value = 'Password is required';
      isValid = false;
    } else if (passwordController.text.length < 6) {
      passwordError.value = 'Password must be at least 6 characters';
      isValid = false;
    }

    // Name validation for sign up
    if (!isSignIn.value && nameController.text.isEmpty) {
      nameError.value = 'Name is required';
      isValid = false;
    }

    return isValid;
  }

  Future<void> signIn() async {
    if (!validateForm()) return;

    isLoading.value = true;
    
    // Simulate API call
    await Future.delayed(const Duration(seconds: 2));
    
    isLoading.value = false;
    
    // For demo purposes, always succeed
    Get.offAllNamed(Routes.DASHBOARD);
  }

  Future<void> signUp() async {
    if (!validateForm()) return;

    isLoading.value = true;
    
    // Simulate API call
    await Future.delayed(const Duration(seconds: 2));
    
    isLoading.value = false;
    
    // For demo purposes, always succeed
    Get.offAllNamed(Routes.DASHBOARD);
  }

  Future<void> signInWithGoogle() async {
    isLoading.value = true;
    
    // Simulate API call
    await Future.delayed(const Duration(seconds: 2));
    
    isLoading.value = false;
    
    // For demo purposes, always succeed
    Get.offAllNamed(Routes.DASHBOARD);
  }
} 