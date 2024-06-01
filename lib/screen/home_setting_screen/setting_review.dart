part of 'home_setting_screen.dart';

///レビュー
class _SettingReview extends ConsumerWidget {
  const _SettingReview();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return CustomSettingBar(
      title: "★5レビューで応援する",
      icon: LineIcons.bullhorn,
      customWidget: Text(
        '',
        style: TextStyle(
          fontWeight: FontWeight.normal,
          fontSize: context.width * 0.035,
        ),
      ),
      onTap: () async {
        ref.read(homeSettingProvider.notifier).sendAppReview();
      },
    );
  }
}
