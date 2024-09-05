import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:gap/gap.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:kentei_quiz/controller/home_quiz/home_quiz_screen_controller.dart';
import 'package:kentei_quiz/model/extension_resource.dart';
import 'package:kentei_quiz/model/user/auth_model.dart';
import 'package:kentei_quiz/view/modals/quiz_modal/quiz_modal.dart';
import 'package:kentei_quiz/view/modals/weak_modal.dart';
import 'package:line_icons/line_icons.dart';

import '../../model/lang/initial_resource.dart';
import '../../model/quiz/quiz.dart';
import '../../model/quiz/quiz_model.dart';
import '../../model/quiz/quizzes.dart';
import '../../untils/enums.dart';
import '../../view/button/animation_shadow_button.dart';
import '../../view/button/defalut_button.dart';
import '../../view/button/primary_button.dart';
import '../../view/chart/progress_crilcle_chart.dart';
import '../../view/modals/need_premium_modal/premium_quiz_modal.dart';
import '../../view/modals/randam_modal.dart';
import '../screen_argument.dart';

part 'widget/app_bar.dart';
part 'widget/body.dart';
part 'widget/fotter.dart';
part 'widget/quiz_card.dart';
part 'widget/quiz_list.dart';

class HomeQuizScreen extends HookConsumerWidget {
  const HomeQuizScreen();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isLoading = ref.watch(homeQuizScreenProvider).isLoading;
    if (isLoading) {
      return Center(
        child: SpinKitFadingCircle(
          color: context.mainColor,
          size: context.height * 0.1,
        ),
      );
    }

    final categoryList = ref.watch(homeQuizScreenProvider).categoryList;
    final tabController = useTabController(initialLength: categoryList.length);

    useEffect(() {
      void handleTabChange() {
        ref.read(homeQuizScreenProvider.notifier).setTabIndex(tabController.index);
      }

      tabController.addListener(handleTabChange);
      return () => tabController.removeListener(handleTabChange);
    }, [tabController]);

    return DefaultTabController(
      initialIndex: 0, // 最初に表示するタブ
      length: categoryList.length, // タブの数
      child: Scaffold(
        appBar: _AppBar(
          categoryList: categoryList,
          tabController: tabController,
        ),
        body: _Body(
          categoryList: categoryList,
          tabController: tabController,
        ),
      ),
    );
  }
}
