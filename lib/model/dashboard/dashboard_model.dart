import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:state_notifier/state_notifier.dart';

import '../quiz/quiz.dart';
import '../quiz/quiz_model.dart';
import 'dashboard.dart';

final dashboardModelProvider = StateNotifierProvider<DashboardModel, Dashboard>(
  (ref) => DashboardModel(ref),
);

class DashboardModel extends StateNotifier<Dashboard> with LocatorMixin {
  DashboardModel(this.ref) : super(Dashboard()) {
    initState();
  }

  final Ref ref;

  @override
  Future initState() async {
    // _resetData();
    await _loadQuizData(); // データを読み込む
    super.initState();
  }

  ///読み込み
  Future _loadQuizData() async {
    final List<Quiz> quizList = ref.read(quizModelProvider).historyQuizList;
    final today = DateTime.now();
    Duration todayDuration = Duration.zero;
    int todayQuizCount = 0;

    Duration allDuration = Duration.zero;
    int allQuizCount = 0;

    for (var quiz in quizList) {
      if (quiz.timeStamp?.day == today.day &&
          quiz.timeStamp?.month == today.month &&
          quiz.timeStamp?.year == today.year) {
        todayDuration += quiz.duration;
        todayQuizCount += quiz.quizItemList.length;
      }

      allDuration += quiz.duration;
      allQuizCount += quiz.quizItemList.length;
    }

    state = state.copyWith(
      quizList: quizList,
      todayDuration: todayDuration,
      allDuration: allDuration,
      todayQuizCount: todayQuizCount,
      allQuizCount: allQuizCount,
    );
  }
}
