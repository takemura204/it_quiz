part of 'home_setting_screen.dart';

///目標設定
class _SettingDailyGoal extends ConsumerWidget {
  const _SettingDailyGoal();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final userCustom = ref.watch(userModelProvider);
    final dailyGoal = userCustom.dailyGoal;

    return CustomSettingBar(
      title: "毎日の目標",
      icon: LineIcons.flag,
      customWidget: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            "$dailyGoal",
            style: TextStyle(
              color: Colors.black54,
              fontWeight: FontWeight.normal,
              fontSize: context.width * 0.035,
            ),
          ),
          Text(
            "問",
            style: TextStyle(
              color: Colors.black54,
              fontWeight: FontWeight.normal,
              fontSize: context.width * 0.03,
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
