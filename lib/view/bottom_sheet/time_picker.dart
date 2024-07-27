import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:gap/gap.dart';
import 'package:kentei_quiz/model/extension_resource.dart';

import '../button/defalut_button.dart';
import '../button/primary_button.dart';

class CustomTimePicker extends HookWidget {
  const CustomTimePicker(
      {required this.initialTime,
      required this.onTimeChanged,
      required this.recommendedHour,
      required this.recommendedMinute});

  final TimeOfDay initialTime;
  final Function(TimeOfDay) onTimeChanged;
  final int recommendedHour;
  final int recommendedMinute;

  @override
  Widget build(BuildContext context) {
    int selectedHour = initialTime.hour;
    int selectedMinute = initialTime.minute;
    final hourController =
        FixedExtentScrollController(initialItem: selectedHour);
    final minuteController =
        FixedExtentScrollController(initialItem: selectedMinute ~/ 5);

    return Container(
      height: 380,
      color: Colors.white,
      child: Column(
        children: [
          Container(
            height: 60,
            child: Row(
              children: [
                Container(
                  height: 50,
                  width: 50,
                  child: IconButton(
                    alignment: Alignment.centerLeft,
                    iconSize: 35,
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    icon: Icon(
                      Icons.clear,
                      color: Colors.grey.shade400,
                    ),
                  ),
                ),
                const Spacer(),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: DefaultButton(
                    width: 100,
                    height: 50,
                    text: "おすすめ",
                    onPressed: () {
                      hourController.animateToItem(
                        recommendedHour,
                        duration: const Duration(milliseconds: 500),
                        curve: Curves.easeInOut,
                      );
                      minuteController.animateToItem(
                        recommendedMinute ~/ 5,
                        duration: const Duration(milliseconds: 500),
                        curve: Curves.easeInOut,
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
          const Gap(10),
          Container(
            height: 200,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Spacer(),
                Container(
                  width: context.width * 0.4,
                  child: Stack(
                    alignment: Alignment.center,
                    children: [
                      Container(
                        height: 40,
                        decoration: BoxDecoration(
                          color: Colors.grey.shade200,
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                      ListWheelScrollView(
                        controller: hourController,
                        physics: const FixedExtentScrollPhysics(),
                        useMagnifier: true,
                        magnification: 1.1,
                        diameterRatio: 1.5,
                        onSelectedItemChanged: (value) {
                          selectedHour = value;
                        },
                        itemExtent: 42,
                        children: [
                          for (var i = 0; i < 24; i++)
                            Center(
                                child: Text('$i',
                                    style: const TextStyle(fontSize: 16))),
                        ],
                      ),
                    ],
                  ),
                ),
                const Spacer(),
                Container(
                  width: context.width * 0.4,
                  child: Stack(
                    alignment: Alignment.center,
                    children: [
                      Container(
                        height: 40,
                        decoration: BoxDecoration(
                          color: Colors.grey.shade200,
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                      ListWheelScrollView(
                        controller: minuteController,
                        onSelectedItemChanged: (value) {
                          selectedMinute = value * 5;
                        },
                        itemExtent: 42,
                        physics: const FixedExtentScrollPhysics(),
                        useMagnifier: true,
                        magnification: 1.1,
                        diameterRatio: 1.5,
                        children: [
                          for (var i = 0; i < 12; i++)
                            Center(
                                child: Text('${i * 5}'.padLeft(2, '0'),
                                    style: const TextStyle(fontSize: 16))),
                        ],
                      ),
                    ],
                  ),
                ),
                const Spacer(),
              ],
            ),
          ),
          const Gap(10),
          PrimaryButton(
              width: context.width * 0.85,
              height: 60,
              title: "設定する",
              onPressed: () {
                onTimeChanged(
                    TimeOfDay(hour: selectedHour, minute: selectedMinute));
                Navigator.pop(context);
              }),
          const Gap(20),
          const Spacer(),
        ],
      ),
    );
  }
}
