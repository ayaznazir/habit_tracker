class AppConstants {
  // App Info
  static const String appName = 'HabitMind';
  static const String appVersion = '1.0.0';
  
  // Animation Durations
  static const Duration shortAnimation = Duration(milliseconds: 200);
  static const Duration mediumAnimation = Duration(milliseconds: 300);
  static const Duration longAnimation = Duration(milliseconds: 500);
  
  // Spacing
  static const double xsSpacing = 4.0;
  static const double smSpacing = 8.0;
  static const double mdSpacing = 16.0;
  static const double lgSpacing = 24.0;
  static const double xlSpacing = 32.0;
  static const double xxlSpacing = 48.0;
  
  // Border Radius
  static const double xsRadius = 4.0;
  static const double smRadius = 8.0;
  static const double mdRadius = 12.0;
  static const double lgRadius = 16.0;
  static const double xlRadius = 24.0;
  static const double xxlRadius = 32.0;
  
  // Elevation
  static const double xsElevation = 1.0;
  static const double smElevation = 2.0;
  static const double mdElevation = 4.0;
  static const double lgElevation = 8.0;
  static const double xlElevation = 16.0;
  
  // Habit Frequencies
  static const List<String> habitFrequencies = [
    'Daily',
    'Weekly',
    'Monthly',
    'Custom',
  ];
  
  // Habit Categories
  static const List<String> habitCategories = [
    'Health & Fitness',
    'Productivity',
    'Learning',
    'Mindfulness',
    'Social',
    'Finance',
    'Creativity',
    'Other',
  ];
  
  // Habit Emojis
  static const List<String> habitEmojis = [
    '🏃‍♂️', '💪', '🧘‍♀️', '📚', '💡', '🎯', '💰', '🎨',
    '🏋️‍♂️', '🚴‍♀️', '🏊‍♂️', '🧠', '💻', '✍️', '🎵', '🌱',
    '☀️', '🌙', '💧', '🥗', '🍎', '💊', '🧴', '🪥',
    '📱', '📖', '✏️', '🎪', '🎭', '🎬', '📷', '🎮',
  ];
  
  // AI Tips
  static const List<String> aiTips = [
    'Start with small, achievable goals to build momentum.',
    'Track your progress daily to stay motivated.',
    'Pair new habits with existing routines for better success.',
    'Celebrate small wins to maintain motivation.',
    'Focus on consistency rather than perfection.',
    'Use positive reinforcement to strengthen habits.',
    'Create a supportive environment for your habits.',
    'Review and adjust your habits regularly.',
  ];
  
  // Onboarding Content
  static const List<Map<String, String>> onboardingContent = [
    {
      'title': 'Welcome to HabitMind',
      'subtitle': 'Your personal habit companion',
      'description': 'Build lasting habits with beautiful tracking and AI-powered insights.',
      'emoji': '🧠',
    },
    {
      'title': 'Track Your Progress',
      'subtitle': 'Visualize your journey',
      'description': 'See your progress with beautiful charts and streak counters.',
      'emoji': '📊',
    },
    {
      'title': 'AI-Powered Insights',
      'subtitle': 'Get personalized guidance',
      'description': 'Receive smart tips and motivation from your AI coach.',
      'emoji': '🤖',
    },
    {
      'title': 'Build Better Habits',
      'subtitle': 'Start your transformation',
      'description': 'Ready to create positive changes in your life?',
      'emoji': '✨',
    },
  ];
} 