part of '../home_search_screen.dart';

class _QuizItemList extends ConsumerWidget {
  const _QuizItemList(
      {required this.filteredQuizItemList,
      required this.isScrollLoading,
      required this.maxItemsToDisplay});

  final List<QuizItem> filteredQuizItemList;
  final bool isScrollLoading;
  final int maxItemsToDisplay;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    if (filteredQuizItemList.isEmpty) {
      return const _NotFindResultView();
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
          return _QuizItemCard(index: index, quizItemList: filteredQuizItemList);
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
    final isPremium = ref.watch(authModelProvider).isPremium || !quizItemList[index].isPremium;
    return GestureDetector(
      onTap: () {
        if (!isPremium) {
          showNeedPremiumQuizModal(context);
          HapticFeedback.lightImpact();
        }
      },
      child: Container(
        decoration: BoxDecoration(
          color: isPremium ? Colors.white : Colors.grey.shade200,
          border: Border(bottom: BorderSide(color: context.mainColor, width: 1)),
        ),
        child: Container(
          alignment: Alignment.centerLeft,
          padding: EdgeInsets.only(
              left: context.width * 0.025,
              right: context.width * 0.015,
              top: context.height * 0.015,
              bottom: context.height * 0.01),
          child: Column(
            children: [
              Row(
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Expanded(
                              child: SubstringHighlight(
                                text: quizItemList[index].word,
                                term: termToHighlight,
                                textStyle: context.texts.titleLarge!,
                                overflow: TextOverflow.clip,
                                textStyleHighlight: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: context.mainColor,
                                ),
                              ),
                            ),
                          ],
                        ),
                        const Gap(5),
                        if (isPremium)
                          SubstringHighlight(
                            text: quizItemList[index].comment,
                            term: termToHighlight,
                            textStyle: const TextStyle(color: Colors.black87),
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
                        const Gap(10),
                      ],
                    ),
                  ),
                  if (!isPremium)
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
                ],
              ),
              if (isPremium)
                Row(
                  children: [
                    ///カテゴリ
                    CategoryTag(quizItem: quizItemList[index]),
                    const Gap(5),

                    ///重要度
                    ImportanceTag(quizItem: quizItemList[index]),
                    const Gap(5),

                    ///ステータス
                    StatusTag(quizItem: quizItemList[index]),
                    const Spacer(),

                    ///苦手
                    WeakIconButton(
                      quizItem: quizItemList[index],
                      isShowText: true,
                      size: 32,
                      onTap: () {
                        ref.read(homeSearchScreenProvider.notifier).tapWeakButton(index);
                      },
                    ),

                    ///保存
                    SaveIconButton(
                      quizItem: quizItemList[index],
                      isShowText: true,
                      size: 32,
                      onTap: () {
                        ref.read(homeSearchScreenProvider.notifier).tapSaveButton(index);
                      },
                    ),
                  ],
                ),
            ],
          ),
        ),
      ),
    );
  }
}

class _NotFindResultView extends HookConsumerWidget {
  const _NotFindResultView();

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
