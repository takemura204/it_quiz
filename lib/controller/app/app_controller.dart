import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:state_notifier/state_notifier.dart';

import '../../model/screen_argument_resource.dart';
import 'app_state.dart';

/// アプリ全体に関するもろもろを詰め込む
/// Note: 認証情報はひとつ下のSessionControllerで管理されるため、認証の必要な通信処理をAppController内に書くことはできない
final appControllerProvider = StateNotifierProvider<AppController, AppState>(
    (ref) => AppController(ref: ref));

/// アプリ全体に関するController
/// Note: 認証情報はAppControllerより下の階層で管理されるので、このControllerは認証付きの通信を行えない
class AppController extends StateNotifier<AppState> with LocatorMixin {
  AppController({required this.ref}) : super(AppState());

  final Ref ref;

  Future<T?> showScreen<T>(IScreenArguments<T> arguments) async {
    final navigator = state.navigator;

    return navigator.push(arguments.generateRoute());
  }
}
