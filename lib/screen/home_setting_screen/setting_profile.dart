part of 'home_setting_screen.dart';

///プロフィール
class _SettingProfile extends ConsumerWidget {
  const _SettingProfile();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final userCustom = ref.watch(authModelProvider);
    final userName = userCustom.userName;

    return CustomSettingBar(
      title: "プロフィール",
      icon: LineIcons.user,
      customWidget: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            "$userName",
            style: const TextStyle(
              color: Colors.black54,
              fontWeight: FontWeight.normal,
              fontSize: 16,
            ),
          ),
        ],
      ),
      onTap: () {
        context
            .showScreen(const SettingProfileScreenArguments().generateRoute());
      },
    );
  }
}
