part of 'home_search_screen.dart';

class _SearchBar extends ConsumerWidget {
  const _SearchBar(
      {required this.isNotTextEmpty, required this.textEditingController});

  final bool isNotTextEmpty;
  final TextEditingController textEditingController;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Padding(
      padding: EdgeInsets.only(bottom: context.height * 0.005),
      child: Card(
        elevation: 1,
        child: Container(
          color: Colors.grey.shade200,
          padding: EdgeInsets.all(context.width * 0.02),
          child: SearchTextField(
            searchController: textEditingController,
            isTextEmpty: isNotTextEmpty,
            onChanged: (_) {
              ref
                  .read(homeSearchScreenProvider.notifier)
                  .setSearchText(textEditingController.text);
            },
            onFieldSubmitted: (_) {
              ref
                  .read(homeSearchScreenProvider.notifier)
                  .setSearchKeywords(textEditingController.text);
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
  const _QuizResultView(
      {required this.filteredQuizItemList,
      required this.isScrollLoading,
      required this.maxItemsToDisplay});

  final List<QuizItem> filteredQuizItemList;
  final bool isScrollLoading;
  final int maxItemsToDisplay;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    if (filteredQuizItemList.isEmpty) {
      return const _NotFindQuizItem();
    }
    return SliverList(
      delegate: SliverChildBuilderDelegate(
        (BuildContext context, int index) {
          if (index == maxItemsToDisplay) {
            return Center(
              child: SpinKitFadingCircle(
                color: context.mainColor,
                size: context.height * 0.07,
              ),
            );
          }
          return Container(
            decoration: BoxDecoration(
              color: Colors.white,
              border: Border(
                bottom: BorderSide(
                  color: context.mainColor,
                  width: 1,
                ),
              ),
            ),
            child: Row(
              children: [
                const Gap(7),
                Expanded(
                  child: _QuizItemCard(index, filteredQuizItemList),
                ),
                _SavedButton(index: index, quiz: filteredQuizItemList),
                const Gap(5),
              ],
            ),
          );
        },
        childCount: isScrollLoading
            ? maxItemsToDisplay + 1
            : min(maxItemsToDisplay + 1, filteredQuizItemList.length),
      ),
    );
  }
}

class _QuizItemCard extends ConsumerWidget {
  const _QuizItemCard(this.index, this.quiz);

  final int index;
  final List<QuizItem> quiz;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final searchKeywords = ref.watch(homeSearchScreenProvider).searchKeywords;
    final termToHighlight = searchKeywords.join('|');
    return Container(
      alignment: Alignment.centerLeft,
      padding: EdgeInsets.only(
          left: context.width * 0.02,
          right: context.width * 0,
          top: context.height * 0.02,
          bottom: context.height * 0.02),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SubstringHighlight(
            text: quiz[index].ans,
            term: termToHighlight,
            textStyle: context.texts.titleLarge!,
            overflow: TextOverflow.clip,
            textStyleHighlight: TextStyle(
              fontWeight: FontWeight.bold,
              color: context.mainColor,
            ),
          ),
          const Gap(5),
          SubstringHighlight(
            text: quiz[index].question,
            term: termToHighlight,
            textStyle: context.texts.bodyMedium!,
            overflow: TextOverflow.clip,
            textStyleHighlight: TextStyle(
              fontWeight: FontWeight.bold,
              color: context.mainColor,
              decoration: TextDecoration.underline,
            ),
          ),
        ],
      ),
    );
  }
}

class _NotFindQuizItem extends HookConsumerWidget {
  const _NotFindQuizItem();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return SliverToBoxAdapter(
      child: Container(
          alignment: Alignment.center,
          child: Column(
            children: [
              Gap(context.height * 0.02),
              Transform(
                alignment: Alignment.center,
                transform: Matrix4.identity()..rotateY(math.pi),
                child: Icon(
                  LineIcons.search,
                  size: context.height * 0.2,
                  color: Colors.grey.withOpacity(0.3),
                ),
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
          )),
    );
  }
}

class _SavedButton extends HookConsumerWidget {
  const _SavedButton({required this.quiz, required this.index});

  final List<QuizItem> quiz;
  final int index;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return GestureDetector(
      onTap: () =>
          ref.read(homeSearchScreenProvider.notifier).tapSavedButton(index),
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
                "保存",
                style: TextStyle(
                  fontSize: 10,
                  fontWeight: FontWeight.bold,
                  color:
                      quiz[index].isSaved ? context.mainColor : Colors.black26,
                ),
              ),
              Icon(
                quiz[index].isSaved
                    ? Icons.bookmark_sharp
                    : Icons.bookmark_border_sharp,
                size: 30,
                color: quiz[index].isSaved ? context.mainColor : Colors.black26,
              ),
              Gap(context.height * 0.01),
              const Spacer(),
            ],
          ),
        ),
      ),
    );
  }
}
