import 'package:hooks_riverpod/hooks_riverpod.dart';
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
    super.initState();
  }
}
