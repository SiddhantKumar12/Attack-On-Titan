import 'package:attack_on_titan/Screen/quiz_screen.dart';
import 'package:attack_on_titan/widgets/action_button.dart';
import 'package:attack_on_titan/models/question.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class AotQuiz extends StatelessWidget {
  const AotQuiz({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox.expand(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Most Underrated quiz ever',
              style:
                  Theme.of(context).textTheme.bodyText1!.copyWith(fontSize: 18),
            ),
            SizedBox(height: 40),
            StreamBuilder<QuerySnapshot>(
              stream: FirebaseFirestore.instance
                  .collection('questions')
                  .snapshots(),
              builder: (context, snapshot) {
                if (!snapshot.hasData) {
                  return Center(
                    child: CircularProgressIndicator(),
                  );
                }

                final questionDocs = snapshot.data!.docs;

                final questions = questionDocs
                    .map((e) => Question.fromQueryDocumentSnapshot(e))
                    .toList();

                return StreamBuilder<QuerySnapshot>(
                  stream: FirebaseFirestore.instance
                      .collection('config')
                      .snapshots(),
                  builder: (context, snapshot) {
                    print(snapshot.error);
                    if (!snapshot.hasData) {
                      return Center(
                        child: CircularProgressIndicator(),
                      );
                    }

                    final configDoc = snapshot.data!.docs.first.data()
                        as Map<String, dynamic>;
                    final totalTime = configDoc['key'];

                    return Column(
                      children: [
                        ActionButton(
                          onTap: () {
                            Navigator.of(context).push(
                              MaterialPageRoute(
                                builder: (context) => QuizScreen(
                                  // totalTime: int.parse(totalTime), for firebase type string
                                  totalTime: totalTime,
                                  questions: questions,
                                ),
                              ),
                            );
                          },
                          title: 'Start',
                        ),
                        SizedBox(height: 20),
                        Text(
                          'Total Questions: ${questions.length}',
                          style: Theme.of(context)
                              .textTheme
                              .bodyText1!
                              .copyWith(fontSize: 18),
                        )
                      ],
                    );
                  },
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
