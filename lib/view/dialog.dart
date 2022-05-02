import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
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
      title: Column(
        children: [
          Row(
            children: [
              Text(
                item.title,
                style: context.texts.titleLarge,
              ),
              Spacer(),
              Align(
                alignment: Alignment.topRight,
                child: IconButton(
                  padding: const EdgeInsets.all(1.0),
                  iconSize: 30,
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon: const Icon(
                    Icons.clear,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
      children: [
        Container(
          height: MediaQuery.of(context).size.height * 0.5,
          width: MediaQuery.of(context).size.width * 0.8,
          child: Column(
            children: [
              Divider(height: 1, color: context.colors.dark54),

              const Spacer(),
              Divider(height: 1, color: context.colors.dark54),
              const Gap(10),

              ///一問一答形式
              SimpleDialogOption(
                padding:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
                child: Container(
                  alignment: Alignment.center,
                  padding: const EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    color: context.colors.onMain50.withOpacity(0.6),
                    border: Border.all(
                        color: context.colors.main50.withOpacity(0.7)),
                    borderRadius: BorderRadius.circular(5),
                  ),
                  child: Text(
                    I18n().ansOneQuestion,
                    style: TextStyle(
                      color: context.colors.main50.withOpacity(0.7),
                      fontWeight: FontWeight.bold,
                      fontSize: 14,
                    ),
                  ),
                ),
                onPressed: () {
                  Navigator.pop(context, '${I18n().ansOneQuestion}');
                },
              ),

              ///穴埋め形式
              SimpleDialogOption(
                padding:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
                child: Container(
                  alignment: Alignment.center,
                  padding: const EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    color: context.colors.main50.withOpacity(0.6),
                    border: Border.all(
                        color: context.colors.main50.withOpacity(0.7)),
                    borderRadius: BorderRadius.circular(5),
                  ),
                  child: Text(
                    I18n().ansFillBlank,
                    style: TextStyle(
                      color: context.colors.onMain50,
                      fontWeight: FontWeight.bold,
                      fontSize: 14,
                    ),
                  ),
                ),
                onPressed: () {
                  Navigator.pop(context, '${I18n().ansFillBlank}');
                },
              ),

              ///4択形式
              SimpleDialogOption(
                padding:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
                child: Container(
                  alignment: Alignment.center,
                  padding: const EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    color: context.colors.main50.withOpacity(0.6),
                    border: Border.all(
                        color: context.colors.main50.withOpacity(0.7)),
                    borderRadius: BorderRadius.circular(5),
                  ),
                  child: Text(
                    I18n().ansFourChoice,
                    style: TextStyle(
                      color: context.colors.onMain50,
                      fontWeight: FontWeight.bold,
                      fontSize: 14,
                    ),
                  ),
                ),
                onPressed: () {
                  Navigator.pop(context, '${I18n().ansFourChoice}');
                },
              ),

              ///◯×形式で答える
              SimpleDialogOption(
                padding:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
                child: Container(
                  alignment: Alignment.center,
                  padding: const EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    color: context.colors.main50.withOpacity(0.6),
                    border: Border.all(
                        color: context.colors.main50.withOpacity(0.7)),
                    borderRadius: BorderRadius.circular(5),
                  ),
                  child: Text(
                    I18n().ansTrueFalse,
                    style: TextStyle(
                      color: context.colors.onMain50,
                      fontWeight: FontWeight.bold,
                      fontSize: 14,
                    ),
                  ),
                ),
                onPressed: () {
                  Navigator.pop(context, '${I18n().ansTrueFalse}');
                },
              ),
            ],
          ),
        ),
      ],
    );
  }
}
