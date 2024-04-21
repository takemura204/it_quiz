import 'package:device_preview_screenshot/device_preview_screenshot.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:kentei_quiz/model/lang/initial_resource.dart';
import 'package:kentei_quiz/model/user/auth_model.dart';

import '../controller/setting_color/setting_color_controller.dart';
import '../screen/main_screen/main_screen.dart';

class MyApp extends StatelessWidget {
  const MyApp();

  @override
  Widget build(BuildContext context) {
    ///開発環境
    // return DevicePreview(
    //   enabled: !kReleaseMode,
    //   builder: (context) => const ProviderScope(
    //     child: _App(),
    //   ),
    //   tools: const [
    //     ...DevicePreview.defaultTools,
    //     DevicePreviewScreenshot(),
    //   ],
    // );
    ///リリース環境
    return const ProviderScope(
      child: _MaterialApp(),
    );
  }
}

class _MaterialApp extends ConsumerWidget {
  const _MaterialApp();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final themeId = ref.watch(authModelProvider).themeId;
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
      home: const MainScreen(),
    );
  }
}
