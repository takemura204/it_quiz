import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:kentei_quiz/model/extension_resource.dart';
import 'package:webview_flutter/webview_flutter.dart';

import '../../controller/setting_contact/setting_contact_controller.dart';
import '../../view/button_icon/cutom_back_button.dart';

part 'setting_contact_view.dart';

class SettingContactScreen extends ConsumerWidget {
  const SettingContactScreen();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final controller =
        ref.read(settingContactProvider.notifier).webViewController
          ..setNavigationDelegate(
            NavigationDelegate(
              onProgress: (int progress) {
                //進行状況の更新（例えばプログレスバーの更新）に使用
              },
              onPageStarted: (String url) {
                ref.read(settingContactProvider.notifier).setLoading(true);
              },
              onPageFinished: (String url) {
                ref.read(settingContactProvider.notifier).setLoading(false);
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
    final isLoading = ref.watch(settingContactProvider).isLoading;

    return Scaffold(
      appBar: AppBar(
        titleSpacing: 0,
        centerTitle: true,
        automaticallyImplyLeading: false,
        title: const Text("お問い合わせ"),
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
