import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:webview_flutter/webview_flutter.dart';

import '../setting_contact/setting_contact_state.dart';

final settingAboutAppProvider =
    StateNotifierProvider<SettingAboutAppController, SettingContactState>(
        (ref) => SettingAboutAppController(ref: ref));

class SettingAboutAppController extends StateNotifier<SettingContactState> {
  SettingAboutAppController({required this.ref})
      : super(const SettingContactState());

  final Ref ref;

  final userPolicyWebViewController = WebViewController()
    ..setJavaScriptMode(JavaScriptMode.unrestricted)
    ..loadRequest(Uri.parse(
        'https://plucky-laugh-5de.notion.site/fa92543c55634514b10e177827679675?pvs=4'));
  final privacyPolicyWebViewController = WebViewController()
    ..setJavaScriptMode(JavaScriptMode.unrestricted)
    ..loadRequest(Uri.parse(
        'https://plucky-laugh-5de.notion.site/9dac9d65f24d49dd886c9303892a1cd2?pvs=4'));

  Future setLoading(bool value) async {
    state = state.copyWith(isLoading: value);
  }
}
