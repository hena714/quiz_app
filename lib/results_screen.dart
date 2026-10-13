import 'package:flutter/material.dart';
import 'data/questions.dart';
import 'questions_summary.dart';

class ResultsScreen extends StatelessWidget {
  const ResultsScreen({
    super.key,
    required this.userAnswers,
    required this.onRestart,
  });

  final List<String> userAnswers;
  final VoidCallback onRestart;

  @override
  Widget build(BuildContext context) {
    final correctAnswers = List.generate(
      questions.length,
      (index) => index, 
    ).where(
      (index) => userAnswers[index] == questions[index].answers[0],
    ).length;

    final percentage =
    (correctAnswers / questions.length * 100).round();

    return Padding(
      padding: const EdgeInsets.all(20),
      child: Column(
        children: [
          const SizedBox(height: 16),
          const Icon(
            Icons.emoji_events_rounded,
            size: 64,
            color: Color(0xFF6A4CFF),
          ),
          const SizedBox(height: 12),
          const Text(
            'Výsledky kvízu',
            style: TextStyle(
              fontSize: 28,
              fontWeight: FontWeight.bold,
              color: Color(0xFF30245C),
            ),
          ),
          const SizedBox(height: 12),
          Text(
            'Správne si odpovedal na $correctAnswers '
            'z ${questions.length} otázok.',
            textAlign: TextAlign.center,
            style: const TextStyle(fontSize: 17),
          ),
          const SizedBox(height: 8),
          Text(
            '$percentage % úspešnosť',
            style: const TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.bold,
              color: Color(0xFF6A4CFF),
            ),
          ),
          const SizedBox(height: 20),
          Expanded(
            child: SingleChildScrollView(
              child: QuestionsSummary(
                userAnswers: userAnswers,
              ),
            ),
          ),
          const SizedBox(height: 12),
          SizedBox(
            width: double.infinity,
            child: ElevatedButton.icon(
              onPressed: onRestart,
              icon: const Icon(Icons.refresh),
              label: const Text('Restart Quiz'),
              style: ElevatedButton.styleFrom(
                padding: const EdgeInsets.symmetric(vertical: 16),
                backgroundColor: const Color(0xFF6A4CFF),
                foregroundColor: Colors.white,
              ),
            ),
          ),
        ],
      ),
    );
  }
}