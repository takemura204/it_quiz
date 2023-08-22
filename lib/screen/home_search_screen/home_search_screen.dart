import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:kentei_quiz/model/extension_resource.dart';
import 'package:kentei_quiz/model/quiz/quiz_model.dart';
import 'package:kentei_quiz/view/text_field.dart';
import 'package:substring_highlight/substring_highlight.dart';

import '../../controller/home_search/home_search_screen_controller.dart';
import '../../model/lang/initial_resource.dart';

part 'home_search_view.dart';

class HomeSearchScreen extends ConsumerWidget {
  const HomeSearchScreen();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return const ProviderScope(
      child: _Scaffold(),
    );
  }
}

class _Scaffold extends ConsumerWidget {
  const _Scaffold();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        title: Text(I18n().titleSearch),
      ),
      body: CustomScrollView(
        slivers: [
          SliverList(
            delegate: SliverChildListDelegate(
              [
                ///検索機能
                const _SearchBar(),

                ///検索結果一覧
                const _QuizResultView(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
