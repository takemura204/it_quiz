import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:kentei_quiz/model/extension_resource.dart';
import 'package:kentei_quiz/screen/screen_argument.dart';

import '../../controller/auth/auth_controller.dart';
import '../../model/user/auth_model.dart';
import '../../view/button/primary_button.dart';
import '../../view/button_icon/cutom_back_button.dart';
import '../../view/text_field.dart';

class SettingProfileScreen extends ConsumerWidget {
  const SettingProfileScreen(this.arguments);

  final SettingProfileScreenArguments arguments;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(authProvider);
    final isValidUserName = state.isValidUserName;
    final isNotTap = state.isNotTap;
    final userNameController =
        ref.read(authModelProvider.notifier).userNameController;
    // final genderController = controller.genderController;
    // final birthdayController = controller.birthdayController;
    // final genders = controller.genders;

    return Scaffold(
      appBar: AppBar(
        title: const Text("プロフィール編集"),
        titleSpacing: 0,
        centerTitle: true,
        automaticallyImplyLeading: false,
        leading: CustomBackButton(
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Padding(
        padding: EdgeInsets.all(context.width * 0.02),
        child: Column(
          children: [
            const Gap(15),

            ///ニックネーム
            UserNameTextField(
              userNameController: userNameController,
              isValidUserName: isValidUserName,
              onChanged: (name) =>
                  ref.read(authProvider.notifier).setUserName(name),
            ),
            // Gap(context.height * 0.01),
            //
            // ///生年月日
            // BirthDayTextField(
            //   birthdayController: birthdayController,
            //   onTap: () {
            //     ///ドラムロール表示
            //     DatePicker.showDatePicker(
            //       context,
            //       minTime: DateTime(1950, 1, 1),
            //       maxTime: DateTime(DateTime.now().year, DateTime.now().month,
            //           DateTime.now().day),
            //       onChanged: (date) {
            //         ref.read(authProvider.notifier).setBirthday(date);
            //       },
            //       onConfirm: (date) {
            //         ref.read(authProvider.notifier).setBirthday(date);
            //         birthdayController.value = TextEditingValue(
            //             text: DateFormat('yyyy/MM/dd').format(date));
            //       },
            //       currentTime: birthdayController.text.isEmpty
            //           ? DateTime(2000, 1, 1)
            //           : DateTime.parse(state.birthDay),
            //       locale: LocaleType.jp,
            //     );
            //   },
            // ),
            // Gap(context.height * 0.01),
            //
            // ///性別
            // GenderTextField(
            //   genderController: genderController,
            //   onTap: () {
            //     var currentIndex =
            //         genders.indexOf(ref.read(authProvider).selectGender);
            //     if (currentIndex == -1) {
            //       currentIndex = 0;
            //     }
            //
            //     //selectGenderを消したい。
            //     ref.read(authProvider.notifier).setSelectGender(
            //         genders[currentIndex]); // Picker表示前に現在の選択状態を保存
            //     ///ドラムロール表示
            //     showModalBottomSheet(
            //       context: context,
            //       builder: (BuildContext context) {
            //         return Container(
            //           height: context.height / 3,
            //           child: Column(
            //             children: [
            //               // ボタン行を追加
            //               Row(
            //                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
            //                 children: [
            //                   CupertinoButton(
            //                     child: const Text(
            //                       'キャンセル',
            //                       style: TextStyle(color: Colors.black45),
            //                     ),
            //                     onPressed: () {
            //                       Navigator.pop(context); // Pickerを閉じる
            //                     },
            //                   ),
            //                   CupertinoButton(
            //                     child: const Text(
            //                       '完了',
            //                       style: TextStyle(color: Colors.blueAccent),
            //                     ),
            //                     onPressed: () {
            //                       ref.read(authProvider.notifier).setGender();
            //                       Navigator.pop(context); // Pickerを閉じる
            //                     },
            //                   ),
            //                 ],
            //               ),
            //               // Picker本体
            //               Expanded(
            //                 child: CupertinoPicker(
            //                   itemExtent: 30,
            //                   scrollController: FixedExtentScrollController(
            //                       initialItem: currentIndex),
            //                   onSelectedItemChanged: (index) {
            //                     ref.read(authProvider.notifier).setSelectGender(
            //                         genders[index]); // 選択状態を一時保存
            //                   },
            //                   children: genders.map((String gender) {
            //                     return Text(gender);
            //                   }).toList(),
            //                 ),
            //               ),
            //             ],
            //           ),
            //         );
            //       },
            //     );
            //   },
            // ),
            //
            // const Spacer(),

            const Gap(20),

            ///更新ボタン
            PrimaryButton(
              width: context.width * 0.85,
              height: 60,
              text: '更新する',
              onPressed: (userNameController.text.isNotEmpty &&
                          userNameController.text.length < 12) &&
                      !isNotTap
                  ? () {
                      ref.read(authProvider.notifier).switchTap();
                      ref
                          .read(authModelProvider.notifier)
                          .updateUserName(userNameController.text)
                        ..then(
                          (value) {
                            ref.read(authProvider.notifier).switchTap();
                            Navigator.of(context).pop();
                          },
                        );
                    }
                  : null,
            ),

            Gap(context.height * 0.1),
          ],
        ),
      ),
    );
  }
}
