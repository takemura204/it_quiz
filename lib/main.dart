import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:kentei_quiz/firebase_options.dart';
import 'package:kentei_quiz/view/app.dart';

Future main() async {
  // Firebase初期化
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  MobileAds.instance.initialize(); // AdMobの初期化

  //アプリ実行
  runApp(const MyApp());
}
