part of 'home_search_screen.dart';

class _SearchBar extends ConsumerWidget {
  const _SearchBar();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(homeSearchScreenProvider);
    final isValidSearch = state.isValidSearch;
    final isNotTextEmpty = state.isNotTextEmpty;
    final searchController =
        ref.watch(homeSearchScreenProvider.notifier).searchController;
    return Card(
      elevation: 1,
      child: Container(
        color: Colors.grey.shade200,
        child: Padding(
          padding: EdgeInsets.all(context.width * 0.02),
          child: SearchTextField(
            searchController: searchController,
            isValidSearch: isValidSearch,
            isTextEmpty: isNotTextEmpty,
            onChanged: (_) {
              ref
                  .read(homeSearchScreenProvider.notifier)
                  .setSearchText(searchController.text);
            },
            onFieldSubmitted: (_) {
              ref
                  .read(homeSearchScreenProvider.notifier)
                  .setSearchKeywords(searchController.text);
            },
            onClear: () {
              ref.read(homeSearchScreenProvider.notifier).clearSearchText();
            },
          ),
        ),
      ),
    );
  }
}

class _QuizResultView extends ConsumerWidget {
  const _QuizResultView();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(homeSearchScreenProvider);
    final searchKeywords = state.searchKeywords;
    final quizList = ref.watch(quizModelProvider).quizList;
    final quizItemList = quizList.expand((x) => x.quizItemList).toList();

    final filteredQuizItemList = searchKeywords.isEmpty
        ? quizItemList
        : quizItemList.where((item) {
            return searchKeywords.any((keyword) {
              return item.question.contains(keyword);
            });
          }).toList();
    if (filteredQuizItemList.isEmpty) {
      return const _NotFindQuizItem();
    }
    return ListView.builder(
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      itemCount: filteredQuizItemList.length,
      itemBuilder: (BuildContext context, int index) {
        return Card(
          elevation: 1,
          margin: EdgeInsets.symmetric(
              horizontal: context.width * 0.02, vertical: context.width * 0.01),
          color: Colors.white,
          shape: RoundedRectangleBorder(
            side: BorderSide(
              color: context.mainColor,
              width: 2,
            ),
            borderRadius: BorderRadius.circular(15),
          ),
          child: Row(
            children: [
              const Gap(5),
              Expanded(
                child: _QuizItemCard(index, filteredQuizItemList),
              ),
              GestureDetector(
                onTap: () {},
                child: Container(
                  alignment: Alignment.center,
                  width: context.width * 0.1,
                  height: context.height * 0.1,
                  child: Align(
                    alignment: Alignment.center,
                    child: Column(
                      children: [
                        const Spacer(),
                        Text(
                          "苦手",
                          style: TextStyle(
                            fontSize: context.width * 0.025,
                            fontWeight: FontWeight.bold,
                            color: filteredQuizItemList[index].isWeak
                                ? context.mainColor
                                : Colors.black26,
                          ),
                        ),
                        Icon(
                          filteredQuizItemList[index].isWeak
                              ? Icons.check_box_outlined
                              : Icons.check_box_outline_blank,
                          size: context.width * 0.08,
                          color: filteredQuizItemList[index].isWeak
                              ? context.mainColor
                              : Colors.black26,
                        ),
                        Gap(context.height * 0.01),
                        const Spacer(),
                      ],
                    ),
                  ),
                ),
              ),
              const Gap(5),
            ],
          ),
        );
      },
    );
  }
}

class _QuizItemCard extends HookConsumerWidget {
  const _QuizItemCard(this.index, this.quiz);

  final int index;
  final List<QuizItem> quiz;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final searchKeywords = ref.watch(homeSearchScreenProvider).searchKeywords;
    final termToHighlight = searchKeywords.join('|');
    return Container(
      alignment: Alignment.centerLeft,
      padding: EdgeInsets.symmetric(
          horizontal: context.width * 0.02, vertical: context.height * 0.02),
      child: SubstringHighlight(
        text: quiz[index].question,
        term: termToHighlight,
        textStyle: TextStyle(
          color: Colors.black54,
          fontWeight: FontWeight.w500,
          fontSize: context.width * 0.04,
        ),
        overflow: TextOverflow.clip,
        textStyleHighlight: TextStyle(
          fontWeight: FontWeight.bold,
          color: context.mainColor,
          decoration: TextDecoration.underline,
        ),
      ),
    );
  }
}

class _NotFindQuizItem extends HookConsumerWidget {
  const _NotFindQuizItem();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Container(
        alignment: Alignment.center,
        child: Column(
          children: [
            Gap(context.height * 0.02),
            Icon(
              Icons.search_outlined,
              size: context.height * 0.2,
              color: Colors.grey.withOpacity(0.3),
            ),
            Gap(context.height * 0.01),
            Center(
              child: Text("検索結果が見つかりませんでした",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: context.width * 0.04,
                  )),
            ),
            Gap(context.height * 0.02),
          ],
        ));
  }
}
