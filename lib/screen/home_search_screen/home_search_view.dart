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
          return _QuizItemCard(
              index: index, quizItemList: filteredQuizItemList);
        },
        childCount: isScrollLoading
            ? maxItemsToDisplay + 1
            : min(maxItemsToDisplay + 1, filteredQuizItemList.length),
      ),
    );
  }
}

class _QuizItemCard extends ConsumerWidget {
  const _QuizItemCard({required this.quizItemList, required this.index});

  final List<QuizItem> quizItemList;
  final int index;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final searchKeywords = ref.watch(homeSearchScreenProvider).searchKeywords;
    final termToHighlight = searchKeywords.join('|');
    final isPremium = ref.watch(authModelProvider).isPremium ||
        !quizItemList[index].isPremium;
    return GestureDetector(
      onTap: () {
        if (!isPremium) {
          showDialog(
              context: context,
              builder: (_) => PrimaryDialog(
                    title: '検索用語を全て閲覧しますか？',
                    subWidget: const Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Expanded(
                          child: Text(
                            '支払いは一度きり。プレミアムに登録すると、\n全ての検索用語をを閲覧・保存できます。',
                            style: TextStyle(color: Colors.black87),
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ],
                    ),
                    cancelText: 'キャンセル',
                    doneText: 'プレミアム画面へ',
                    onPressed: () {
                      Navigator.pop(context);
                      context.showScreen(
                          const PremiumDetailScreenArguments().generateRoute());
                    },
                  ));
        }
      },
      child: Container(
        decoration: BoxDecoration(
          color: isPremium ? Colors.white : Colors.grey.shade200,
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
              child: Container(
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
                      text: quizItemList[index].ans,
                      term: termToHighlight,
                      textStyle: context.texts.titleLarge!,
                      overflow: TextOverflow.clip,
                      textStyleHighlight: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: context.mainColor,
                      ),
                    ),
                    const Gap(5),
                    if (isPremium)
                      SubstringHighlight(
                        text: quizItemList[index].comment,
                        term: termToHighlight,
                        textStyle: context.texts.bodyMedium!,
                        overflow: TextOverflow.clip,
                        textStyleHighlight: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: context.mainColor,
                          decoration: TextDecoration.underline,
                        ),
                      )
                    else
                      const Text(
                        'プレミアムで閲覧可能',
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.normal,
                          color: Colors.black54,
                        ),
                      ),
                  ],
                ),
              ),
            ),
            if (isPremium)
              _SavedButton(index: index, quizItemList: quizItemList)
            else
              Container(
                alignment: Alignment.center,
                width: context.width * 0.1,
                height: context.height * 0.1,
                child: const Icon(
                  LineIcons.lock,
                  color: Colors.grey,
                  size: 30,
                ),
              ),
            const Gap(5),
          ],
        ),
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
  const _SavedButton({required this.quizItemList, required this.index});

  final List<QuizItem> quizItemList;
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
                  color: quizItemList[index].isSaved
                      ? context.mainColor
                      : Colors.black26,
                ),
              ),
              Icon(
                quizItemList[index].isSaved
                    ? Icons.bookmark_sharp
                    : LineIcons.bookmark,
                size: 30,
                color: quizItemList[index].isSaved
                    ? context.mainColor
                    : Colors.black26,
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
