import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:kentei_quiz/model/extension_resource.dart';
import 'package:kentei_quiz/model/user/user.model.dart';

import '../../view/button/circle_button.dart';
import '../../view/button/primary_button.dart';
import '../screen_argument.dart';

part 'widget/precautions.dart';
part 'widget/premium_content.dart';
part 'widget/premium_content_list.dart';
part 'widget/premium_cta_button.dart';
part 'widget/premium_header.dart';

class PremiumDetailScreen extends ConsumerWidget {
  const PremiumDetailScreen();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      backgroundColor: context.backgroundColor,
      body: const Stack(
        alignment: Alignment.topCenter,
        children: [
          SingleChildScrollView(
            child: Column(
              children: [
                _PremiumHeader(),
                Gap(30),
                _PremiumContentList(),
                Gap(30),
                _Precautions(),
                Gap(120),
              ],
            ),
          ),

          ///購入ボタン
          _CtaButton(),
        ],
      ),
    );
  }
}
