import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:gap/gap.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:kentei_quiz/controller/home_quiz/home_quiz_screen_controller.dart';
import 'package:kentei_quiz/model/extension_resource.dart';
import 'package:kentei_quiz/model/user/auth_model.dart';
import 'package:kentei_quiz/view/modals/weak_modal.dart';
import 'package:line_icons/line_icons.dart';

import '../../model/lang/initial_resource.dart';
import '../../model/quiz/quiz.dart';
import '../../model/quiz/quiz_model.dart';
import '../../model/quiz/quizzes.dart';
import '../../untils/enums.dart';
import '../../view/button/defalut_button.dart';
import '../../view/button/primary_button.dart';
import '../../view/chart/progress_crilcle_chart.dart';
import '../../view/modals/dialog.dart';
import '../../view/modals/randam_modal.dart';
import '../../view/modals/study_modal.dart';
import '../screen_argument.dart';

part 'home_quiz_list.dart';
part 'home_quiz_view.dart';

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
        ref
            .read(homeQuizScreenProvider.notifier)
            .setTabIndex(tabController.index);
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

class _AppBar extends ConsumerWidget implements PreferredSizeWidget {
  const _AppBar({required this.categoryList, required this.tabController});

  final List<String> categoryList;
  final TabController tabController;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final tabIndex = ref.watch(homeQuizScreenProvider).tabIndex;
    return AppBar(
      title: Text(I18n().titleName),
      centerTitle: true,
      actions: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: context.width * 0.01),
          child: IconButton(
            onPressed: () {
              context.showScreen(
                const QuizHistoryScreenArguments().generateRoute(),
              );
            },
            icon: Icon(
              LineIcons.history,
              size: 32,
              color: context.mainColor,
            ),
          ),
        ),
      ],
      bottom: PreferredSize(
        preferredSize:
            const Size.fromHeight(kToolbarHeight + kTextTabBarHeight),
        child: TabBar(
          tabAlignment: TabAlignment.center,
          controller: tabController,
          onTap: (index) =>
              ref.read(homeQuizScreenProvider.notifier).setTabIndex(index),
          isScrollable: true,
          labelColor: context.mainColor,
          labelStyle: const TextStyle(fontWeight: FontWeight.bold),
          unselectedLabelColor: Colors.grey,
          unselectedLabelStyle: const TextStyle(fontWeight: FontWeight.normal),
          tabs: List.generate(
            categoryList.length,
            (index) => Tab(
              child: Container(
                alignment: Alignment.center,
                child: Text(
                  categoryList[index],
                  style: TextStyle(
                    fontWeight:
                        index == tabIndex ? FontWeight.bold : FontWeight.normal,
                    fontSize: 16,
                  ),
                  maxLines: 2, // テキストが多い場合に 2 行まで表示を許可
                  overflow: TextOverflow.ellipsis, // 2 行を超えるテキストは省略記号で表示
                ),
              ),
            ),
          ),
        ),
      ),
      shape: Border(bottom: BorderSide(color: context.mainColor, width: 0)),
    );
  }

  @override
  Size get preferredSize =>
      const Size.fromHeight(kToolbarHeight + kTextTabBarHeight); // 高さを適切に設定
}

class _Body extends ConsumerWidget {
  const _Body({required this.categoryList, required this.tabController});

  final List<String> categoryList;
  final TabController tabController;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(quizModelProvider);
    final testQuiz = state.randomQuiz ?? initRandomQuiz;
    final weakQuiz = state.weakQuiz ?? initWeakQuiz;
    return Stack(
      alignment: Alignment.bottomCenter,
      children: [
        TabBarView(
          controller: tabController,
          children: categoryList
              .map((category) => _QuizList(category: category))
              .toList(),
        ),
        _BottomQuizMenu(
          weakQuiz: weakQuiz,
          randomQuiz: testQuiz,
        ),
      ],
    );
  }
}
