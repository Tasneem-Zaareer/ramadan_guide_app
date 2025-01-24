import 'package:flutter/material.dart';

class QuizQuestionView extends StatefulWidget {
  const QuizQuestionView({super.key});

  @override
  QuizScreenState createState() => QuizScreenState();
}

class QuizScreenState extends State<QuizQuestionView> {
  int _currentQuestionIndex = 0; // To keep track of the current question
  int? _selectedAnswer; // To store the selected answer

  // Sample Questions and Answers
  final List<Map<String, dynamic>> _questions = [
    {
      'question': 'When does Ramadan begin?',
      'options': [
        'In the 9th month of the Islamic calendar',
        'In the 7th month of the Islamic calendar',
        'On the first day of Shawwal'
      ],
      'answer': 0, // Correct answer index
    },
    {
      'question': 'What is the meal before dawn in Ramadan called?',
      'options': ['Iftar', 'Sahoor', 'Fajr'],
      'answer': 1, // Correct answer index
    },
    {
      'question': 'Which prayer is performed during the month of Ramadan after sunset?',
      'options': ['Fajr', 'Dhuhr', 'Maghrib'],
      'answer': 2, // Correct answer index
    },
  ];

  // Function to handle the Next button click
  void _nextQuestion() {
    if (_selectedAnswer == null) {
      // Show a message if no answer is selected
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Please select an answer!')),
      );
      return;
    }

    if (_currentQuestionIndex < _questions.length - 1) {
      setState(() {
        _currentQuestionIndex++;
        _selectedAnswer = null; // Reset answer for the next question
      });
    } else {
      // If it's the last question, show a result (for now, just a basic message)
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Quiz Finished!')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final question = _questions[_currentQuestionIndex];
    return Scaffold(
      appBar: AppBar(
        title: const Text('Ramadan Quiz'),
        backgroundColor: Colors.amber,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Question Text
            Text(
              question['question'],
              style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 20),
            // Answer Options
            for (int i = 0; i < question['options'].length; i++)
              RadioListTile<int>(
                title: Text(question['options'][i]),
                value: i,
                groupValue: _selectedAnswer,
                onChanged: (value) {
                  setState(() {
                    _selectedAnswer = value;
                  });
                },
              ),
            const SizedBox(height: 20),
            // Next Button
            Center(
              child: ElevatedButton(
                onPressed: _nextQuestion,
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.amber,
                  padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 15),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                child: Text(
                  _currentQuestionIndex < _questions.length - 1 ? 'Next Question' : 'Finish Quiz',
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
