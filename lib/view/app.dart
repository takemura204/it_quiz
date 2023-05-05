import 'package:device_preview_screenshot/device_preview_screenshot.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
// import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:kentei_quiz/resource/lang/initial_resource.dart';

import '../resource/widget/theme_resource.dart';
import '../screen/home_root_screen/home_root_screen.dart';

class QuizApp extends StatelessWidget {
  const QuizApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //デバイスのレイアウトを確認
    return DevicePreview(
      enabled: !kReleaseMode,
      builder: (context) => const ProviderScope(
        child: _App(),
      ),
      tools: const [
        ...DevicePreview.defaultTools,
        DevicePreviewScreenshot(),
      ],
    );
  }
}

class _App extends StatelessWidget {
  const _App();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      //右上のdebugラベルを消す
      debugShowCheckedModeBanner: false,
      // DevicePreviewに必要
      useInheritedMediaQuery: true,
      locale: DevicePreview.locale(context),
      builder: DevicePreview.appBuilder,

      ///他言語対応(毎回エラー出て面倒のためコメントアウト)
      // localizationsDelegates: AppLocalizations.localizationsDelegates,
      // supportedLocales: AppLocalizations.supportedLocales,

      title: I18n().appName,
      //デフォルト設定
      theme: DefaultTheme.getDefaultTheme(Brightness.light),
      darkTheme: DefaultTheme.getDefaultTheme(Brightness.light),

      home: StreamBuilder<User?>(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            // スプラッシュ画面などに書き換えても良い
            return const SizedBox();
          }
          if (snapshot.hasData) {
            // User が null でなない、つまりサインイン済みのホーム画面へ
            return const HomeRootScreen();
          }
          // User が null である、つまり未サインインのサインイン画面へ
          return const HomeRootScreen();
        },
      ),
    );
  }
}

class SignInPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) => const Scaffold(
        body: Center(
          child: Text('未サインイン時に表示するサインイン画面です。'),
        ),
      );
}

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) => const Scaffold(
        body: Center(
          child: Text('サインイン済み時に表示するホーム画面です。'),
        ),
      );
}
