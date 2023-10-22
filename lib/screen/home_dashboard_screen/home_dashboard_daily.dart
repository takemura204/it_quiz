part of 'home_dashboard_screen.dart';

/// 今日の学習
class DailyDashboard extends ConsumerWidget {
  const DailyDashboard();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final dashboardModel = ref.watch(dashboardModelProvider);
    final dailyDuration = dashboardModel.dailyDuration.inMinutes;
    final dailyQuizCount = dashboardModel.dailyQuizCount;

    final userModel = ref.watch(userModelProvider);
    final dailyQuizCountGoal = userModel.userCustom.dailyQuizCountGoal;
    final dailyDurationGoal = userModel.userCustom.dailyDurationGoal;

    return Container(
      width: context.width * 1,
      child: Card(
        elevation: 3,
        color: Colors.white,
        margin: EdgeInsets.symmetric(
            horizontal: context.width * 0.02, vertical: context.width * 0.01),
        shape: RoundedRectangleBorder(
          side: BorderSide(
            color: context.mainColor,
            width: 1,
          ),
          borderRadius: BorderRadius.circular(20),
        ),
        child: Column(
          children: [
            _Title(
              title: "今日の学習",
              subWidget: Text(
                "",
                style: TextStyle(
                  fontSize: context.height * 0.018,
                ),
              ),
              icon: LineIcons.fontAwesomeFlag,
            ),
            Gap(context.height * 0.01),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Column(
                  children: [
                    Icon(
                      LineIcons.book,
                      color: context.mainColor,
                      size: context.width * 0.1,
                    ),
                    Text(
                      '問題数',
                      style: TextStyle(
                        color: context.mainColor,
                        fontSize: context.height * 0.015,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Gap(context.height * 0.005),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.baseline,
                      textBaseline: TextBaseline.alphabetic,
                      children: [
                        Text(
                          "$dailyQuizCount",
                          style: TextStyle(
                            color: Colors.black54,
                            fontSize: context.height * 0.035,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          "/$dailyQuizCountGoal",
                          style: TextStyle(
                            color: Colors.black54,
                            fontSize: context.height * 0.027,
                            fontWeight: FontWeight.normal,
                          ),
                        ),
                      ],
                    ),
                    Text(
                      '問',
                      style: TextStyle(
                        color: Colors.black54,
                        fontSize: context.height * 0.018,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
                Column(
                  children: [
                    Icon(
                      LineIcons.clock,
                      color: context.mainColor,
                      size: context.width * 0.1,
                    ),
                    Text(
                      '学習時間',
                      style: TextStyle(
                        color: context.mainColor,
                        fontSize: context.height * 0.015,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Gap(context.height * 0.005),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.baseline,
                      textBaseline: TextBaseline.alphabetic,
                      children: [
                        Text(
                          '$dailyDuration',
                          style: TextStyle(
                            color: Colors.black54,
                            fontSize: context.height * 0.035,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          "/$dailyDurationGoal",
                          style: TextStyle(
                            color: Colors.black54,
                            fontSize: context.height * 0.027,
                            fontWeight: FontWeight.normal,
                          ),
                        ),
                      ],
                    ),
                    Text(
                      '分',
                      style: TextStyle(
                        color: Colors.black54,
                        fontSize: context.height * 0.018,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
                Column(
                  children: [
                    Icon(
                      LineIcons.alternateFire,
                      color: context.mainColor,
                      size: context.width * 0.1,
                    ),
                    Text(
                      'スコア',
                      style: TextStyle(
                        color: context.mainColor,
                        fontSize: context.height * 0.015,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Gap(context.height * 0.005),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.baseline,
                      textBaseline: TextBaseline.alphabetic,
                      children: [
                        Text(
                          '80',
                          style: TextStyle(
                            color: Colors.black54,
                            fontSize: context.height * 0.035,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const Gap(3),
                        Text(
                          'up↑',
                          style: TextStyle(
                            color: Colors.black54,
                            fontSize: context.height * 0.023,
                            fontWeight: FontWeight.normal,
                          ),
                        ),
                      ],
                    ),
                    Text(
                      'exp',
                      style: TextStyle(
                        color: Colors.black54,
                        fontSize: context.height * 0.018,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ],
            ),
            Gap(context.height * 0.01),
          ],
        ),
      ),
    );
  }
}

class _Title extends ConsumerWidget {
  const _Title(
      {required this.title, required this.subWidget, required this.icon});

  final String title;
  final Widget subWidget;
  final IconData icon;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Container(
      height: context.height * 0.04,
      margin: EdgeInsets.only(
        left: context.width * 0.02,
        top: context.width * 0.015,
        right: context.width * 0.02,
        bottom: 0.00,
      ),
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(
              color: context.mainColor, width: context.width * 0.003),
        ),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Gap(context.width * 0.01),
          Text(
            title,
            style: TextStyle(
                fontSize: context.height * 0.023,
                color: context.mainColor,
                fontWeight: FontWeight.bold),
          ),
          const Spacer(),
          subWidget,
        ],
      ),
    );
  }
}
