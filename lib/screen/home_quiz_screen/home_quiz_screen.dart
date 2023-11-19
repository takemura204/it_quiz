import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:gap/gap.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:kentei_quiz/controller/home_quiz/home_quiz_screen_controller.dart';
import 'package:kentei_quiz/model/extension_resource.dart';
import 'package:line_icons/line_icons.dart';

import '../../model/lang/initial_resource.dart';
import '../../model/quiz/quiz.dart';
import '../../model/quiz/quiz_model.dart';
import '../../model/quiz/quizzes.dart';
import '../../view/bar.dart';
import '../../view/button/defalut_button.dart';
import '../../view/button/primary_button.dart';
import '../../view/modals/study_modal.dart';
import '../../view/modals/test_modal.dart';
import '../screen_argument.dart';

part 'home_quiz_list.dart';
part 'home_quiz_view.dart';

class HomeQuizScreen extends ConsumerWidget {
  const HomeQuizScreen();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ProviderScope(
      overrides: [
        homeQuizScreenProvider.overrideWith(
          (ref) => HomeQuizScreenController(ref: ref),
        ),
      ],
      child: const _Scaffold(),
    );
  }
}

class _Scaffold extends ConsumerWidget {
  const _Scaffold();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final categoryList = ref.watch(homeQuizScreenProvider).categoryList;

    if (categoryList.isEmpty) {
      return Center(
        child: SpinKitFadingCircle(
          color: context.mainColor,
          size: context.height * 0.1,
        ),
      );
    }

    return DefaultTabController(
      initialIndex: 0, // 最初に表示するタブ
      length: categoryList.length, // タブの数
      child: Scaffold(
        appBar: _AppBar(categoryList: categoryList),
        body: _Body(categoryList: categoryList),
      ),
    );
  }
}

class _AppBar extends ConsumerWidget implements PreferredSizeWidget {
  const _AppBar({required this.categoryList});

  final List<String> categoryList;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final tabIndex = ref.watch(homeQuizScreenProvider).tabIndex;

    return AppBar(
      title: Text(I18n().titleStudy),
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
      bottom: TabBar(
        onTap: (index) =>
            ref.read(homeQuizScreenProvider.notifier).setTabIndex(index),
        isScrollable: false,
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
                  fontSize: context.width * 0.04,
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
  Size get preferredSize => const Size.fromHeight(100);
}

class _Body extends ConsumerWidget {
  const _Body({required this.categoryList});

  final List<String> categoryList;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(quizModelProvider);
    final testQuiz = state.testQuiz ?? initTestQuiz;
    final weakQuiz = state.weakQuiz ?? initWeakQuiz;
    return Stack(
      alignment: Alignment.bottomCenter,
      children: [
        TabBarView(
          children: categoryList
              .map((category) => _QuizList(category: category))
              .toList(),
        ),
        _BottomQuizMenu(
          weakQuiz: weakQuiz,
          testQuiz: testQuiz,
        ),
      ],
    );
  }
}
