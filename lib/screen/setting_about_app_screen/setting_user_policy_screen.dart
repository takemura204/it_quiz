import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:kentei_quiz/controller/setting_about_app/setting_abaout_app_controller.dart';
import 'package:kentei_quiz/model/extension_resource.dart';
import 'package:webview_flutter/webview_flutter.dart';

import '../../view/button_icon/cutom_back_button.dart';

///利用規約
class SettingUserPolicyScreen extends ConsumerWidget {
  const SettingUserPolicyScreen();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final controller =
        ref.read(settingAboutAppProvider.notifier).userPolicyWebViewController
          ..setNavigationDelegate(
            NavigationDelegate(
              onProgress: (int progress) {
                //進行状況の更新（例えばプログレスバーの更新）に使用
              },
              onPageStarted: (String url) {
                ref.read(settingAboutAppProvider.notifier).setLoading(true);
              },
              onPageFinished: (String url) {
                ref.read(settingAboutAppProvider.notifier).setLoading(false);
              },
              onWebResourceError: (WebResourceError error) {
                // ウェブリソースの読み込み中にエラーが発生した場
              },
              onNavigationRequest: (NavigationRequest request) {
                // 特定のURL（例：YouTubeのリンク）をブロックするなどのカスタムナビゲーションロジックを実装
                if (request.url.startsWith('https://www.youtube.com/')) {
                  return NavigationDecision.prevent;
                }
                return NavigationDecision.navigate;
              },
            ),
          );
    final isLoading = ref.watch(settingAboutAppProvider).isLoading;

    return Scaffold(
      appBar: AppBar(
        titleSpacing: 0,
        centerTitle: true,
        automaticallyImplyLeading: false,
        title: const Text("利用規約"),
        leading: CustomBackButton(onPressed: () {
          Navigator.pop(context);
        }),
      ),
      body: isLoading
          ? Center(
              child: SpinKitFadingCircle(
                color: context.mainColor,
                size: context.height * 0.1,
              ),
            )
          : WebViewWidget(controller: controller),
    );
  }
}
