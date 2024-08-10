part of '../study_modal.dart';

class _StatusMenu extends HookConsumerWidget {
  const _StatusMenu();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Container(
      width: context.width,
      child: const Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _MenuTitle(title: '学習状況'),
          Gap(10),
          _StatusMenuList(),
        ],
      ),
    );
  }
}

class _StatusMenuList extends HookConsumerWidget {
  const _StatusMenuList();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final quizItemList = ref.watch(homeStudyScreenProvider.select((s) => s.quizItemList));
    final goalValue = quizItemList.length;
    final correctValue =
        quizItemList.where((x) => x.status == QuizStatusType.correct).toList().length;
    final incorrectValue =
        quizItemList.where((x) => x.status == QuizStatusType.incorrect).toList().length;
    final learnedValue =
        quizItemList.where((x) => x.status == QuizStatusType.learned).toList().length;
    final unlearnedValue = goalValue - (correctValue + incorrectValue + learnedValue);
    final statusList = ref.watch(homeQuizScreenProvider.select((s) => s.statusList));
    List<StatusCard> _getSortedCards(BuildContext context, List<QuizStatusType> statusList) {
      final List<StatusCard> cards = [
        StatusCard(status: statusList[0], value: unlearnedValue, iconColor: context.secondColor),
        StatusCard(status: statusList[1], value: learnedValue, iconColor: context.backgroundColor),
        StatusCard(status: statusList[2], value: incorrectValue, iconColor: context.incorrectColor),
        StatusCard(status: statusList[3], value: correctValue, iconColor: context.correctColor),
      ];
      cards.sort((a, b) => a.value == 0 ? 1 : -1);
      return cards;
    }

    final sortedCards = _getSortedCards(context, statusList);

    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
        _StatusRecommendCard(
          value: goalValue,
        ),
        ...sortedCards
            .map((card) => _StatusCard(
                  status: card.status,
                  value: card.value,
                  iconColor: card.iconColor,
                ))
            .toList(),
      ]),
    );
  }
}

///出題範囲選択
class _StatusCard extends ConsumerWidget {
  const _StatusCard({
    required this.value,
    required this.status,
    required this.iconColor,
  });

  final int value;
  final QuizStatusType status;
  final Color iconColor;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final selectedStatusList =
        ref.watch(homeQuizScreenProvider.select((s) => s.selectedStatusList));
    final isSelected = selectedStatusList.contains(status);
    final isQuizStatusRecommend =
        ref.watch(homeQuizScreenProvider.select((s) => s.isQuizStatusRecommend));
    final isExists = value != 0;

    return GestureDetector(
      onTap: isExists
          ? () {
              if (isQuizStatusRecommend) {
                ref.read(homeQuizScreenProvider.notifier).setIsisQuizStatusRecommend(false);
              }
              ref.read(homeQuizScreenProvider.notifier).setQuizStatusList(status);
              HapticFeedback.lightImpact();
            }
          : null,
      child: Container(
        width: 85,
        margin: const EdgeInsets.symmetric(horizontal: 3),
        child: Card(
          elevation: 0,
          color: isExists
              ? !isQuizStatusRecommend
                  ? isSelected
                      ? context.backgroundColor.withOpacity(0.5)
                      : Colors.white
                  : Colors.white
              : context.secondColor.withOpacity(0.3),
          shape: RoundedRectangleBorder(
            side: isExists
                ? !isQuizStatusRecommend
                    ? isSelected
                        ? BorderSide(
                            color: context.mainColor,
                            width: 1.5,
                          )
                        : BorderSide(
                            color: Colors.grey.shade300,
                            width: 1.5,
                          )
                    : BorderSide(
                        color: Colors.grey.shade300,
                        width: 1.5,
                      )
                : BorderSide(
                    color: context.secondColor,
                    width: 1,
                  ),
            borderRadius: BorderRadius.circular(8),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Gap(5),
              Container(
                height: 15,
                width: 15,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: iconColor,
                  border: Border.all(
                      width: 1,
                      color: iconColor == context.backgroundColor ? context.mainColor : iconColor),
                ),
              ),
              const Gap(3),
              Text(I18n().quizStatusTypeText(status),
                  style: context.texts.bodyMedium?.copyWith(fontWeight: FontWeight.bold)),
              const Gap(3),
              Text(
                "$value問",
                style: context.texts.bodyMedium?.copyWith(
                  color: isExists
                      ? !isQuizStatusRecommend
                          ? isSelected
                              ? context.mainColor
                              : Colors.black54
                          : Colors.black54
                      : Colors.grey,
                  fontWeight: isExists
                      ? isSelected
                          ? FontWeight.bold
                          : FontWeight.normal
                      : FontWeight.normal,
                ),
              ),
              const Gap(5),
            ],
          ),
        ),
      ),
    );
  }
}

class _StatusRecommendCard extends ConsumerWidget {
  const _StatusRecommendCard({required this.value});

  final int value;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isQuizStatusRecommend =
        ref.watch(homeQuizScreenProvider.select((s) => s.isQuizStatusRecommend));
    final isExists = value != 0;

    return GestureDetector(
      onTap: () {
        if (!isQuizStatusRecommend) {
          ref.read(homeQuizScreenProvider.notifier).setIsisQuizStatusRecommend(true);
          ref.read(homeQuizScreenProvider.notifier).removeQuizStatusList();
          HapticFeedback.lightImpact();
        }
      },
      child: Container(
        width: 85,
        margin: const EdgeInsets.symmetric(horizontal: 3),
        child: Card(
          elevation: 0,
          color: isExists
              ? isQuizStatusRecommend
                  ? context.backgroundColor.withOpacity(0.5)
                  : Colors.white
              : context.secondColor.withOpacity(0.3),
          shape: RoundedRectangleBorder(
            side: isExists
                ? isQuizStatusRecommend
                    ? BorderSide(
                        color: context.mainColor,
                        width: 1.5,
                      )
                    : BorderSide(
                        color: Colors.grey.shade300,
                        width: 1.5,
                      )
                : BorderSide(
                    color: context.secondColor,
                    width: 1,
                  ),
            borderRadius: BorderRadius.circular(8),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Gap(5),
              QuarterCircle(
                size: 15,
                colorList: [
                  context.correctColor,
                  context.backgroundColor,
                  context.incorrectColor,
                  context.secondColor,
                ],
              ),
              const Gap(3),
              Text('すべて', style: context.texts.bodyMedium?.copyWith(fontWeight: FontWeight.bold)),
              const Gap(3),
              Text(
                "全$value問",
                style: context.texts.bodyMedium?.copyWith(
                  color: isExists
                      ? isQuizStatusRecommend
                          ? context.mainColor
                          : Colors.black54
                      : Colors.grey,
                  fontWeight: isExists
                      ? isQuizStatusRecommend
                          ? FontWeight.bold
                          : FontWeight.normal
                      : FontWeight.normal,
                ),
              ),
              const Gap(5),
            ],
          ),
        ),
      ),
    );
  }
}

class StatusCard {
  final QuizStatusType status;
  final int value;
  final Color iconColor;

  StatusCard({required this.status, required this.value, required this.iconColor});
}
