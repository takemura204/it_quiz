import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:kentei_quiz/resource/color_resource.dart';
import 'package:kentei_quiz/resource/extension_resource.dart';
import 'package:kentei_quiz/resource/initial_resource.dart';
import 'package:kentei_quiz/screen/screen_argument.dart';

import '../entity/quiz_item/quiz_item.dart';

class SelectAnsDialog extends ConsumerWidget {
  const SelectAnsDialog(this.item);

  final QuizItem item;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return SimpleDialog(
      insetPadding: const EdgeInsets.all(4),
      contentPadding: const EdgeInsets.all(0),
      children: [
        Container(
          height: context.height * 0.7,
          width: context.width * 0.8,
          child: Column(
            children: [
              ///Clearボタン
              Container(
                height: context.height * 0.05,
                alignment: Alignment.bottomRight,
                child: IconButton(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
                  iconSize: 40,
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon: const Icon(
                    Icons.clear,
                  ),
                ),
              ),

              ///問題タイトル
              Container(
                height: context.height * 0.1,
                padding: const EdgeInsets.symmetric(
                  horizontal: 16,
                ),
                alignment: Alignment.centerLeft,
                child: AutoSizeText(
                  item.title,
                  style: context.texts.titleMedium,
                  minFontSize: 20,
                  maxLines: 1,
                ),
              ),
              Divider(height: 1, color: context.colors.dark54),

              ///進行度
              Container(
                height: context.height * 0.1,
                padding: const EdgeInsets.all(16),
                alignment: Alignment.centerLeft,
                child: Row(
                  children: [
                    AutoSizeText(
                      "進行度",
                      style: context.texts.titleMedium,
                      minFontSize: 20,
                      maxLines: 1,
                    ),
                    const Spacer(),
                    AutoSizeText(
                      "0/10",
                      style: context.texts.titleMedium,
                      minFontSize: 20,
                      maxLines: 1,
                    ),
                  ],
                ),
              ),
              Divider(height: 1, color: context.colors.dark54),

              Container(
                height: context.height * 0.44,
                alignment: Alignment.center,
                child: Column(
                  children: [
                    const Spacer(),

                    ///一問一答形式
                    SimpleDialogOption(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 16, vertical: 8),
                      child: Container(
                        height: context.height * 0.08,
                        alignment: Alignment.center,
                        padding: const EdgeInsets.all(16),
                        decoration: BoxDecoration(
                          color: context.colors.onMain50.withOpacity(0.6),
                          border: Border.all(
                              color: context.colors.main50.withOpacity(0.7)),
                          borderRadius: BorderRadius.circular(5),
                        ),
                        child: AutoSizeText(
                          I18n().quizOneQuestion,
                          style: TextStyle(
                            color: context.colors.main50.withOpacity(0.7),
                            fontWeight: FontWeight.bold,
                          ),
                          minFontSize: 16,
                        ),
                      ),
                      onPressed: () {
                        Navigator.pop(context, '${I18n().quizOneQuestion}');
                        context.showScreen(QuizOneQuestionScreenArguments(
                          item: item,
                          quizStyle: I18n().quizOneQuestion,
                        ).generateRoute());
                      },
                    ),

                    ///穴埋め形式
                    SimpleDialogOption(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 16, vertical: 8),
                      child: Container(
                        height: context.height * 0.08,
                        alignment: Alignment.center,
                        padding: const EdgeInsets.all(16),
                        decoration: BoxDecoration(
                          color: context.colors.main50.withOpacity(0.6),
                          border: Border.all(
                              color: context.colors.main50.withOpacity(0.7)),
                          borderRadius: BorderRadius.circular(5),
                        ),
                        child: AutoSizeText(
                          I18n().quizFillBlank,
                          style: TextStyle(
                            color: context.colors.onMain50,
                            fontWeight: FontWeight.bold,
                          ),
                          minFontSize: 16,
                        ),
                      ),
                      onPressed: () {
                        Navigator.pop(context, '${I18n().quizFillBlank}');
                      },
                    ),

                    ///4択形式
                    SimpleDialogOption(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 16, vertical: 8),
                      child: Container(
                        height: context.height * 0.08,
                        alignment: Alignment.center,
                        padding: const EdgeInsets.all(16),
                        decoration: BoxDecoration(
                          color: context.colors.main50.withOpacity(0.6),
                          border: Border.all(
                              color: context.colors.main50.withOpacity(0.7)),
                          borderRadius: BorderRadius.circular(5),
                        ),
                        child: AutoSizeText(
                          I18n().quizFourChoice,
                          style: TextStyle(
                            color: context.colors.onMain50,
                            fontWeight: FontWeight.bold,
                          ),
                          minFontSize: 16,
                        ),
                      ),
                      onPressed: () {
                        Navigator.pop(context, '${I18n().quizFourChoice}');
                      },
                    ),

                    ///◯×形式で答える
                    SimpleDialogOption(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 16, vertical: 8),
                      child: Container(
                        height: context.height * 0.08,
                        alignment: Alignment.center,
                        padding: const EdgeInsets.all(16),
                        decoration: BoxDecoration(
                          color: context.colors.main50.withOpacity(0.6),
                          border: Border.all(
                              color: context.colors.main50.withOpacity(0.7)),
                          borderRadius: BorderRadius.circular(5),
                        ),
                        child: AutoSizeText(
                          I18n().quizTrueFalse,
                          style: TextStyle(
                            color: context.colors.onMain50,
                            fontWeight: FontWeight.bold,
                          ),
                          minFontSize: 16,
                        ),
                      ),
                      onPressed: () {
                        Navigator.pop(context, '${I18n().quizTrueFalse}');
                      },
                    ),
                    const Spacer(),
                    Divider(height: 1, color: context.colors.dark54),
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
