import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_datetime_picker_plus/flutter_datetime_picker_plus.dart';
import 'package:gap/gap.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:kentei_quiz/model/extension_resource.dart';
import 'package:kentei_quiz/screen/screen_argument.dart';

import '../../controller/auth/auth_controller.dart';
import '../../model/lang/initial_resource.dart';
import '../../view/button/primary_button.dart';
import '../../view/dialog.dart';
import '../../view/icon_button.dart';
import '../../view/text_field.dart';

part 'account_profile_view.dart';

class AccountProfileScreen extends ConsumerWidget {
  const AccountProfileScreen(this.arguments);

  final ProfileScreenArguments arguments;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(authProvider);
    final controller = ref.watch(authProvider.notifier);
    final isValidUserName = state.isValidUserName;
    final isNotTap = state.isNotTap;
    final userNameController = controller.userNameController;
    final genderController = controller.genderController;
    final birthdayController = controller.birthdayController;
    final genders = controller.genders;

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
            Gap(context.height * 0.05),

            ///ニックネーム
            UserNameTextField(
              userNameController: userNameController,
              isValidUserName: isValidUserName,
              onChanged: (name) =>
                  ref.read(authProvider.notifier).setUserName(name),
            ),
            Gap(context.height * 0.01),

            ///生年月日
            BirthDayTextField(
              birthdayController: birthdayController,
              onTap: () {
                ///ドラムロール表示
                DatePicker.showDatePicker(
                  context,
                  minTime: DateTime(1950, 1, 1),
                  maxTime: DateTime(DateTime.now().year, DateTime.now().month,
                      DateTime.now().day),
                  onChanged: (date) {
                    ref.read(authProvider.notifier).setBirthday(date);
                  },
                  onConfirm: (date) {
                    ref.read(authProvider.notifier).setBirthday(date);
                    birthdayController.value = TextEditingValue(
                        text: DateFormat('yyyy/MM/dd').format(date));
                  },
                  currentTime: birthdayController.text.isEmpty
                      ? DateTime(2000, 1, 1)
                      : DateTime.parse(state.birthDay),
                  locale: LocaleType.jp,
                );
              },
            ),
            Gap(context.height * 0.01),

            ///性別
            GenderTextField(
              genderController: genderController,
              onTap: () {
                var currentIndex =
                    genders.indexOf(ref.read(authProvider).selectGender);
                if (currentIndex == -1) {
                  currentIndex = 0;
                }

                //selectGenderを消したい。
                ref.read(authProvider.notifier).setSelectGender(
                    genders[currentIndex]); // Picker表示前に現在の選択状態を保存
                ///ドラムロール表示
                showModalBottomSheet(
                  context: context,
                  builder: (BuildContext context) {
                    return Container(
                      height: MediaQuery.of(context).size.height / 3,
                      child: Column(
                        children: [
                          // ボタン行を追加
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              CupertinoButton(
                                child: const Text(
                                  'キャンセル',
                                  style: TextStyle(color: Colors.black45),
                                ),
                                onPressed: () {
                                  Navigator.pop(context); // Pickerを閉じる
                                },
                              ),
                              CupertinoButton(
                                child: const Text(
                                  '完了',
                                  style: TextStyle(color: Colors.blueAccent),
                                ),
                                onPressed: () {
                                  ref.read(authProvider.notifier).setGender();
                                  Navigator.pop(context); // Pickerを閉じる
                                },
                              ),
                            ],
                          ),
                          // Picker本体
                          Expanded(
                            child: CupertinoPicker(
                              itemExtent: 30,
                              scrollController: FixedExtentScrollController(
                                  initialItem: currentIndex),
                              onSelectedItemChanged: (index) {
                                ref.read(authProvider.notifier).setSelectGender(
                                    genders[index]); // 選択状態を一時保存
                              },
                              children: genders.map((String gender) {
                                return Text(gender);
                              }).toList(),
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                );
              },
            ),

            const Spacer(),

            ///更新ボタン
            PrimaryButton(
              width: context.width * 0.8,
              height: context.height * 0.07,
              text: '更新する',
              onPressed: (userNameController.text.isNotEmpty &&
                          birthdayController.text.isNotEmpty &&
                          genderController.text.isNotEmpty) &&
                      !isNotTap
                  ? () {
                      ref.read(authProvider.notifier).switchTap();
                      ref.read(authProvider.notifier).changingProfile()
                        ..then(
                          (value) {
                            //ログイン失敗
                            if (value.hasError) {
                              showDialog(
                                context: context,
                                builder: (_) => SecondaryCloseDialog(
                                  onPressed: () {
                                    ref
                                        .read(authProvider.notifier)
                                        .switchHasError();
                                    Navigator.of(context).pop();
                                  },
                                  title: "エラー",
                                  subWidget: Text(
                                    I18n().loginErrorText(value.errorText),
                                    textAlign: TextAlign.start,
                                    style: TextStyle(
                                        fontSize: context.width * 0.035,
                                        color: Colors.black87),
                                    maxLines: 2,
                                  ),
                                  doneText: "OK",
                                ),
                              );
                            }
                            //ログイン成功
                            else {
                              showDialog(
                                context: context,
                                barrierDismissible: false,
                                builder: (_) => DefaultCloseDialog(
                                  onPressed: () {
                                    Navigator.of(context).pop();
                                    Navigator.of(context).pop();
                                  },
                                  iconWidget: Icon(
                                    Icons.check_circle_outline_sharp,
                                    size: context.height * 0.1,
                                    color: context.mainColor,
                                  ),
                                  title: "プロフィールが更新されました",
                                  subWidget: null,
                                  doneText: "OK",
                                ),
                              );
                            }
                            ref.read(authProvider.notifier).switchTap();
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
