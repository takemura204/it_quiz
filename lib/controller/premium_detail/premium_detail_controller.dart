import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:kentei_quiz/controller/premium_detail/premium_detail_state.dart';

final premiumDetailProvider =
    StateNotifierProvider<PremiumDetailController, PremiumDetailState>(
        (ref) => PremiumDetailController(ref: ref));

class PremiumDetailController extends StateNotifier<PremiumDetailState> {
  PremiumDetailController({required this.ref})
      : super(const PremiumDetailState());

  final Ref ref;
}
