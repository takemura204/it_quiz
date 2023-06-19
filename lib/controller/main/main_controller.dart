import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:kentei_quiz/controller/auth/auth_controller.dart';
import 'package:kentei_quiz/controller/quiz_item/quiz_item_controller.dart';
import 'package:kentei_quiz/controller/setting_color/setting_color_controller.dart';
import 'package:state_notifier/state_notifier.dart';

import 'main_state.dart';

final mainProvider = StateNotifierProvider<MainController, MainState>(
  (ref) => MainController(ref: ref),
);

class MainController extends StateNotifier<MainState> with LocatorMixin {
  MainController({required this.ref}) : super(const MainState()) {
    initState();
  }

  final Ref ref;

  @override
  void initState() {
    ref.read(authProvider.notifier).initState();
    ref.read(quizItemProvider.notifier).initState();
    ref.read(settingColorProvider.notifier).initState();
    print("initMainProvider");
    super.initState();
  }
}
