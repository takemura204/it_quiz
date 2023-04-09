import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class HomeTestScreen extends StatelessWidget {
  const HomeTestScreen();

  @override
  Widget build(BuildContext context) {
    final FirebaseFirestore _fireStore = FirebaseFirestore.instance;
    final CollectionReference _quiz = _fireStore.collection('quiz');

    return Center(
      child: Column(
        children: const [
          _GetQuizWidget(),
          // QuizList(),
          // const Spacer(),
          // GestureDetector(
          //   onTap: () async {
          //     addQuiz();
          //   },
          //   child: Container(
          //     height: context.height * 0.085,
          //     alignment: Alignment.center,
          //     padding: const EdgeInsets.all(16),
          //     margin: const EdgeInsets.all(20),
          //     decoration: BoxDecoration(
          //       color: Colors.blueAccent.shade200,
          //       border: Border.all(
          //         color: Colors.grey.shade200,
          //       ),
          //       borderRadius: BorderRadius.circular(5),
          //     ),
          //     child: const AutoSizeText(
          //       "テストボタン",
          //       style: TextStyle(
          //         color: Colors.white,
          //         fontWeight: FontWeight.bold,
          //       ),
          //       minFontSize: 16,
          //     ),
          //   ),
          // ),
          // const Spacer(),
        ],
      ),
    );
  }
}

class _GetQuizWidget extends StatelessWidget {
  const _GetQuizWidget();

  @override
  Widget build(BuildContext context) {
    final _fireStore = FirebaseFirestore.instance;
    final _quiz = _fireStore.collection('quiz');
    final _quizStream = _quiz.get();
    // final _quizStream = _quiz.orderBy('ans', descending: true).snapshots();

    Future updateQuiz(String docId) async {
      await _quiz.doc(docId).update({
        "ans": "答えを更新",
        "question": "問題を更新",
      });
    }

    return FutureBuilder(
        future: _quizStream,
        builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
          //データがない場合
          if (snapshot.hasError) {
            return const Text("エラー発生");
          }
          //データはあるが、空の状態の時
          else if (snapshot.hasData && snapshot.data!.docs.isEmpty) {
            return const Text("データがありません。");
          }
          //データが取得が完了した時
          else if (snapshot.connectionState == ConnectionState.waiting) {
            return const CircularProgressIndicator();
          }
          //それ以外の時
          else {
            final docs = snapshot.data!.docs;
            return ListView(
              shrinkWrap: true,
              children: docs.map((doc) {
                final data = doc.data() as Map<String, dynamic>;
                final question = data['question'];
                final ans = data['ans'];
                return ListTile(
                  title: Text(question),
                  subtitle: Text(ans),
                  onTap: () async {
                    await updateQuiz(doc.id);
                  },
                );
              }).toList(),
            );
          }
        });
  }
}

class QuizList extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // final question =　ref.watch(homeTestScreenControllerProvider).quizLearn.question;
    final _fireStore = FirebaseFirestore.instance;
    final _learnQuiz = _fireStore.collection('learnQuiz');
    final _learnQuizStream = _learnQuiz.snapshots();

    return StreamBuilder(
      stream: _learnQuizStream,
      builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
        //データを取得できなかった場合の返り値を指定
        if (snapshot.hasError) {
          return const Center(
            child: Text('取得できませんでした'),
          );
        }
        //取得中の返り値を指定
        if (!snapshot.hasData) {
          return const Center(
            child: Text("Loading"),
          );
        }
        //データを取得できた場合の返り値を指定
        return ListView(
          shrinkWrap: true,
          children: snapshot.data!.docs.map((DocumentSnapshot document) {
            final Map<String, dynamic> data =
                document.data()! as Map<String, dynamic>;

            final quiz1 = data["quiz1"];

            return Card(
              child: ListTile(
                title: Text(data["quiz1"]["ans"]),
                subtitle: Text(quiz1["question"]),
                onTap: () {
                  print(data);
                },
              ),
            );
          }).toList(),
        );
      },
    );
  }
}
