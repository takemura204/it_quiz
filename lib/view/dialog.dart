import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:kentei_quiz/resource/color_resource.dart';
import 'package:kentei_quiz/resource/extension_resource.dart';
import 'package:kentei_quiz/resource/initial_resource.dart';

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
          height: MediaQuery.of(context).size.height * 0.7,
          width: MediaQuery.of(context).size.width * 0.8,
          child: Column(
            children: [
              ///Clearボタン
              Container(
                height: MediaQuery.of(context).size.height * 0.05,
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
                height: MediaQuery.of(context).size.height * 0.1,
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
                height: MediaQuery.of(context).size.height * 0.1,
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
                height: MediaQuery.of(context).size.height * 0.44,
                alignment: Alignment.center,
                child: Column(
                  children: [
                    const Spacer(),

                    ///一問一答形式
                    SimpleDialogOption(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 16, vertical: 8),
                      child: Container(
                        height: MediaQuery.of(context).size.height * 0.08,
                        alignment: Alignment.center,
                        padding: const EdgeInsets.all(16),
                        decoration: BoxDecoration(
                          color: context.colors.onMain50.withOpacity(0.6),
                          border: Border.all(
                              color: context.colors.main50.withOpacity(0.7)),
                          borderRadius: BorderRadius.circular(5),
                        ),
                        child: AutoSizeText(
                          I18n().ansOneQuestion,
                          style: TextStyle(
                            color: context.colors.main50.withOpacity(0.7),
                            fontWeight: FontWeight.bold,
                          ),
                          minFontSize: 16,
                        ),
                      ),
                      onPressed: () {
                        Navigator.pop(context, '${I18n().ansOneQuestion}');
                      },
                    ),

                    ///穴埋め形式
                    SimpleDialogOption(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 16, vertical: 8),
                      child: Container(
                        height: MediaQuery.of(context).size.height * 0.08,
                        alignment: Alignment.center,
                        padding: const EdgeInsets.all(16),
                        decoration: BoxDecoration(
                          color: context.colors.main50.withOpacity(0.6),
                          border: Border.all(
                              color: context.colors.main50.withOpacity(0.7)),
                          borderRadius: BorderRadius.circular(5),
                        ),
                        child: AutoSizeText(
                          I18n().ansFillBlank,
                          style: TextStyle(
                            color: context.colors.onMain50,
                            fontWeight: FontWeight.bold,
                          ),
                          minFontSize: 16,
                        ),
                      ),
                      onPressed: () {
                        Navigator.pop(context, '${I18n().ansFillBlank}');
                      },
                    ),

                    ///4択形式
                    SimpleDialogOption(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 16, vertical: 8),
                      child: Container(
                        height: MediaQuery.of(context).size.height * 0.08,
                        alignment: Alignment.center,
                        padding: const EdgeInsets.all(16),
                        decoration: BoxDecoration(
                          color: context.colors.main50.withOpacity(0.6),
                          border: Border.all(
                              color: context.colors.main50.withOpacity(0.7)),
                          borderRadius: BorderRadius.circular(5),
                        ),
                        child: AutoSizeText(
                          I18n().ansFourChoice,
                          style: TextStyle(
                            color: context.colors.onMain50,
                            fontWeight: FontWeight.bold,
                          ),
                          minFontSize: 16,
                        ),
                      ),
                      onPressed: () {
                        Navigator.pop(context, '${I18n().ansFourChoice}');
                      },
                    ),

                    ///◯×形式で答える
                    SimpleDialogOption(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 16, vertical: 8),
                      child: Container(
                        height: MediaQuery.of(context).size.height * 0.08,
                        alignment: Alignment.center,
                        padding: const EdgeInsets.all(16),
                        decoration: BoxDecoration(
                          color: context.colors.main50.withOpacity(0.6),
                          border: Border.all(
                              color: context.colors.main50.withOpacity(0.7)),
                          borderRadius: BorderRadius.circular(5),
                        ),
                        child: AutoSizeText(
                          I18n().ansTrueFalse,
                          style: TextStyle(
                            color: context.colors.onMain50,
                            fontWeight: FontWeight.bold,
                          ),
                          minFontSize: 16,
                        ),
                      ),
                      onPressed: () {
                        Navigator.pop(context, '${I18n().ansTrueFalse}');
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
