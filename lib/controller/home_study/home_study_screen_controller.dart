import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:state_notifier/state_notifier.dart';

import 'home_study_screen_state.dart';

final homeStudyScreenProvider =
    StateNotifierProvider<HomeStudyScreenController, HomeStudyScreenState>(
  (ref) => HomeStudyScreenController(ref: ref),
);

class HomeStudyScreenController extends StateNotifier<HomeStudyScreenState>
    with LocatorMixin {
  HomeStudyScreenController({required this.ref})
      : super(const HomeStudyScreenState()) {
    initState();
  }

  final Ref ref;

  @override
  void initState() {
    super.initState();
  }
}
