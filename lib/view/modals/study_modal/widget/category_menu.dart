part of '../study_modal.dart';

class _CategoryMenu extends HookConsumerWidget {
  const _CategoryMenu();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Container(
      width: context.width,
      child: const Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _MenuTitle(title: '出題範囲'),
          _CategoryList(),
        ],
      ),
    );
  }
}

class _CategoryList extends ConsumerWidget {
  const _CategoryList();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isPremium = ref.read(authModelProvider).isPremium;
    final premiumQuizList = ref.watch(quizModelProvider.select((s) => s.quizList));
    final freeQuizList = premiumQuizList.where((x) => !x.isPremium).toList();
    final quizList = isPremium ? premiumQuizList : freeQuizList;
    final categoryList = ref.watch(homeStudyModalProvider.select((s) => s.categoryList));
    final selectedCategoryQuizList =
        ref.watch(homeStudyModalProvider.select((s) => s.selectedCategoryQuizList));

    return Column(
      children: [
        ...categoryList.map((category) {
          final categoryAllQuizList =
              premiumQuizList.where((quiz) => quiz.category == category).toList();
          final categoryQuizList = quizList.where((quiz) => quiz.category == category).toList();
          final categoryFilterQuizList =
              selectedCategoryQuizList.where((quiz) => quiz.category == category).toList();
          final isAllSelected = categoryQuizList.length == categoryFilterQuizList.length;
          return Container(
            margin: EdgeInsets.symmetric(horizontal: context.width * 0.02),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Theme(
                  data: Theme.of(context).copyWith(dividerColor: Colors.transparent),
                  child: ExpansionTile(
                    tilePadding: EdgeInsets.zero,
                    childrenPadding: EdgeInsets.zero,
                    title: Container(
                      color: Colors.white,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            category,
                            style: const TextStyle(
                                color: Colors.black54, fontSize: 14, fontWeight: FontWeight.bold),
                          ),
                          Container(
                            width: 30,
                            height: 30,
                            child: IconButton(
                              iconSize: 25,
                              icon: Icon(
                                isAllSelected ? Icons.task_alt : Icons.circle_outlined,
                                color: isAllSelected ? context.mainColor : Colors.black54,
                              ),
                              alignment: Alignment.center,
                              padding: EdgeInsets.zero,
                              onPressed: () {
                                ref.read(homeStudyModalProvider.notifier).updateAllCategoryQuizList(
                                      categoryQuizList: categoryQuizList,
                                      isSelected: isAllSelected,
                                    );
                              },
                            ),
                          ),
                        ],
                      ),
                    ),
                    children: [
                      _CategoryItemList(
                        quizList: categoryAllQuizList,
                        filterQuizList: categoryFilterQuizList,
                      ),
                      const Gap(10),
                    ],
                  ),
                ),
                Divider(color: Colors.grey.shade300, height: 1),
              ],
            ),
          );
        }).toList(),
      ],
    );
  }
}

class _CategoryItemList extends HookConsumerWidget {
  const _CategoryItemList({required this.quizList, required this.filterQuizList});

  final List<Quiz> quizList;
  final List<Quiz> filterQuizList;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Container(
      width: context.width,
      child: Wrap(
        alignment: WrapAlignment.start,
        crossAxisAlignment: WrapCrossAlignment.start,
        spacing: 8,
        runSpacing: 8,
        children: quizList.map((quiz) {
          final isSelected = filterQuizList.any((filteredQuiz) => filteredQuiz.id == quiz.id);
          return _CategoryItemCard(
            quiz: quiz,
            isSelected: isSelected,
          );
        }).toList(),
      ),
    );
  }
}

class _CategoryItemCard extends HookConsumerWidget {
  const _CategoryItemCard({required this.quiz, required this.isSelected});

  final Quiz quiz;
  final bool isSelected;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isPremium = ref.read(authModelProvider).isPremium;
    final isLock = !isPremium && isPremium != quiz.isPremium;
    return GestureDetector(
      onTap: () {
        if (isLock) {
          showPremiumQuizModal(context);
        } else {
          ref
              .read(homeStudyModalProvider.notifier)
              .updateCategoryQuizList(quiz: quiz, isSelected: isSelected);
        }
      },
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 3, horizontal: 5),
        decoration: BoxDecoration(
          color: isLock
              ? Colors.grey.shade200
              : isSelected
                  ? context.backgroundColor.withOpacity(0.5)
                  : Colors.white,
          border: isSelected
              ? Border.all(color: context.mainColor, width: 1.5)
              : Border.all(color: context.secondColor, width: 1.5),
          borderRadius: BorderRadius.circular(20),
        ),
        child: Padding(
          padding: const EdgeInsets.all(3.0),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              if (isLock)
                const Icon(
                  LineIcons.lock,
                  size: 18,
                ),
              const Gap(3),
              Text(
                quiz.title,
                style: TextStyle(
                  color: Colors.black54,
                  fontSize: 12,
                  fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
