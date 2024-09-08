part of '../quiz_modal.dart';

class _DetailMenu extends HookConsumerWidget {
  const _DetailMenu();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isRepeat = ref.watch(homeQuizModalProvider.select((s) => s.isRepeat));
    final isSaved = ref.watch(homeQuizModalProvider.select((s) => s.isSaved));
    final isWeak = ref.watch(homeQuizModalProvider.select((s) => s.isWeak));
    final studyType = ref.watch(homeQuizModalProvider.select((s) => s.selectedStudyType));
    final quizItemCount = ref.watch(homeQuizModalProvider.select((s) => s.quizItemCount));
    return Container(
      width: context.width,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const _MenuTitle(title: '詳細設定'),
          const Gap(5),
          _CountMenu(
            text: '一度に学習するクイズ',
            icon: LineIcons.clipboardList,
            countValue: quizItemCount,
            onTapIncrement: () {
              ref.read(homeQuizModalProvider.notifier).updateQuizItemCount(5);
            },
            onTapDecrement: () {
              ref.read(homeQuizModalProvider.notifier).updateQuizItemCount(-5);
            },
          ),
          const Gap(5),
          _SwitchMenu(
            text: '「保存」のクイズのみ',
            icon: LineIcons.bookmark,
            isSwitchValue: isSaved,
            onChanged: (bool value) {
              ref.read(homeQuizModalProvider.notifier).updateIsSaved(value);
            },
          ),
          const Gap(5),
          _SwitchMenu(
            text: '「苦手」のクイズのみ',
            icon: LineIcons.checkSquareAlt,
            isSwitchValue: isWeak,
            onChanged: (bool value) {
              ref.read(homeQuizModalProvider.notifier).updateIsWeak(value);
            },
          ),
          const Gap(5),
          if (studyType != StudyType.choice)
            _SwitchMenu(
              text: '「知らない」用語を繰り返す',
              icon: LineIcons.alternateRedo,
              isSwitchValue: isRepeat,
              onChanged: (bool value) {
                ref.read(homeQuizModalProvider.notifier).updateIsRepeat(value);
              },
            ),
        ],
      ),
    );
  }
}

class _SwitchMenu extends HookConsumerWidget {
  const _SwitchMenu({
    required this.text,
    required this.icon,
    required this.isSwitchValue,
    required this.onChanged,
  });

  final String text;
  final IconData icon;
  final bool isSwitchValue;
  final ValueChanged<bool> onChanged;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: context.width * 0.02),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(icon, size: 30),
              const Gap(5),
              Text(
                text,
                style: const TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
              ),
              const Spacer(),
              Switch.adaptive(
                value: isSwitchValue,
                activeColor: context.mainColor,
                activeTrackColor: context.mainColor.withOpacity(0.5),
                inactiveThumbColor: context.secondColor,
                inactiveTrackColor: context.secondColor.withOpacity(0.5),
                materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                onChanged: onChanged,
              ),
              const Gap(5),
            ],
          ),
          const Gap(3),
          Divider(color: Colors.grey.shade300, height: 1),
        ],
      ),
    );
  }
}

class _CountMenu extends HookConsumerWidget {
  const _CountMenu({
    required this.text,
    required this.icon,
    required this.countValue,
    required this.onTapIncrement,
    required this.onTapDecrement,
  });

  final String text;
  final IconData icon;
  final int countValue;
  final VoidCallback onTapIncrement;
  final VoidCallback onTapDecrement;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isMax = countValue == 50;
    final isMin = countValue == 5;
    return Container(
      margin: EdgeInsets.symmetric(horizontal: context.width * 0.02),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(icon, size: 30),
              const Gap(5),
              Text(
                text,
                style: const TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
              ),
              const Spacer(),
              Row(
                children: [
                  IconButton(
                      onPressed: onTapDecrement,
                      icon: Icon(
                        LineIcons.minusCircle,
                        color: isMin ? context.secondColor : context.mainColor,
                        size: 28,
                      )),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.baseline,
                    textBaseline: TextBaseline.alphabetic,
                    children: [
                      Text(
                        '$countValue',
                        style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                      const Gap(3),
                      const Text(
                        '問',
                        style: TextStyle(fontSize: 14),
                      ),
                    ],
                  ),
                  IconButton(
                      onPressed: onTapIncrement,
                      icon: Icon(
                        LineIcons.plusCircle,
                        color: isMax ? context.secondColor : context.mainColor,
                        size: 28,
                      )),
                ],
              ),
              const Gap(5),
            ],
          ),
          const Gap(3),
          Divider(color: Colors.grey.shade300, height: 1),
        ],
      ),
    );
  }
}
