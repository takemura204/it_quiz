part of 'home_setting_screen.dart';

///リマインダー
class _SettingNotification extends ConsumerWidget {
  const _SettingNotification();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final userCustom = ref.watch(userModelProvider);
    final defaultHour = NotificationTime.defaultTime().hour;
    final defaultMinute = NotificationTime.defaultTime().minute;
    final selectedHour = userCustom.selectNotificationTime?.hour ?? defaultHour;
    final selectedMinute =
        userCustom.selectNotificationTime?.minute ?? defaultMinute;
    final isNotification =
        ref.watch(settingNotificationProvider.select((s) => s.isNotification));
    return CustomSettingBar(
      title: "リマインダー",
      icon: LineIcons.stopwatch,
      customWidget: Text(
        isNotification
            ? '$selectedHour:${selectedMinute.toString().padLeft(2, '0')}'
            : '許可しない',
        style: TextStyle(
          fontWeight: FontWeight.normal,
          fontSize: context.width * 0.035,
        ),
      ),
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
                    initialTime:
                        TimeOfDay(hour: selectedHour!, minute: selectedMinute!),
                    recommendedHour: 9,
                    recommendedMinute: 0,
                    onTimeChanged: (selectedTime) async {
                      ref
                          .read(userModelProvider.notifier)
                          .updateNotificationTime(
                              value: NotificationTime(
                                  hour: selectedTime.hour,
                                  minute: selectedTime.minute));
                      await ref
                          .read(settingNotificationProvider.notifier)
                          .scheduleNotifications(DateTime.now(),
                              selectNotificationTime: selectedTime);
                    },
                  );
                });
          }
        });
      },
    );
  }
}
