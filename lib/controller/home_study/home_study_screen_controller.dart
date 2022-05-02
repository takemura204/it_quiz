import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:state_notifier/state_notifier.dart';

import 'home_study_screen_state.dart';

final homeStudyScreenControllerProvider =
    StateNotifierProvider<HomeStudyScreenController, HomeStudyScreenState>(
  (ref) => HomeStudyScreenController(ref: ref),
);

class HomeStudyScreenController extends StateNotifier<HomeStudyScreenState>
    with LocatorMixin {
  HomeStudyScreenController({required this.ref})
      : super(const HomeStudyScreenState());

  final Ref ref;

  @override
  void dispose() {
    super.dispose();
  }

  void onTapItem(int id) {
    print(id);
  }
}
