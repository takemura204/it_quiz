part of 'home_setting_screen.dart';

///目標設定
class _SettingDailyGoal extends ConsumerWidget {
  const _SettingDailyGoal();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final userCustom = ref.watch(authModelProvider);
    final dailyGoal = userCustom.dailyGoal;

    return CustomSettingBar(
      title: "毎日の目標",
      icon: LineIcons.flag,
      customWidget: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            "$dailyGoal",
            style: const TextStyle(
              color: Colors.black54,
              fontWeight: FontWeight.normal,
              fontSize: 16,
            ),
          ),
          const Text(
            "問",
            style: TextStyle(
              color: Colors.black54,
              fontWeight: FontWeight.normal,
              fontSize: 14,
            ),
          ),
        ],
      ),
      onTap: () {
        showModalBottomSheet(
            context: context,
            builder: (BuildContext context) {
              return const DailyGoalPicker();
            });
      },
    );
  }
}
