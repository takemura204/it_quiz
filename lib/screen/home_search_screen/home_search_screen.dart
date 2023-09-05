import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:gap/gap.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:kentei_quiz/model/extension_resource.dart';
import 'package:kentei_quiz/view/text_field.dart';
import 'package:substring_highlight/substring_highlight.dart';

import '../../controller/home_search/home_search_screen_controller.dart';
import '../../model/lang/initial_resource.dart';
import '../../model/quiz_item/quiz_item.dart';

part 'home_search_view.dart';

class HomeSearchScreen extends ConsumerWidget {
  const HomeSearchScreen();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ProviderScope(
      overrides: [
        homeSearchScreenProvider.overrideWith(
          (ref) => HomeSearchScreenController(ref: ref),
        ),
      ],
      child: const _Scaffold(),
    );
  }
}

class _Scaffold extends ConsumerWidget {
  const _Scaffold();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(homeSearchScreenProvider);
    final controller = ref.watch(homeSearchScreenProvider.notifier);
    final isSavedFilter = state.isSavedFilter;
    final isNotTextEmpty = state.isNotTextEmpty;
    final filteredQuizItemList = state.filteredQuizItemList;
    final maxItemsToDisplay = state.maxItemsToDisplay;
    final isLoading = state.isLoading;
    final textEditingController = controller.textEditingController;
    final scrollController = controller.scrollController;

    return Scaffold(
      appBar: _AppBar(isSavedFilter: isSavedFilter),
      body: CustomScrollView(
        controller: scrollController,
        slivers: [
          SliverToBoxAdapter(
            child: _SearchBar(
              textEditingController: textEditingController,
              isNotTextEmpty: isNotTextEmpty,
            ),
          ),
          _QuizResultView(
            filteredQuizItemList: filteredQuizItemList,
            isLoading: isLoading,
            maxItemsToDisplay: maxItemsToDisplay,
          ),
        ],
      ),
    );
  }
}

class _AppBar extends ConsumerWidget implements PreferredSizeWidget {
  const _AppBar({required this.isSavedFilter});

  final bool isSavedFilter;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return AppBar(
      title: Text(I18n().titleSearch),
      centerTitle: true,
      actions: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: context.width * 0.01),
          child: IconButton(
              onPressed: () {
                ref
                    .read(homeSearchScreenProvider.notifier)
                    .tapIsSavedFilterButton();
              },
              icon: Icon(
                isSavedFilter
                    ? Icons.bookmark_outlined
                    : Icons.bookmark_border_outlined,
                size: 35,
                color: isSavedFilter ? context.mainColor : Colors.black26,
              )),
        ),
        const Gap(3),
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
