import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:kentei_quiz/resource/controller/extension_resource.dart';
import 'package:kentei_quiz/resource/widget/color_resource.dart';

import '../../controller/home_review/home_review_screen_controller.dart';
import '../../resource/lang/initial_resource.dart';
import '../screen_argument.dart';

part 'home_review_body.dart';
part 'home_review_view.dart';

class HomeReviewScreen extends ConsumerWidget {
  const HomeReviewScreen();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return const ProviderScope(
      child: _Body(),
    );
  }
}
