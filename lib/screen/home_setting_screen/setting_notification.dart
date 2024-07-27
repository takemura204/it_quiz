part of 'home_setting_screen.dart';

///リマインダー
class _SettingNotification extends ConsumerWidget {
  const _SettingNotification();

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
    return CustomSettingBar(
      title: "リマインダー",
      icon: LineIcons.stopwatch,
      customWidget: Text(
        isNotification != null && isNotification
            ? '$selectedHour:${selectedMinute.toString().padLeft(2, '0')}'
            : '許可しない',
        style: const TextStyle(
          fontWeight: FontWeight.normal,
          fontSize: 16,
        ),
      ),
      onTap: () async {
        await ref
            .read(settingNotificationProvider.notifier)
            .checkNotificationPermission()
            .then((value) {
          if (isNotification != null && isNotification) {
            showModalBottomSheet(
                context: context,
                builder: (BuildContext context) {
                  return CustomTimePicker(
                    initialTime:
                        TimeOfDay(hour: selectedHour!, minute: selectedMinute!),
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
          } else {
            openAppSettings();
          }
        });
      },
    );
  }
}
