part of 'quiz_modal.dart';

///問題範囲
class _StatusCardList extends ConsumerWidget {
  const _StatusCardList({
    required this.goalValue,
    required this.correctValue,
    required this.incorrectValue,
    required this.learnedValue,
    required this.unlearnedValue,
  });

  final int goalValue;
  final int correctValue;
  final int incorrectValue;
  final int learnedValue;
  final int unlearnedValue;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final statusList = ref.watch(homeQuizScreenProvider.select((s) => s.statusList));
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

  List<StatusCard> _getSortedCards(BuildContext context, List<StatusType> statusList) {
    final List<StatusCard> cards = [
      StatusCard(status: statusList[0], value: unlearnedValue, iconColor: context.secondColor),
      StatusCard(status: statusList[1], value: learnedValue, iconColor: context.backgroundColor),
      StatusCard(status: statusList[2], value: incorrectValue, iconColor: context.incorrectColor),
      StatusCard(status: statusList[3], value: correctValue, iconColor: context.correctColor),
    ];
    cards.sort((a, b) => a.value == 0 ? 1 : -1);
    return cards;
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
  final StatusType status;
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
              Text('おすすめ', style: context.texts.bodyMedium?.copyWith(fontWeight: FontWeight.bold)),
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
  final StatusType status;
  final int value;
  final Color iconColor;

  StatusCard({required this.status, required this.value, required this.iconColor});
}
