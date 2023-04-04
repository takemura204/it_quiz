import 'package:flutter/material.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'package:gap/gap.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:kentei_quiz/resource/extension_resource.dart';
import 'package:kentei_quiz/screen/home_setting_screen/home_setting_screen.dart';
import 'package:kentei_quiz/screen/screen_argument.dart';

import '../../controller/auth/auth_screen_controller.dart';
import '../../view/button.dart';
import '../../view/text_field.dart';

part 'profile_view.dart';

class ProfileScreen extends ConsumerWidget {
  const ProfileScreen(this.arguments);
  final ProfileScreenArguments arguments;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isValidUserName =
        ref.watch(authScreenControllerProvider).isValidUserName;
    final isValidEmail = ref.watch(authScreenControllerProvider).isValidEmail;
    final isSafetyPass = ref.watch(authScreenControllerProvider).isSafetyPass;
    final userNameController =
        ref.watch(authScreenControllerProvider.notifier).userNameController;
    final emailController =
        ref.watch(authScreenControllerProvider.notifier).emailController;
    final passwordController =
        ref.watch(authScreenControllerProvider.notifier).passwordController;
    final birthdayController =
        ref.watch(authScreenControllerProvider.notifier).birthdayController;

    return Scaffold(
      appBar: AppBar(
        title: const Text("プロフィール編集"),
        titleSpacing: 0,
        centerTitle: true,
        automaticallyImplyLeading: false,
        leading: CustomBackButton(
          iconSize: 25,
          onPressed: () {},
        ),
      ),
      body: Column(
        children: [
          Gap(context.height * 0.01),
          Container(
            alignment: Alignment.center,
            child: UserImage(
              onTap: () {},
              height: context.height * 0.12,
              isLinkedEmail: true,
            ),
          ),
          Gap(context.height * 0.01),

          ///ユーザー名入力
          EditTextField(
            textController: userNameController,
            isValid: isValidUserName,
            onChanged: (name) => ref
                .read(authScreenControllerProvider.notifier)
                .setUserName(name),
            hintText: 'UserName',
            labelText: 'ユーザ名',
            errorText: 'ユーザー名は15文字以内にしてください',
            prefixIcon: const Icon(Icons.person_outline_outlined),
            isTap: false,
            isObscure: false,
            onTap: null,
          ),

          ///メールアド入力
          EditTextField(
            textController: emailController,
            isValid: isValidEmail,
            onChanged: (email) =>
                ref.read(authScreenControllerProvider.notifier).setEmail(email),
            hintText: 'email',
            labelText: 'メールアドレス',
            errorText: '無効なメールアドレスです',
            prefixIcon: const Icon(Icons.mail_outline),
            isTap: true,
            isObscure: false,
            onTap: () {
              print("メール認証が必要");
            },
          ),

          ///パスワード
          EditTextField(
            textController: passwordController,
            isValid: isSafetyPass,
            onChanged: (email) => ref
                .read(authScreenControllerProvider.notifier)
                .setPassword(email),
            hintText: 'password',
            labelText: 'パスワード',
            errorText: '無効なパスワードです',
            prefixIcon: const Icon(Icons.lock_outlined),
            isTap: true,
            isObscure: true,
            onTap: () {
              print("パスワード認証が必要");
            },
          ),

          ///誕生日
          EditTextField(
            textController: birthdayController,
            isValid: true,
            onChanged: null,
            labelText: "誕生日",
            hintText:
                '${DateTime.now().year}/${DateTime.now().month}/${DateTime.now().day}',
            errorText: '無効なメールアドレスです',
            prefixIcon: const Icon(Icons.cake_outlined),
            isTap: true,
            isObscure: false,
            onTap: () {
              ///ドラムロール表示
              DatePicker.showDatePicker(
                context,
                minTime: DateTime(1950, 1, 1),
                maxTime: DateTime(DateTime.now().year, DateTime.now().month,
                    DateTime.now().day),
                onChanged: (date) {},
                onConfirm: (date) {
                  ref
                      .read(authScreenControllerProvider.notifier)
                      .setBirthday(date);
                  birthdayController.value = TextEditingValue(
                      text: '${date.year}/${date.month}/${date.day}');
                },
                currentTime: DateTime.now(),
                locale: LocaleType.jp,
              );
            },
          ),
        ],
      ),
    );
  }
}
