import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:kentei_quiz/model/rank/rank.dart';
import 'package:kentei_quiz/model/rank/ranks.dart';

part 'rank_resorce.dart';

final rankModelProvider = StateNotifierProvider((ref) => RankModel(ref));

class RankModel extends StateNotifier<Ranks> {
  RankModel(this.ref) : super(Ranks()) {
    () async {
      await initState();
    }();
  }

  final Ref ref;
  Future initState() async {}
}
