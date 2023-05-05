import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:kentei_quiz/controller/quiz_item/quiz_item_state.dart';
import 'package:kentei_quiz/resource/extension_resource.dart';
import 'package:substring_highlight/substring_highlight.dart';

import '../../../controller/quiz_learn/quiz_learn_screen_controller.dart';
import '../../view/button.dart';

part 'quiz_learn_result_appbar.dart';
part 'quiz_learn_result_body.dart';
part 'quiz_learn_result_view.dart';

class QuizLearnResultScreen extends StatelessWidget {
  const QuizLearnResultScreen(this.item);
  final QuizItemState item;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _AppBar(item),
      body: _Body(item),
    );
  }
}
