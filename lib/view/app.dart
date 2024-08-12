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
    return const ProviderScope(
      child: _MaterialApp(),
    );
  }
}

class _MaterialApp extends ConsumerWidget {
  const _MaterialApp();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final themeId = ref.watch(authModelProvider.select((s) => s.themeId));
    final themeData = ref.read(settingColorProvider.notifier).loadTheme(themeId);

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      locale: DevicePreview.locale(context),
      builder: DevicePreview.appBuilder,
      title: I18n().appName,
      theme: themeData,
      darkTheme: themeData,
      home: const MainScreen(),
    );
  }
}
