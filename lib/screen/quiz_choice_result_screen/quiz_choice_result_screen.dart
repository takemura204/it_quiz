import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:kentei_quiz/controller/quiz_choice/quiz_choice_screen_controller.dart';
import 'package:kentei_quiz/resource/extension_resource.dart';
import 'package:substring_highlight/substring_highlight.dart';

import '../../controller/quiz_item/quiz_item_state.dart';
import '../../view/icon_button.dart';
import '../../view/quiz_widget.dart';

part 'quiz_choice_result_view.dart';

class QuizChoiceResultScreen extends StatelessWidget {
  const QuizChoiceResultScreen(this.arguments);
  final QuizItemState arguments;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _AppBar(arguments),
      body: _Body(arguments),
    );
  }
}

class _AppBar extends ConsumerWidget implements PreferredSizeWidget {
  const _AppBar(this.arguments);

  final QuizItemState arguments;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return AppBar(
      titleSpacing: 0,
      centerTitle: true,
      automaticallyImplyLeading: false,
      title: const Text("結果"),
      actions: [
        ClearButton(
          iconSize: 30,
          onPressed: () => //問題リセット
              ref.read(quizChoiceScreenProvider.notifier).resetScreen(),
        ),
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}

class _Body extends ConsumerWidget {
  const _Body(this.item);

  final QuizItemState item;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return CustomScrollView(
      slivers: [
        SliverList(
          delegate: SliverChildListDelegate(
            [
              ///正解した問題リスト
              _QuizResultView(item),
            ],
          ),
        ),
      ],
    );
  }
}
