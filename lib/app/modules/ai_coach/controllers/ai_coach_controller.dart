import 'package:get/get.dart';
import 'package:flutter/material.dart';

class ChatMessage {
  final String id;
  final String text;
  final bool isUser;
  final DateTime timestamp;

  ChatMessage({
    required this.id,
    required this.text,
    required this.isUser,
    required this.timestamp,
  });
}

class AiCoachController extends GetxController {
  final messages = <ChatMessage>[].obs;
  final messageController = TextEditingController();
  final isLoading = false.obs;

  @override
  void onInit() {
    super.onInit();
    _loadInitialMessages();
  }

  @override
  void onClose() {
    messageController.dispose();
    super.onClose();
  }

  void _loadInitialMessages() {
    messages.addAll([
      ChatMessage(
        id: '1',
        text: 'Hello! I\'m your AI habit coach. I\'m here to help you build better habits and stay motivated. How can I assist you today?',
        isUser: false,
        timestamp: DateTime.now().subtract(const Duration(minutes: 5)),
      ),
      ChatMessage(
        id: '2',
        text: 'I want to start a new habit but I\'m not sure where to begin.',
        isUser: true,
        timestamp: DateTime.now().subtract(const Duration(minutes: 4)),
      ),
      ChatMessage(
        id: '3',
        text: 'Great question! Starting a new habit can be overwhelming. Let\'s break it down:\n\n1. Start small - choose something you can do in 2 minutes or less\n2. Make it specific - instead of "exercise more", try "do 10 push-ups"\n3. Stack it - attach it to an existing habit\n4. Track it - use the app to monitor your progress\n\nWhat type of habit are you thinking about?',
        isUser: false,
        timestamp: DateTime.now().subtract(const Duration(minutes: 3)),
      ),
    ]);
  }

  Future<void> sendMessage() async {
    final text = messageController.text.trim();
    if (text.isEmpty) return;

    // Add user message
    final userMessage = ChatMessage(
      id: DateTime.now().millisecondsSinceEpoch.toString(),
      text: text,
      isUser: true,
      timestamp: DateTime.now(),
    );
    messages.add(userMessage);
    messageController.clear();

    // Simulate AI response
    isLoading.value = true;
    await Future.delayed(const Duration(seconds: 2));

    final aiResponse = _generateAiResponse(text);
    final aiMessage = ChatMessage(
      id: (DateTime.now().millisecondsSinceEpoch + 1).toString(),
      text: aiResponse,
      isUser: false,
      timestamp: DateTime.now(),
    );
    messages.add(aiMessage);
    isLoading.value = false;
  }

  String _generateAiResponse(String userMessage) {
    final lowerMessage = userMessage.toLowerCase();
    
    if (lowerMessage.contains('motivation') || lowerMessage.contains('motivated')) {
      return 'Motivation is like a muscle - it needs to be exercised regularly! Here are some tips:\n\n• Remember your "why" - why did you start this habit?\n• Celebrate small wins - every step counts\n• Use the 2-minute rule - if it takes less than 2 minutes, do it now\n• Create a supportive environment\n\nWhat\'s your main motivation for building this habit?';
    } else if (lowerMessage.contains('exercise') || lowerMessage.contains('workout')) {
      return 'Exercise is a fantastic habit! Here\'s how to make it stick:\n\n• Start with just 5 minutes a day\n• Choose activities you actually enjoy\n• Schedule it at the same time daily\n• Prepare your workout clothes the night before\n• Track your progress in the app\n\nWhat type of exercise interests you most?';
    } else if (lowerMessage.contains('sleep') || lowerMessage.contains('bedtime')) {
      return 'Good sleep habits are crucial! Try these strategies:\n\n• Set a consistent bedtime and wake time\n• Create a relaxing bedtime routine\n• Avoid screens 1 hour before bed\n• Keep your bedroom cool and dark\n• Avoid caffeine after 2 PM\n\nHow\'s your current sleep schedule?';
    } else if (lowerMessage.contains('stress') || lowerMessage.contains('anxiety')) {
      return 'Managing stress is so important for building good habits. Here are some techniques:\n\n• Practice deep breathing exercises\n• Try meditation or mindfulness\n• Take regular breaks throughout the day\n• Exercise regularly (even just walking)\n• Maintain a gratitude journal\n\nWhat\'s causing you the most stress right now?';
    } else {
      return 'That\'s a great question! Building habits is all about consistency and starting small. Here are some general tips:\n\n• Start with one habit at a time\n• Make it so small it\'s almost impossible to fail\n• Track your progress daily\n• Don\'t break the chain - try to do it every day\n• Be patient with yourself - habits take time to form\n\nWhat specific habit are you working on? I\'d love to help you create a plan!';
    }
  }
} 