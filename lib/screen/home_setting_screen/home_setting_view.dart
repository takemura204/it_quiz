part of 'home_setting_screen.dart';

///プロフィール
class UserProfile extends ConsumerWidget {
  const UserProfile();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Container(
      height: context.height * 0.15,
      child: Column(
        children: [
          Row(
            children: [
              ///ユーザーアイコン
              Container(
                width: context.height * 0.1,
                height: context.height * 0.1,
                padding: EdgeInsets.all(
                  context.height * 0.01,
                ),
                // color: Colors.greenAccent,
                child: ClipOval(
                  child: Image.network(
                    "https://storage.googleapis.com/funwork-dev-401bf.appspot.com/app/default_user_image.png",
                    fit: BoxFit.cover,
                  ),
                ),
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
                          "ゲスト",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: context.height * 0.02,
                          ),
                        ),
                        const Spacer(),
                      ],
                    ),

                    ///メールアドレス
                    Row(
                      children: [
                        Text(
                          "メール",
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

          ///ログイン・会員登録ボタン
          LoginAndCreateAccountButton(
            onPressed: () => context.showScreen(
                const CreateAccountScreenArguments().generateRoute()),
          ),
        ],
      ),
    );
  }
}
