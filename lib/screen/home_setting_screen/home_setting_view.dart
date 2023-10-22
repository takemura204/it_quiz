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

///毎日の目標設定
class _SetDailyQuizCountGoal extends ConsumerWidget {
  const _SetDailyQuizCountGoal();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final userCustom = ref.watch(userModelProvider).userCustom;
    final dailyQuizCountGoal = userCustom.dailyQuizCountGoal;
    return Row(
      children: [
        IconButton(
          iconSize: context.height * 0.03,
          onPressed: dailyQuizCountGoal <= 10
              ? null
              : () {
                  ref
                      .read(userModelProvider.notifier)
                      .updateDailyQuizCountGoal(dailyQuizCountGoal - 10);
                },
          icon: Icon(
            Icons.remove_circle_outline,
            color: dailyQuizCountGoal <= 10
                ? Colors.grey.shade400
                : context.mainColor,
          ),
        ),
        Gap(context.width * 0.01),
        Text(
          "$dailyQuizCountGoal",
          style: TextStyle(
              fontWeight: FontWeight.bold, fontSize: context.width * 0.04),
        ),
        Text(
          "問",
          style: TextStyle(
              fontWeight: FontWeight.normal, fontSize: context.width * 0.04),
        ),
        Gap(context.width * 0.01),
        IconButton(
          iconSize: context.height * 0.03,
          onPressed: dailyQuizCountGoal >= 50
              ? null
              : () {
                  ref
                      .read(userModelProvider.notifier)
                      .updateDailyQuizCountGoal(dailyQuizCountGoal + 10);
                },
          icon: Icon(
            Icons.add_circle_outline,
            color: dailyQuizCountGoal >= 50
                ? Colors.grey.shade400
                : context.mainColor,
          ),
        ),
      ],
    );
  }
}

class _SetDailyDurationGoal extends ConsumerWidget {
  const _SetDailyDurationGoal();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final userCustom = ref.watch(userModelProvider).userCustom;
    final dailyDurationGoal = userCustom.dailyDurationGoal;
    return Row(
      children: [
        IconButton(
          iconSize: context.height * 0.03,
          onPressed: dailyDurationGoal <= 5
              ? null
              : () {
                  ref
                      .read(userModelProvider.notifier)
                      .updateDailyDurationGoal(dailyDurationGoal - 5);
                },
          icon: Icon(
            Icons.remove_circle_outline,
            color: dailyDurationGoal <= 5
                ? Colors.grey.shade400
                : context.mainColor,
          ),
        ),
        Gap(context.width * 0.01),
        Text(
          "$dailyDurationGoal",
          style: TextStyle(
              fontWeight: FontWeight.bold, fontSize: context.width * 0.04),
        ),
        Text(
          "分",
          style: TextStyle(
              fontWeight: FontWeight.normal, fontSize: context.width * 0.04),
        ),
        Gap(context.width * 0.01),
        IconButton(
          iconSize: context.height * 0.03,
          onPressed: dailyDurationGoal >= 60
              ? null
              : () {
                  ref
                      .read(userModelProvider.notifier)
                      .updateDailyDurationGoal(dailyDurationGoal + 5);
                },
          icon: Icon(
            Icons.add_circle_outline,
            color: dailyDurationGoal >= 60
                ? Colors.grey.shade400
                : context.mainColor,
          ),
        ),
      ],
    );
  }
}
