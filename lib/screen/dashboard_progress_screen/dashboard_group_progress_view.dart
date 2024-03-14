part of 'dashboard_group_screen.dart';

class _Title extends ConsumerWidget {
  const _Title(
      {required this.title, required this.subWidget, required this.icon});

  final String title;
  final Widget? subWidget;
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
          bottom: BorderSide(color: Colors.grey, width: context.width * 0.003),
        ),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          const Gap(5),
          Text(
            title,
            style: context.texts.titleMedium,
          ),
          const Spacer(),
          if (subWidget != null) ...[
            subWidget!,
          ],
        ],
      ),
    );
  }
}

///今日のメッセージ
class _DailyMessage extends ConsumerWidget {
  const _DailyMessage();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Container(
      width: context.width * 0.48,
      child: Column(
        children: [
          const Spacer(),
          Container(
            height: context.height * 0.12,
            child: Column(
              children: [
                const Spacer(),
                Text(
                  "千里の道も一歩から！\nコツコツ積み重ねていましょう!継続は今日からです！\na",
                  style: TextStyle(
                    color: Colors.black45,
                    fontWeight: FontWeight.bold,
                    fontSize: context.width * 0.032,
                  ),
                  textAlign: TextAlign.start,
                  maxLines: 3,
                ),
                const Spacer(),
              ],
            ),
          ),
          Container(
            width: context.height * 0.1,
            height: context.height * 0.1,
            child: Image.asset(
              'assets/image/cat_grey.png',
              fit: BoxFit.contain,
            ),
          ),
          Gap(context.height * 0.01),
        ],
      ),
    );
  }
}
