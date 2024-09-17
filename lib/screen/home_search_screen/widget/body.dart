part of '../home_search_screen.dart';

class _Body extends ConsumerWidget {
  const _Body();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isNotTextEmpty = ref.watch(homeSearchScreenProvider.select((s) => s.isNotTextEmpty));
    final searchQuizItemList =
        ref.watch(homeSearchScreenProvider.select((s) => s.searchQuizItemList));
    final maxItemsToDisplay =
        ref.watch(homeSearchScreenProvider.select((s) => s.maxItemsToDisplay));
    final isScrollLoading = ref.watch(homeSearchScreenProvider.select((s) => s.isScrollLoading));
    final textEditingController =
        ref.watch(homeSearchScreenProvider.notifier).textEditingController;
    final scrollController = ref.watch(homeSearchScreenProvider.notifier).scrollController;
    return Stack(
      alignment: Alignment.bottomCenter,
      children: [
        CustomScrollView(
          controller: scrollController,
          slivers: [
            SliverToBoxAdapter(
              child: _SearchHeader(
                textEditingController: textEditingController,
                isNotTextEmpty: isNotTextEmpty,
              ),
            ),
            _QuizItemList(
              filteredQuizItemList: searchQuizItemList,
              isScrollLoading: isScrollLoading,
              maxItemsToDisplay: maxItemsToDisplay,
            ),
            const SliverToBoxAdapter(
              child: Gap(70),
            ),
          ],
        ),
        const AdBanner(),
      ],
    );
  }
}
