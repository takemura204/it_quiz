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
                await showDialog<Dialog>(
                    context: context,
                    builder: (context) {
                      return const NeedSignUpDialog();
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
            child: ClipOval(
              child: Image.network(
                "https://storage.googleapis.com/funwork-dev-401bf.appspot.com/app/default_user_image.png",
                fit: BoxFit.cover,
              ),
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
