part of '../study_modal.dart';

class _DetailMenu extends HookConsumerWidget {
  const _DetailMenu();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isRepeat = ref.watch(homeStudyModalProvider.select((s) => s.isRepeat));
    final isSaved = ref.watch(homeStudyModalProvider.select((s) => s.isSaved));
    final isWeak = ref.watch(homeStudyModalProvider.select((s) => s.isWeak));
    return Container(
      width: context.width,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const _MenuTitle(title: '詳細設定'),
          const Gap(5),
          _SwitchMenu(
            text: '「知らない」用語を繰り返す',
            icon: LineIcons.alternateRedo,
            isSwitchValue: isRepeat,
            onChanged: (bool value) {
              ref.read(homeStudyModalProvider.notifier).updateIsRepeat(value);
            },
          ),
          const Gap(5),
          _SwitchMenu(
            text: '「保存」の用語のみ',
            icon: LineIcons.bookmark,
            isSwitchValue: isSaved,
            onChanged: (bool value) {
              ref.read(homeStudyModalProvider.notifier).updateIsSaved(value);
            },
          ),
          const Gap(5),
          _SwitchMenu(
            text: '「苦手」の用語のみ',
            icon: LineIcons.checkSquareAlt,
            isSwitchValue: isWeak,
            onChanged: (bool value) {
              ref.read(homeStudyModalProvider.notifier).updateIsWeak(value);
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
              Icon(icon, size: 25),
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
                trackColor: context.accentColor,
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
