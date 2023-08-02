import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:kentei_quiz/model/extension_resource.dart';
import 'package:substring_highlight/substring_highlight.dart';

import '../../../controller/quiz_learn/quiz_learn_screen_controller.dart';
import '../../model/quiz/quiz.dart';
import '../../view/icon_button.dart';
import '../../view/quiz_widget.dart';

part 'quiz_learn_result_view.dart';

class QuizLearnResultScreen extends StatelessWidget {
  const QuizLearnResultScreen(this.item);
  final Quiz item;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _AppBar(item),
      body: _Body(item),
    );
  }
}

class _AppBar extends ConsumerWidget implements PreferredSizeWidget {
  const _AppBar(this.quiz);

  final Quiz quiz;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return AppBar(
      titleSpacing: 0,
      centerTitle: true,
      automaticallyImplyLeading: false,
      title: Text(quiz.category),
      actions: [
        ClearButton(
          iconSize: 30,
          onPressed: () => //問題リセット
              ref.read(quizLearnScreenProvider.notifier).tapClearButton(),
        ),
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}

class _Body extends ConsumerWidget {
  const _Body(this.item);

  final Quiz item;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return CustomScrollView(
      slivers: [
        SliverList(
          delegate: SliverChildListDelegate(
            [
              _QuizResultView(item),
            ],
          ),
        ),
      ],
    );
  }
}
