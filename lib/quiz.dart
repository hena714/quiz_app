import 'package:flutter/material.dart';

import 'data/questions.dart';
import 'questions_screen.dart';
import 'results_screen.dart';
import 'start_screen.dart';

class Quiz extends StatefulWidget {
  const Quiz({super.key});

  @override
  State<Quiz> createState() => _QuizState();
}

class _QuizState extends State<Quiz> {
  bool isQuizStarted = false;
  bool isQuizFinished = false;

  int currentQuestionIndex = 0;

  final List<String> selectedAnswers = [];

  void startQuiz() {
    setState(() {
      isQuizStarted = true;
      isQuizFinished = false;
      currentQuestionIndex = 0;
      selectedAnswers.clear();
    });
  }

  void selectAnswer(String answer) {
    setState(() {
      selectedAnswers.add(answer);

      if (selectedAnswers.length == questions.length) {
        isQuizFinished = true;
      } else {
        currentQuestionIndex++;
      }
    });
  }

  void restartQuiz() {
    setState(() {
      isQuizStarted = false;
      isQuizFinished = false;
      currentQuestionIndex = 0;
      selectedAnswers.clear();
    });
  }

  @override
  Widget build(BuildContext context) {
    Widget activeScreen;

    if (!isQuizStarted) {
      activeScreen = StartScreen(
        onStartQuiz: startQuiz,
      );
    } else if (isQuizFinished) {
      activeScreen = ResultsScreen(
        userAnswers: selectedAnswers,
        onRestart: restartQuiz,
      );
    } else {
      activeScreen = QuestionsScreen(
        key: ValueKey(currentQuestionIndex),
        questionIndex: currentQuestionIndex,
        onSelectAnswer: selectAnswer,
      );
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Quiz App',
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
        backgroundColor: const Color(0xFFF5F3FF),
      ),
      body: SafeArea(
        child: activeScreen,
      ),
    );
  }
}