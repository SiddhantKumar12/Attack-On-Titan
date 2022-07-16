import 'package:attack_on_titan/Screen/aot_quiz.dart';
import 'package:attack_on_titan/Screen/quiz_screen.dart';
import 'package:attack_on_titan/widgets/action_button.dart';
import 'package:attack_on_titan/widgets/gradient_box.dart';
import 'package:attack_on_titan/models/question.dart';
import 'package:attack_on_titan/widgets/tab_widgets.dart';
import 'package:flutter/material.dart';

class ResultScreen extends StatelessWidget {
  const ResultScreen({
    Key? key,
    required this.score,
    required this.questions,
    required this.totalTime,
  }) : super(key: key);

  final int score;
  final List<Question> questions;
  final int totalTime;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox.expand(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Result: $score / ${questions.length}',
              style: TextStyle(
                color: Colors.white,
                fontSize: 40,
              ),
            ),
            SizedBox(height: 40),
            ActionButton(
              title: 'Play Again',
              onTap: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => QuizScreen(
                      totalTime: totalTime,
                      questions: questions,
                    ),
                  ),
                );
              },
            ),
            SizedBox(
              height: 10,
            ),
            ActionButton(
              title: 'Home',
              onTap: () {
                Navigator.of(context).pop(
                  MaterialPageRoute(
                    builder: (context) => TabWidget(),
                  ),
                );
              },
            )
          ],
        ),
      ),
    );
  }
}
