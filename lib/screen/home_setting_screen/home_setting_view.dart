part of 'home_setting_screen.dart';

///プロフィール
class UserProfile extends ConsumerWidget {
  const UserProfile();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final email = FirebaseAuth.instance.currentUser?.email ?? "ログインしていません";
    final userName = ref.watch(authProvider).userName;
    return Container(
      height: context.height * 0.1,
      child: Row(
        children: [
          ///ユーザーアイコン
          UserImage(
            onTap: () async {
              //ログインしていない時
              if (email == "ログインしていません") {
                //ログイン画面遷移
                await showDialog(
                    context: context,
                    barrierDismissible: false,
                    builder: (context) {
                      return DefaultDialog(
                        title: "アカウントを作成しましょう",
                        subWidget: Text(
                          "名前やプロフィール画像を設定するには\nアカウントの登録が必要です",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              fontSize: context.width * 0.04,
                              color: Colors.black87),
                          maxLines: 2,
                        ),
                        cancelText: "キャンセル",
                        doneText: "新規登録",
                        onPressed: () {
                          Navigator.of(context).pop();
                          context.showScreen(
                              const AccountCreateStep1ScreenArguments()
                                  .generateRoute());
                        },
                      );
                    });
              }
              //ログインしている時
              else {
                //画像選択
                ref.read(authProvider.notifier).pickImage();
              }
            },
            height: context.height * 0.1,
            isLinkedEmail: false,
          ),

          ///ユーザネーム・メールアドレス
          Container(
            height: context.height * 0.1,
            width: context.width * 0.75,
            alignment: Alignment.centerLeft,
            child: Column(
              children: [
                const Spacer(),

                ///ユーザネーム
                Row(
                  children: [
                    Text(
                      email == "ログインしていません" ? "ゲスト" : userName,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: context.height * 0.02,
                      ),
                    ),
                    const Spacer(),
                  ],
                ),
                const Gap(5),

                ///メールアドレス
                Row(
                  children: [
                    Text(
                      email,
                      style: TextStyle(
                        fontWeight: FontWeight.w400,
                        fontSize: context.height * 0.015,
                        color: Colors.black38,
                      ),
                    ),
                    const Spacer(),
                  ],
                ),
                const Spacer(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

///プロフィール
class UserImage extends ConsumerWidget {
  const UserImage(
      {required this.onTap, required this.height, required this.isLinkedEmail});

  final VoidCallback onTap;
  final double height;
  final bool isLinkedEmail;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Stack(
      children: [
        Container(
          width: height,
          height: height,
          padding: EdgeInsets.all(
            context.height * 0.01,
          ),
          // color: Colors.greenAccent,
          child: GestureDetector(
            onTap: onTap,
            child: Icon(
              Icons.account_circle_outlined,
              size: context.height * 0.07,
              color: context.mainColor,
            ),
          ),
        ),
        if (isLinkedEmail)
          Container(
            // color: Colors.blue,
            height: height,
            width: height,
            child: Align(
              alignment: Alignment.bottomRight,
              child: Container(
                height: height / 4,
                width: height / 4,
                margin: EdgeInsets.all(
                  context.height * 0.01,
                ),
                decoration: BoxDecoration(
                  color: Colors.grey.withOpacity(0.8),
                  borderRadius: BorderRadius.circular(50),
                ),
                child: const Icon(
                  Icons.camera_alt,
                  color: Colors.white,
                  size: 15,
                ),
              ),
            ),
          ),
      ],
    );
  }
}

///目標設定
class _SettingDailyGoal extends ConsumerWidget {
  const _SettingDailyGoal();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final userCustom = ref.watch(userModelProvider).userCustom;
    final dailyQuizCountGoal = userCustom.dailyQuizCountGoal;

    return CustomSettingBar(
      title: "毎日の目標",
      icon: LineIcons.flag,
      customWidget: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            "$dailyQuizCountGoal",
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

///カラーテーマ
class _SettingThemeColor extends ConsumerWidget {
  const _SettingThemeColor();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return CustomSettingBar(
      title: "カラーテーマ",
      icon: LineIcons.palette,
      customWidget: Container(
        height: context.width * 0.05,
        width: context.width * 0.05,
        margin: EdgeInsets.all(context.width * 0.01),
        decoration: ShapeDecoration(
          shape: const CircleBorder(),
          color: context.mainColor,
        ),
      ),
      onTap: () {
        context.showScreen(const SettingColorScreenArguments().generateRoute());
      },
    );
  }
}

///リマインダー
class _SettingNotification extends ConsumerWidget {
  const _SettingNotification();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final userCustom = ref.watch(userModelProvider).userCustom;
    final defaultHour = NotificationTime.defaultTime().hour;
    final defaultMinute = NotificationTime.defaultTime().minute;
    final selectedHour = userCustom.selectNotificationTime?.hour ?? defaultHour;
    final selectedMinute =
        userCustom.selectNotificationTime?.minute ?? defaultMinute;
    return CustomSettingBar(
      title: "リマインダー",
      icon: LineIcons.stopwatch,
      customWidget: Text(
        '$selectedHour:${selectedMinute.toString().padLeft(2, '0')}',
        style: TextStyle(
          fontWeight: FontWeight.normal,
          fontSize: context.width * 0.035,
        ),
      ),
      onTap: () {
        showModalBottomSheet(
            context: context,
            builder: (BuildContext context) {
              return CustomTimePicker(
                initialTime:
                    TimeOfDay(hour: selectedHour!, minute: selectedMinute!),
                recommendedHour: 9,
                recommendedMinute: 0,
                onTimeChanged: (selectedTime) async {
                  ref.read(userModelProvider.notifier).updateNotificationTime(
                      value: NotificationTime(
                          hour: selectedTime.hour,
                          minute: selectedTime.minute));
                },
              );
            });
      },
    );
  }
}
