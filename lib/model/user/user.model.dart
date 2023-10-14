import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:kentei_quiz/model/user/user.dart';
import 'package:state_notifier/state_notifier.dart';

final userModelProvider = StateNotifierProvider<UserModel, User>(
  (ref) => UserModel(ref),
);

class UserModel extends StateNotifier<User> with LocatorMixin {
  UserModel(this.ref) : super(User()) {
    initState();
  }

  final Ref ref;

  @override
  Future initState() async {
    // _resetData();
    super.initState();
  }

  void updateDailyQuizCountGoal(int value) {
    state = state.copyWith(
      userCustom: state.userCustom.copyWith(dailyQuizCountGoal: value),
    );
    print(state.userCustom.dailyQuizCountGoal);
  }

  void updateDailyDurationGoal(Duration value) {
    state = state.copyWith(
      userCustom: state.userCustom.copyWith(dailyDurationGoal: value),
    );
  }
}
