part of '../search_modal.dart';

class _ImportanceMenu extends HookConsumerWidget {
  const _ImportanceMenu();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Container(
      width: context.width,
      child: const Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _MenuTitle(title: '重要度'),
          Gap(10),
          _ImportanceList(),
        ],
      ),
    );
  }
}

class _ImportanceList extends HookConsumerWidget {
  const _ImportanceList();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final quizList = ref.watch(quizModelProvider.notifier).getQuizList();
    final quizItemList = quizList.expand((x) => x.quizItemList).toList();

    final highValue =
        quizItemList.where((x) => x.importance == ImportanceType.high).toList().length;
    final normalValue =
        quizItemList.where((x) => x.importance == ImportanceType.normal).toList().length;
    final lowValue = quizItemList.where((x) => x.importance == ImportanceType.low).toList().length;
    final noneValue =
        quizItemList.where((x) => x.importance == ImportanceType.none).toList().length;
    final selectedImportanceList =
        ref.watch(homeSearchModalProvider.select((s) => s.selectedImportanceList));
    final importanceList = ref.watch(homeSearchModalProvider.select((s) => s.importanceList));
    List<ImportanceCard> _getSortedCards(
        BuildContext context, List<ImportanceType> importanceList) {
      final List<ImportanceCard> cards = [
        ImportanceCard(importance: importanceList[0], value: highValue),
        ImportanceCard(importance: importanceList[1], value: normalValue),
        ImportanceCard(importance: importanceList[2], value: lowValue),
        ImportanceCard(importance: importanceList[3], value: noneValue),
      ];
      return cards;
    }

    final sortImportanceCards = _getSortedCards(context, importanceList);
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
        _ImportanceDefaultCard(selectedImportanceList: selectedImportanceList),
        ...sortImportanceCards
            .map((card) => _ImportanceCard(
                selectedImportanceList: selectedImportanceList,
                importance: card.importance,
                value: card.value))
            .toList(),
      ]),
    );
  }
}

class _ImportanceDefaultCard extends ConsumerWidget {
  const _ImportanceDefaultCard({required this.selectedImportanceList});

  final List<ImportanceType> selectedImportanceList;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isStatusList = selectedImportanceList.isEmpty;

    return GestureDetector(
      onTap: () {
        if (!isStatusList) {
          ref.read(homeSearchModalProvider.notifier).updateAllImportanceList();
          HapticFeedback.lightImpact();
        }
      },
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 3),
        padding: const EdgeInsets.symmetric(vertical: 3, horizontal: 5),
        decoration: BoxDecoration(
          color: isStatusList ? context.backgroundColor.withOpacity(0.5) : Colors.white,
          border: isStatusList
              ? Border.all(
                  color: context.mainColor,
                  width: 1.5,
                )
              : Border.all(
                  color: Colors.grey.shade300,
                  width: 1.5,
                ),
          borderRadius: BorderRadius.circular(20),
        ),
        child: Padding(
          padding: const EdgeInsets.all(3.0),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Gap(5),
              Text('すべて', style: context.texts.bodyMedium?.copyWith(fontWeight: FontWeight.bold)),
              const Gap(5),
            ],
          ),
        ),
      ),
    );
  }
}

class _ImportanceCard extends ConsumerWidget {
  const _ImportanceCard({
    required this.selectedImportanceList,
    required this.importance,
    required this.value,
  });

  final List<ImportanceType> selectedImportanceList;
  final ImportanceType importance;
  final int value;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isSelected = selectedImportanceList.contains(importance);
    final isStatusList = selectedImportanceList.isEmpty;
    final isExists = value != 0;

    return GestureDetector(
      onTap: isExists
          ? () {
              ref.read(homeSearchModalProvider.notifier).updateImportanceQuizList(importance);
              HapticFeedback.lightImpact();
            }
          : null,
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 3),
        padding: const EdgeInsets.symmetric(vertical: 3, horizontal: 5),
        decoration: BoxDecoration(
          color: isExists
              ? !isStatusList
                  ? isSelected
                      ? context.backgroundColor.withOpacity(0.5)
                      : Colors.white
                  : Colors.white
              : context.secondColor.withOpacity(0.3),
          border: isExists
              ? !isStatusList
                  ? isSelected
                      ? Border.all(
                          color: context.mainColor,
                          width: 1.5,
                        )
                      : Border.all(
                          color: Colors.grey.shade300,
                          width: 1.5,
                        )
                  : Border.all(
                      color: Colors.grey.shade300,
                      width: 1.5,
                    )
              : Border.all(
                  color: context.secondColor,
                  width: 1,
                ),
          borderRadius: BorderRadius.circular(20),
        ),
        child: Padding(
          padding: const EdgeInsets.all(3.0),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Gap(5),
              Text(I18n().quizImportanceText(importance),
                  style: context.texts.bodyMedium?.copyWith(fontWeight: FontWeight.bold)),
              const Gap(5),
            ],
          ),
        ),
      ),
    );
  }
}

class ImportanceCard {
  final ImportanceType importance;
  final int value;

  ImportanceCard({required this.importance, required this.value});
}
