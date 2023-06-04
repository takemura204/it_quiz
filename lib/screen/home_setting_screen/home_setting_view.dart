part of 'home_setting_screen.dart';

///プロフィール
class UserProfile extends ConsumerWidget {
  const UserProfile();
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final email = FirebaseAuth.instance.currentUser?.email ?? "ログインしていません";
    final displayName = FirebaseAuth.instance.currentUser?.displayName ?? "ゲスト";
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
                    builder: (context) {
                      return DialogDefault2(
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
                          const CreateAccountScreenArguments().generateRoute();
                        },
                      );
                    });
              }
              //ログインしている時
              else {
                //画像選択
                ref.read(authScreenControllerProvider.notifier).pickImage();
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
                      displayName,
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
class _SetGoalY extends ConsumerWidget {
  const _SetGoalY();
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final goalScore = ref.watch(dashboardAnalyticsScreenProvider).goalScore;
    return Container(
      height: context.height * 0.12,
      child: Column(
        children: [
          const Spacer(),
          Text(
            "毎日何問解きたいですか？",
            style: TextStyle(
              fontWeight: FontWeight.normal,
              fontSize: context.width * 0.04,
            ),
            maxLines: 1,
          ),
          const Spacer(),
          Row(
            children: [
              const Spacer(),
              IconButton(
                padding: EdgeInsets.all(context.width * 0.01),
                iconSize: context.width * 0.1,
                onPressed: goalScore <= 10
                    ? null
                    : () {
                        ref
                            .read(dashboardAnalyticsScreenProvider.notifier)
                            .setGoalY(goalScore - 10);
                      },
                icon: Icon(
                  Icons.remove_circle_outline,
                  color: goalScore <= 10
                      ? Colors.grey.shade400
                      : context.mainColor,
                ),
              ),
              Gap(context.width * 0.05),
              Text(
                "$goalScore",
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: context.width * 0.06),
              ),
              Text(
                "問",
                style: TextStyle(
                    fontWeight: FontWeight.normal,
                    fontSize: context.width * 0.055),
              ),
              Gap(context.width * 0.05),
              IconButton(
                padding: EdgeInsets.all(context.width * 0.01),
                iconSize: context.width * 0.1,
                onPressed: goalScore >= 50
                    ? null
                    : () {
                        ref
                            .read(dashboardAnalyticsScreenProvider.notifier)
                            .setGoalY(goalScore + 10);
                      },
                icon: Icon(
                  Icons.add_circle_outline,
                  color: goalScore >= 50
                      ? Colors.grey.shade400
                      : context.mainColor,
                ),
              ),
              const Spacer(),
            ],
          ),
          const Spacer(),
        ],
      ),
    );
  }
}
