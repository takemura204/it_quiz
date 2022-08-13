import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:kentei_quiz/firebase_options.dart';
import 'package:kentei_quiz/view/app.dart';

Future main() async {
  // Firebase初期化
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  //アプリ実行
  runApp(const QuizApp());
}
