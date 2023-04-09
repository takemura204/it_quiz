import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:state_notifier/state_notifier.dart';

import 'home_test_screen_state.dart';

final homeTestScreenControllerProvider =
    StateNotifierProvider<HomeTestScreenController, HomeTestScreenState>(
  (ref) => HomeTestScreenController(ref: ref),
);

class HomeTestScreenController extends StateNotifier<HomeTestScreenState>
    with LocatorMixin {
  HomeTestScreenController({required this.ref}) : super(HomeTestScreenState());

  final Ref ref;

  @override
  void initState() {}
}
