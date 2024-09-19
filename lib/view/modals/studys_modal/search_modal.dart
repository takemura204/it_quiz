import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:gap/gap.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:kentei_quiz/controller/home_search/home_search_screen_controller.dart';
import 'package:kentei_quiz/controller/home_search_modal/home_search_modal_controller.dart';
import 'package:kentei_quiz/model/extension_resource.dart';
import 'package:kentei_quiz/model/quiz/quiz_model.dart';
import 'package:kentei_quiz/view/modals/need_premium_modal/need_premium_quiz_modal.dart';
import 'package:line_icons/line_icons.dart';

import '../../../model/lang/initial_resource.dart';
import '../../../model/quiz/quiz.dart';
import '../../../model/user/auth_model.dart';
import '../../../untils/enums.dart';
import '../../button/primary_button.dart';
import '../../button_icon/clear_button.dart';
import '../../icon/quarter_circle_icon.dart';
import '../dialog.dart';

part 'widget/category_menu.dart';
part 'widget/detail_menu.dart';
part 'widget/footer.dart';
part 'widget/header.dart';
part 'widget/importance_menu.dart';
part 'widget/menu_title.dart';
part 'widget/status_menu.dart';

Future showSearchModal(BuildContext context) async {
  await showModalBottomSheet(
    isScrollControlled: true,
    context: context,
    backgroundColor: Colors.white,
    shape: const RoundedRectangleBorder(
        borderRadius:
            BorderRadius.only(topLeft: Radius.circular(15), topRight: Radius.circular(15))),
    builder: (context) {
      return const SearchModal();
    },
  );
}

class SearchModal extends HookConsumerWidget {
  const SearchModal();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Container(
      height: context.height * 0.65,
      margin: const EdgeInsets.only(top: 15),
      color: Colors.white,
      child: Stack(
        alignment: Alignment.topCenter,
        children: [
          Container(
            margin: EdgeInsets.symmetric(horizontal: context.width * 0.02),
            child: const Scrollbar(
              thumbVisibility: true,
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Gap(50),

                    ///出題範囲
                    _CategoryMenu(),
                    Gap(20),

                    ///学習状況
                    _StatusMenu(),
                    Gap(10),

                    ///重要度
                    _ImportanceMenu(),
                    Gap(10),

                    ///詳細設定
                    _DetailMenu(),

                    Gap(150),
                  ],
                ),
              ),
            ),
          ),
          const Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              _Header(title: '絞り込み'),
              _Footer(),
            ],
          ),
        ],
      ),
    );
  }
}
