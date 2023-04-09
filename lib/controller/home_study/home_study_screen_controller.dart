import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:kentei_quiz/controller/quiz_item/quiz_item_state.dart';
import 'package:state_notifier/state_notifier.dart';

import 'home_study_screen_state.dart';

final homeStudyScreenControllerProvider =
    StateNotifierProvider<HomeStudyScreenController, HomeStudyScreenState>(
  (ref) => throw UnimplementedError(),
);

class HomeStudyScreenController extends StateNotifier<HomeStudyScreenState>
    with LocatorMixin {
  HomeStudyScreenController({required this.ref, required this.item})
      : super(const HomeStudyScreenState()) {
    initState();
  }

  final Ref ref;

  final QuizItemState item;

  // @override
  // void initState() {
  //   super.initState();
  // }
}
