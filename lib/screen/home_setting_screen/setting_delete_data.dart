part of 'home_setting_screen.dart';

///リセット
class _SettingDeleteData extends ConsumerWidget {
  const _SettingDeleteData();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return CustomSettingBar(
      title: "学習データを削除",
      icon: LineIcons.trash,
      customWidget: Text(
        '',
        style: TextStyle(
          fontWeight: FontWeight.normal,
          fontSize: context.width * 0.035,
        ),
      ),
      onTap: () async {
        await showDialog(
            context: context,
            builder: (context) {
              return PrimaryDialog(
                  onPressed: () {
                    ref.read(quizModelProvider.notifier).resetData();
                    ref.read(quizModelProvider.notifier).initState();
                    ref.read(dashboardModelProvider.notifier).initState();
                    Navigator.of(context).pop();
                  },
                  title: "学習データを削除します？",
                  subWidget: Text(
                    "一度削除してしまうと、\nデータはと復元できませせん。",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontSize: context.width * 0.04, color: Colors.black87),
                    maxLines: 2,
                  ),
                  cancelText: "キャンセル",
                  doneText: "削除する");
            });
      },
    );
  }
}
