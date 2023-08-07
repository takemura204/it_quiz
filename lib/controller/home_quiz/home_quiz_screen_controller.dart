import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:state_notifier/state_notifier.dart';

import 'home_quiz_screen_state.dart';

final homeQuizScreenProvider =
    StateNotifierProvider<HomeQuizScreenController, HomeQuizScreenState>(
  (ref) => HomeQuizScreenController(ref: ref),
);

class HomeQuizScreenController extends StateNotifier<HomeQuizScreenState>
    with LocatorMixin {
  HomeQuizScreenController({required this.ref})
      : super(const HomeQuizScreenState()) {
    initState();
  }

  final Ref ref;

  @override
  void initState() {
    super.initState();
  }
}
