import 'dart:math' as math;
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:gap/gap.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:kentei_quiz/controller/home_search_modal/home_search_modal_controller.dart';
import 'package:kentei_quiz/model/extension_resource.dart';
import 'package:kentei_quiz/model/quiz/quiz_model.dart';
import 'package:kentei_quiz/model/user/auth_model.dart';
import 'package:kentei_quiz/view/modals/studys_modal/search_modal.dart';
import 'package:kentei_quiz/view/text_field.dart';
import 'package:line_icons/line_icons.dart';
import 'package:substring_highlight/substring_highlight.dart';

import '../../controller/home_search/home_search_screen_controller.dart';
import '../../model/lang/initial_resource.dart';
import '../../model/quiz_item/quiz_item.dart';
import '../../view/admob/admob_banner.dart';
import '../../view/button_icon/save_button.dart';
import '../../view/button_icon/weak_buton.dart';
import '../../view/modals/need_premium_modal/need_premium_search_modal.dart';
import '../../view/tag/category_tag.dart';
import '../../view/tag/importance_tag.dart';
import '../../view/tag/status_tag.dart';

part 'widget/app_bar.dart';

part 'widget/body.dart';

part 'widget/quiz_item_list.dart';

part 'widget/search_header.dart';

class HomeSearchScreen extends ConsumerWidget {
  const HomeSearchScreen();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isLoading = ref.watch(homeSearchScreenProvider.select((s) => s.isLoading));
    if (isLoading) {
      return Center(
        child: SpinKitFadingCircle(
          color: context.mainColor,
          size: context.height * 0.1,
        ),
      );
    }
    final isSavedFilter = ref.watch(homeSearchScreenProvider.select((s) => s.isSavedFilter));

    return Scaffold(
      appBar: _AppBar(isSavedFilter: isSavedFilter),
      body: const _Body(),
    );
  }
}
