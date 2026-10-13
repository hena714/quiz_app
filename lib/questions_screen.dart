import 'package:flutter/material.dart';
import 'data/questions.dart';
import 'models/answer_button.dart';

class QuestionsScreen extends StatefulWidget {
  const QuestionsScreen({
    super.key,
    required this.questionIndex,
    required this.onSelectAnswer,
  });

  final int questionIndex;
  final void Function(String answer) onSelectAnswer;

  @override
  State<QuestionsScreen> createState() => _QuestionsScreenState();
}

class _QuestionsScreenState extends State<QuestionsScreen> {
  late List<String> shuffledAnswers;

  @override
  void initState() {
    super.initState();
    shuffledAnswers = questions[widget.questionIndex].shuffledAnswers;
  }

  @override
  Widget build(BuildContext context) {
    final currentQuestion = questions[widget.questionIndex];

    return Padding(
      padding: const EdgeInsets.all(24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(
            'OTÁZKA ${widget.questionIndex + 1} Z ${questions.length}',
            textAlign: TextAlign.center,
            style: const TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.bold,
              letterSpacing: 2,
              color: Color(0xFF6A4CFF),
            ),
          ),
          const SizedBox(height: 24),
          LinearProgressIndicator(
            value: (widget.questionIndex + 1) / questions.length,
            minHeight: 8,
            borderRadius: BorderRadius.circular(8),
            backgroundColor: Colors.deepPurple.shade100,
            color: const Color(0xFF6A4CFF),
          ),
          const SizedBox(height: 40),
          Text(
            currentQuestion.text,
            textAlign: TextAlign.center,
            style: const TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: Color(0xFF30245C),
            ),
          ),
          const SizedBox(height: 32),
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  ...shuffledAnswers.map(
                    (answer) => Padding(
                      padding: const EdgeInsets.only(bottom: 12),
                      child: AnswerButton(
                        answer: answer,
                        onTap: () {
                          widget.onSelectAnswer(answer);
                        },
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}