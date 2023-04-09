import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:kentei_quiz/firebase_options.dart';
import 'package:kentei_quiz/view/app.dart';
import 'package:stack_trace/stack_trace.dart' as stack_trace;

Future main() async {
  // Firebase初期化
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  //なんかわからん
  FlutterError.demangleStackTrace = (StackTrace stack) {
    if (stack is stack_trace.Trace) {
      return stack.vmTrace;
    }
    if (stack is stack_trace.Chain) {
      return stack.toTrace().vmTrace;
    }
    return stack;
  };

  //アプリ実行
  runApp(const QuizApp());
}
