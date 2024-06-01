import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:kentei_quiz/model/extension_resource.dart';
import 'package:permission_handler/permission_handler.dart';

import '../../controller/setting_notification/setting_notification_controller.dart';
import '../../model/notification_time/notification_time.dart';
import '../../model/user/auth_model.dart';
import '../bottom_sheet/time_picker.dart';

class NeedNotificationCard extends ConsumerWidget {
  const NeedNotificationCard();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final userCustom = ref.watch(authModelProvider);
    final defaultHour = NotificationTime.defaultTime().hour;
    final defaultMinute = NotificationTime.defaultTime().minute;
    final selectedHour = userCustom.selectNotificationTime?.hour ?? defaultHour;
    final selectedMinute =
        userCustom.selectNotificationTime?.minute ?? defaultMinute;
    final isNotification =
        ref.watch(settingNotificationProvider.select((s) => s.isNotification));

    const imagePath = 'assets/image/need_setting_notification.svg';

    return isNotification
        ? Container()
        : GestureDetector(
            onTap: () async {
              await ref
                  .read(settingNotificationProvider.notifier)
                  .checkNotificationPermission()
                  .then((value) {
                if (!isNotification) {
                  openAppSettings();
                } else {
                  showModalBottomSheet(
                      context: context,
                      builder: (BuildContext context) {
                        return CustomTimePicker(
                          initialTime: TimeOfDay(
                              hour: selectedHour!, minute: selectedMinute!),
                          recommendedHour: 8,
                          recommendedMinute: 30,
                          onTimeChanged: (selectedTime) async {
                            ref
                                .read(authModelProvider.notifier)
                                .updateNotificationTime(
                                    value: NotificationTime(
                                        hour: selectedTime.hour,
                                        minute: selectedTime.minute));
                            await ref
                                .read(settingNotificationProvider.notifier)
                                .scheduleNotifications(
                                    value: NotificationTime(
                                        hour: selectedTime.hour,
                                        minute: selectedTime.minute));
                          },
                        );
                      });
                }
              });
              HapticFeedback.lightImpact();
            },
            child: Container(
              margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
              decoration: BoxDecoration(
                color: context.mainColor,
                // 全ての辺に一様なボーダーを適用
                border: Border.all(
                  color: context.secondColor,
                  width: 1.5,
                ),
                borderRadius: BorderRadius.circular(10),
              ),
              alignment: Alignment.center,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Gap(10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Gap(10),
                      const Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'リマインダーで継続をサポート',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 16,
                                color: Colors.white,
                              ),
                            ),
                            Gap(5),
                            Text(
                              '通知をONにすると、あなたに合わせた\nおすすめのクイズを毎日送信します。',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 12,
                                color: Colors.white,
                              ),
                            ),
                            Gap(5),
                          ],
                        ),
                      ),
                      const Gap(10),
                      Column(
                        children: [
                          const Gap(10),
                          SvgPicture.asset(
                            imagePath,
                            width: context.width * 0.2,
                            fit: BoxFit.cover,
                          ),
                          const Gap(5),
                          Container(
                            height: 20,
                            child: const Text(
                              '今すぐ設定 ＞',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 12,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ],
                      ),
                      const Gap(10),
                    ],
                  ),
                  const Gap(5),
                ],
              ),
            ),
          );
  }
}
