import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kentei_quiz/controller/setting_contact/setting_contact_state.dart';
import 'package:kentei_quiz/model/lang/initial_resource.dart';
import 'package:webview_flutter/webview_flutter.dart';

final settingContactProvider =
StateNotifierProvider<SettingContactController, SettingContactState>(
        (ref) => SettingContactController(ref: ref));

class SettingContactController extends StateNotifier<SettingContactState> {
  SettingContactController({required this.ref})
      : super(const SettingContactState());

  final Ref ref;

  final webViewController = WebViewController()
    ..setJavaScriptMode(JavaScriptMode.unrestricted)
    ..loadRequest(Uri.parse(I18n().contactUrl));

  Future setLoading(bool value) async {
    state = state.copyWith(isLoading: value);
  }
}
