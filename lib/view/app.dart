import 'package:device_preview_screenshot/device_preview_screenshot.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
// import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:kentei_quiz/model/lang/initial_resource.dart';
import 'package:kentei_quiz/model/user/user.model.dart';

import '../controller/setting_color/setting_color_controller.dart';
import '../screen/home_root_screen/home_root_screen.dart';

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

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

class _App extends ConsumerWidget {
  const _App();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final themeId = ref.watch(userModelProvider).themeId;
    final themeData =
        ref.read(settingColorProvider.notifier).loadTheme(themeId);
    return MaterialApp(
      //右上のdebugラベルを消す
      debugShowCheckedModeBanner: false,
      // DevicePreviewに必要
      // useInheritedMediaQuery: true,
      locale: DevicePreview.locale(context),
      builder: DevicePreview.appBuilder,

      ///他言語対応(毎回エラー出て面倒のためコメントアウト)
      // localizationsDelegates: AppLocalizations.localizationsDelegates,
      // supportedLocales: AppLocalizations.supportedLocales,

      title: I18n().appName,
      //デフォルト設定
      theme: themeData,
      darkTheme: themeData,
      // home: const HomeRootScreen(),
      home: StreamBuilder<User?>(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            // ローディング画面を表示
            return const CircularProgressIndicator();
          }
          if (snapshot.hasData) {
            // ユーザーがサインインしている場合の画面
            return const HomeRootScreen();
          } else {
            // ユーザーがサインインしていない場合の画面
            return const HomeRootScreen();
          }
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
