import 'package:flutter/material.dart';
import 'quiz.dart';

void main() {
  runApp(const QuizApp());
}

class QuizApp extends StatelessWidget {
  const QuizApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Quiz App',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color(0xFF6A4CFF),
        ),
        scaffoldBackgroundColor: const Color(0xFFF5F3FF),
      ),
      home: const Quiz(),
    );
  }
}